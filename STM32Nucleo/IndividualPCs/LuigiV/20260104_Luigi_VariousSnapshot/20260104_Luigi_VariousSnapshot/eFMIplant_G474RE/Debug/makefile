################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include Middleware/eFMI/models/PCode_SPE/src/subdir.mk
-include Drivers/STM32G4xx_HAL_Driver/Src/subdir.mk
-include Core/Startup/subdir.mk
-include Core/Src/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

OPTIONAL_TOOL_DEPS := \
$(wildcard ../makefile.defs) \
$(wildcard ../makefile.init) \
$(wildcard ../makefile.targets) \


BUILD_ARTIFACT_NAME := eFMIplant_G474RE
BUILD_ARTIFACT_EXTENSION := elf
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
eFMIplant_G474RE.elf \

MAP_FILES += \
eFMIplant_G474RE.map \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
eFMIplant_G474RE.list \

OBJCOPY_HEX += \
eFMIplant_G474RE.hex \

OBJCOPY_BIN += \
eFMIplant_G474RE.bin \


# All Target
all: main-build

# Main-build Target
main-build: eFMIplant_G474RE.elf secondary-outputs

# Tool invocations
eFMIplant_G474RE.elf eFMIplant_G474RE.map: $(OBJS) $(USER_OBJS) C:\dev\efmi-pss-use-case\STM32Nucleo\IndividualPCs\LuigiV\20260104_Luigi_VariousSnapshot\20260104_Luigi_VariousSnapshot\eFMIplant_G474RE\STM32G474RETX_FLASH.ld makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-gcc -o "eFMIplant_G474RE.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m4 -T"C:\dev\efmi-pss-use-case\STM32Nucleo\IndividualPCs\LuigiV\20260104_Luigi_VariousSnapshot\20260104_Luigi_VariousSnapshot\eFMIplant_G474RE\STM32G474RETX_FLASH.ld" --specs=nosys.specs -Wl,-Map="eFMIplant_G474RE.map" -Wl,--gc-sections -static --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -u _printf_float -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

eFMIplant_G474RE.list: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "eFMIplant_G474RE.list"
	@echo 'Finished building: $@'
	@echo ' '

eFMIplant_G474RE.hex: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objcopy  -O ihex $(EXECUTABLES) "eFMIplant_G474RE.hex"
	@echo 'Finished building: $@'
	@echo ' '

eFMIplant_G474RE.bin: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objcopy  -O binary $(EXECUTABLES) "eFMIplant_G474RE.bin"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) default.size.stdout eFMIplant_G474RE.bin eFMIplant_G474RE.elf eFMIplant_G474RE.hex eFMIplant_G474RE.list eFMIplant_G474RE.map
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST) $(OBJCOPY_HEX) $(OBJCOPY_BIN)

fail-specified-linker-script-missing:
	@echo 'Error: Cannot find the specified linker script. Check the linker settings in the build configuration.'
	@exit 2

warn-no-linker-script-specified:
	@echo 'Warning: No linker script specified. Check the linker settings in the build configuration.'

.PHONY: all clean dependents main-build fail-specified-linker-script-missing warn-no-linker-script-specified

-include ../makefile.targets
