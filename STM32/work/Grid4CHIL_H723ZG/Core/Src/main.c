/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2026 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "adc.h"
#include "dac.h"
#include "tim.h"
#include "gpio.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "block.h"
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */
#define CONCAT_INNER(a, b) a##b
#define CONCAT(a, b) CONCAT_INNER(a, b)

/* Define shortcut names for unique, hash-based eFMU API: */
#define MODEL_HASH \
  Hcbd8c48e05b139646178cc6f7987b8955b6ce985_cb4a8a449b4ada864625ee5a4355578a3aaf08ed
typedef CONCAT(BlockState_, MODEL_HASH) \
  ModelGrid;
typedef CONCAT(SPE_Real_, MODEL_HASH) \
  Grid_Real;
typedef CONCAT(SPE_ErrorSignal_, MODEL_HASH) \
  Grid_ErrorSignal;

#define Grid_NONE_ERRORSIGNAL \
  CONCAT(SPE_ERRORSIGNAL_NONE_, MODEL_HASH)
#define Grid_UNSPECIFIED_ERRORSIGNAL \
  CONCAT(SPE_ERRORSIGNAL_UNSPECIFIED_ERROR_, MODEL_HASH)

#define Grid_Startup \
  CONCAT(Startup_, MODEL_HASH)
#define Grid_DoStep \
  CONCAT(DoStep_, MODEL_HASH)
#define Grid_Recalibrate \
  CONCAT(Recalibrate_, MODEL_HASH)
#define Grid_Reinitialize \
  CONCAT(Reinitialize_, MODEL_HASH)
/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */
/* Sampling activation counter: */
static volatile uint8_t pending_samplings;
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MPU_Config(void);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{

  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MPU Configuration--------------------------------------------------------*/
  MPU_Config();

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_ADC1_Init();
  MX_DAC1_Init();
  MX_TIM2_Init();
  /* USER CODE BEGIN 2 */
  /* Initialize error signaling: */
  Grid_ErrorSignal error_signals = Grid_NONE_ERRORSIGNAL;
  uint32_t error_timestamp = ((uint32_t) 0);

  /* Pre-compute constants: */
  const uint32_t POLL_TIMEOUT =
   ((uint32_t) 1); /* in ms */
  const Grid_Real ADC_TO_VOLTS =
    ((Grid_Real) 3.3) / ((Grid_Real) 4095.0);
  const Grid_Real VOLTS_TO_DAC =
    ((Grid_Real) 4095.0) / ((Grid_Real) 3.3);
  const Grid_Real DAC_MAX =
    ((Grid_Real) 4095.0);
  const Grid_Real DAC_MIN =
    ((Grid_Real) 0.0);
  const Grid_Real VF_OFFSET =
    ((Grid_Real) 1.5);

  /* Initialize the eFMU: */
  ModelGrid grid;
  Grid_Startup(&grid);
  error_signals |= grid.ErrorSignals;
  if (Grid_NONE_ERRORSIGNAL != error_signals)
  { /* Block and blink the error LED if initialization failed: */
    while (true)
    {
      HAL_GPIO_WritePin(RedLD3_GPIO_Port, RedLD3_Pin, GPIO_PIN_SET);
      uint32_t start = HAL_GetTick();
      while ((HAL_GetTick() - start) < ((uint32_t) 2000))
      {
      }
      HAL_GPIO_WritePin(RedLD3_GPIO_Port, RedLD3_Pin, GPIO_PIN_RESET);
      start = HAL_GetTick();
      while ((HAL_GetTick() - start) < ((uint32_t) 2000))
      {
      }
    }
  }

  /* Start the sampling timer and DAC channels: */
  pending_samplings = ((uint8_t) 0);
  HAL_DAC_Start(&hdac1, DAC_CHANNEL_2);
  HAL_TIM_Base_Start_IT(&htim2);
  __enable_irq();
  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
	    /*
	      Conduct sampling if the sampling timer ticked:
	    */
	    if (pending_samplings > ((uint8_t) 0))
	    {
	      /* Always reset the error signals: */
	      error_signals = Grid_NONE_ERRORSIGNAL;

	      /* Provide computation time feedback for external profiling: */
	      HAL_GPIO_WritePin(calcTime_D2_GPIO_Port, calcTime_D2_Pin, GPIO_PIN_SET);

	      /* Digital input processing: */
	      grid.fault = (GPIO_PIN_SET == HAL_GPIO_ReadPin(
	    	BlueButtonB1_GPIO_Port,
			BlueButtonB1_Pin));

	      /* Analog input processing: */
	      HAL_ADC_Start(&hadc1);
	      if (HAL_OK == HAL_ADC_PollForConversion(&hadc1, POLL_TIMEOUT))
	      {
	        const uint32_t adc_raw = HAL_ADC_GetValue(&hadc1);
	        grid.vf = (((Grid_Real) adc_raw) * ADC_TO_VOLTS) - VF_OFFSET;
	      }
	      else
	      {
	        error_signals |= Grid_UNSPECIFIED_ERRORSIGNAL;
	      }
	      HAL_ADC_Stop(&hadc1);

	      /* Compute sampling step: */
	      Grid_DoStep(&grid);
	      error_signals |= grid.ErrorSignals;

	      /* Output processing (scaling, clamping, converting volt to AC): */
	      Grid_Real dac_w_val = grid.w * VOLTS_TO_DAC;
	      if (DAC_MIN > dac_w_val)
	      {
	        dac_w_val = DAC_MIN;
	      }
	      else if (DAC_MAX < dac_w_val)
	      {
	        dac_w_val = DAC_MAX;
	      }
	      HAL_DAC_SetValue(
	        &hdac1,
	        DAC_CHANNEL_2,
	        DAC_ALIGN_12B_R,
	        ((uint32_t) dac_w_val));

	      /* Provide computation time feedback for external profiling: */
	      HAL_GPIO_WritePin(calcTime_D2_GPIO_Port, calcTime_D2_Pin, GPIO_PIN_RESET);

	      --pending_samplings;
	    }

	    /*
	      Check if any errors are signaled from the last sampling, or an overrun
	      occurred. If so, set the error LED on:
	    */
	    if ((Grid_NONE_ERRORSIGNAL != error_signals)
	      || (pending_samplings > ((uint8_t) 1)))
	    {
	      error_timestamp = HAL_GetTick();
	      HAL_GPIO_WritePin(RedLD3_GPIO_Port, RedLD3_Pin, GPIO_PIN_SET);
	    }

	    /*
	      If the error LED is currently on due to a past error, check if 30000 ms
	      have passed since the last error occurred. If so, turn off the LED:
	    */
	    if ((((uint32_t) 0) != error_timestamp)
	      && (((uint32_t) 30000) < (HAL_GetTick() - error_timestamp)))
	    {
	      HAL_GPIO_WritePin(RedLD3_GPIO_Port, RedLD3_Pin, GPIO_PIN_RESET);
	      error_timestamp = ((uint32_t) 0);
	    }
	  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Supply configuration update enable
  */
  HAL_PWREx_ConfigSupply(PWR_LDO_SUPPLY);

  /** Configure the main internal regulator output voltage
  */
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE0);

  while(!__HAL_PWR_GET_FLAG(PWR_FLAG_VOSRDY)) {}

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_DIV1;
  RCC_OscInitStruct.HSICalibrationValue = 64;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
  RCC_OscInitStruct.PLL.PLLM = 4;
  RCC_OscInitStruct.PLL.PLLN = 17;
  RCC_OscInitStruct.PLL.PLLP = 1;
  RCC_OscInitStruct.PLL.PLLQ = 4;
  RCC_OscInitStruct.PLL.PLLR = 2;
  RCC_OscInitStruct.PLL.PLLRGE = RCC_PLL1VCIRANGE_3;
  RCC_OscInitStruct.PLL.PLLVCOSEL = RCC_PLL1VCOWIDE;
  RCC_OscInitStruct.PLL.PLLFRACN = 1536;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2
                              |RCC_CLOCKTYPE_D3PCLK1|RCC_CLOCKTYPE_D1PCLK1;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.SYSCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB3CLKDivider = RCC_APB3_DIV2;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_APB1_DIV2;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_APB2_DIV2;
  RCC_ClkInitStruct.APB4CLKDivider = RCC_APB4_DIV2;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_3) != HAL_OK)
  {
    Error_Handler();
  }
}

