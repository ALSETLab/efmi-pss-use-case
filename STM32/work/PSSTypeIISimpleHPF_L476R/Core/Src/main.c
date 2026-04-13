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
#include "usart.h"
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
	H225c1baf6cf5a31bc9b0c38998c32298f6f0531c_cb4a8a449b4ada864625ee5a4355578a3aaf08ed

typedef CONCAT(BlockState_, MODEL_HASH) \
	ModelPSS;
typedef CONCAT(SPE_Real_, MODEL_HASH) \
	PSS_Real;
typedef CONCAT(SPE_ErrorSignal_, MODEL_HASH) \
	PSS_ErrorSignal;

#define PSS_NONE_ERRORSIGNAL \
	CONCAT(SPE_ERRORSIGNAL_NONE_, MODEL_HASH)

#define PSS_Startup \
	CONCAT(Startup_, MODEL_HASH)
#define PSS_DoStep \
	CONCAT(DoStep_, MODEL_HASH)
#define PSS_Recalibrate \
	CONCAT(Recalibrate_, MODEL_HASH)
#define PSS_Reinitialize \
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
static ModelPSS pss;

/* Button toggle state and debounce tracking: */
volatile bool override_active = false;
volatile uint32_t last_override_button_press = ((uint32_t) 0);

/* Profiling and errors: */
volatile uint32_t pss_cycles = ((uint32_t) 0);
volatile bool error_flag = false;
volatile uint32_t last_error_tick = ((uint32_t) 0);
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
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
  MX_USART2_UART_Init();
  MX_ADC1_Init();
  MX_DAC1_Init();
  MX_TIM1_Init();


  /* USER CODE BEGIN 2 */
  /* Enable the DWT (data watchpoint and trigger) cycle counter: */
  CoreDebug->DEMCR |= CoreDebug_DEMCR_TRCENA_Msk;
  DWT->CYCCNT = ((uint32_t) 0);
  DWT->CTRL |= DWT_CTRL_CYCCNTENA_Msk;

  /* Initialize the eFMU: */
  PSS_Startup(&pss);
  error_flag = (PSS_NONE_ERRORSIGNAL == pss.ErrorSignals);

  /* Start the sampling timer: */
  HAL_DAC_Start(&hdac1, DAC_CHANNEL_1);
  HAL_TIM_Base_Start_IT(&htim1);
  __enable_irq();
  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
    /*
      If the LED is currently ON due to an error, check if 5000 ms have
      passed since the last error occurred. If so, turn off the LED and
      reset the flag:
    */
    if (error_flag
      && (((uint32_t) 5000) < (HAL_GetTick() - last_error_tick)))
    {
      HAL_GPIO_WritePin(LD2__GPIO_Port, LD2__Pin, GPIO_PIN_RESET);
      error_flag = false;
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

  /** Configure the main internal regulator output voltage
  */
  if (HAL_PWREx_ControlVoltageScaling(PWR_REGULATOR_VOLTAGE_SCALE1) != HAL_OK)
  {
	Error_Handler();
  }

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
  RCC_OscInitStruct.PLL.PLLM = 1;
  RCC_OscInitStruct.PLL.PLLN = 10;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV7;
  RCC_OscInitStruct.PLL.PLLQ = RCC_PLLQ_DIV2;
  RCC_OscInitStruct.PLL.PLLR = RCC_PLLR_DIV2;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
	Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
							  |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_4) != HAL_OK)
  {
	Error_Handler();
  }
}

/* USER CODE BEGIN 4 */
void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin)
{
  /* Check if interrupt triggered by blue button (PC13): */
  if (B1__Pin == GPIO_Pin)
  {
    uint32_t current_time = HAL_GetTick();
    if (((uint32_t) 250) < (current_time - last_override_button_press))
    { /* Debounce: Only accept press if 250 ms passed since last: */
      override_active = !override_active;
      last_override_button_press = current_time;
    }
  }
}

void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
  if (TIM1 == htim->Instance)
  {
    /* Initialize profiling (check for errors and overruns): */
    uint32_t start_cycles = DWT->CYCCNT;
    PSS_ErrorSignal error_signals = PSS_NONE_ERRORSIGNAL;

    /* Pre-computed static constants: */
    static const uint32_t CYCLES_PER_MS =
      ((uint32_t) 80000); /* 80 MHz clock = 80,000 cycles/ms. */
    static const uint32_t POLL_TIMEOUT =
      ((uint32_t) 1); /* in ms */
    static const PSS_Real ADC_TO_VOLTS =
      ((PSS_Real) 3.3) / ((PSS_Real) 4095.0);
    static const PSS_Real VOLTS_TO_DAC =
      ((PSS_Real) 4095.0) / ((PSS_Real) 3.3);
    static const PSS_Real DAC_MAX =
      ((PSS_Real) 4095.0);
    static const PSS_Real DAC_MIN =
      ((PSS_Real) 0.0);
    static const PSS_Real OFFSET =
      ((PSS_Real) 1.5);
    static const PSS_Real CONSTANT_PU =
      ((PSS_Real) 0.0);

    HAL_GPIO_TogglePin(stepSize_GPIO_Port, stepSize_Pin);
    HAL_GPIO_WritePin(calTime_GPIO_Port, calTime_Pin, GPIO_PIN_SET);

    /* Input processing (convert AC to volt): */
    HAL_ADC_Start(&hadc1);
    if (HAL_OK == HAL_ADC_PollForConversion(&hadc1, POLL_TIMEOUT))
    {
      const uint32_t adc_raw = HAL_ADC_GetValue(&hadc1);
      pss.vSI = ((PSS_Real) adc_raw) * ADC_TO_VOLTS;
    }
    else
    { /* Failed to get input in time => trigger later overrun error: */
    	start_cycles = ((uint32_t) 0);
    }
    HAL_ADC_Stop(&hadc1);

    /* Compute sampling step: */
    PSS_DoStep(&pss);
    error_signals |= pss.ErrorSignals;

    /* Check if switch is pulling to GND: */
    const PSS_Real target_pu = !override_active
      ? pss.vs
      : CONSTANT_PU;

    /* Output processing, including clamping (convert volt to AC): */
    PSS_Real dac_val = (target_pu + OFFSET) * VOLTS_TO_DAC;
    if (DAC_MIN > dac_val)
    {
      dac_val = DAC_MIN;
    }
    else if (DAC_MAX < dac_val)
    {
      dac_val = DAC_MAX;
    }
    HAL_DAC_SetValue(
      &hdac1,
      DAC_CHANNEL_1,
      DAC_ALIGN_12B_R,
      ((uint32_t) dac_val));

    HAL_GPIO_WritePin(calTime_GPIO_Port, calTime_Pin, GPIO_PIN_RESET);

    /* End profiling (check for errors and overruns): */
    pss_cycles = (DWT->CYCCNT - start_cycles);
    if ((PSS_NONE_ERRORSIGNAL != error_signals)
      || (CYCLES_PER_MS < pss_cycles))
    {
      error_flag = true;
      last_error_tick = HAL_GetTick(); /* Reset 5 s cooldown. */
      HAL_GPIO_WritePin(LD2__GPIO_Port, LD2__Pin, GPIO_PIN_SET);
    }
  }
}
/* USER CODE END 4 */

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