/* USER CODE BEGIN 4 */
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
  if (TIM2 == htim->Instance)
  {
    if (pending_samplings < ((uint8_t) 255))
    {
      ++pending_samplings;
    }
    HAL_GPIO_TogglePin(stepSize_D3_GPIO_Port, stepSize_D3_Pin);
  }
}
/* USER CODE END 4 */

 /* MPU Configuration */

void MPU_Config(void)
{
  MPU_Region_InitTypeDef MPU_InitStruct = {0};

  /* Disables the MPU */
  HAL_MPU_Disable();

  /** Initializes and configures the Region and the memory to be protected
  */
  MPU_InitStruct.Enable = MPU_REGION_ENABLE;
  MPU_InitStruct.Number = MPU_REGION_NUMBER0;
  MPU_InitStruct.BaseAddress = 0x0;
  MPU_InitStruct.Size = MPU_REGION_SIZE_4GB;
  MPU_InitStruct.SubRegionDisable = 0x87;
  MPU_InitStruct.TypeExtField = MPU_TEX_LEVEL0;
  MPU_InitStruct.AccessPermission = MPU_REGION_NO_ACCESS;
  MPU_InitStruct.DisableExec = MPU_INSTRUCTION_ACCESS_DISABLE;
  MPU_InitStruct.IsShareable = MPU_ACCESS_SHAREABLE;
  MPU_InitStruct.IsCacheable = MPU_ACCESS_NOT_CACHEABLE;
  MPU_InitStruct.IsBufferable = MPU_ACCESS_NOT_BUFFERABLE;

  HAL_MPU_ConfigRegion(&MPU_InitStruct);
  /* Enables the MPU */
  HAL_MPU_Enable(MPU_PRIVILEGED_DEFAULT);

}

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}
#ifdef USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
