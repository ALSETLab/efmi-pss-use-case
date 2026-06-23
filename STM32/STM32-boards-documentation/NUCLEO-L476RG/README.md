# NUCLEO-L476RG Nucleo-64 board

* This guide was downloaded from [keil.arm.com](https://www.keil.arm.com/boards/stmicroelectronics-nucleo-l476rg-revc-1e04915/documentation/).
* The *.pdfs in this sub-directory were also downloaded from the website listed above.

Compiled on 2026/3/26 by [@LVANFRETTI](https://github.com/lvanfretti).

## Overview

The STM32 Nucleo-64 board provides an affordable and flexible way for users to try out new concepts and build prototypes by choosing from the various combinations of performance and power consumption features, provided by the STM32 microcontroller. For the compatible boards, the internal or external SMPS significantly reduces power consumption in Run mode. The ARDUINO® Uno V3 connectivity support and the ST morpho headers allow the easy expansion of the functionality of the STM32 Nucleo open development platform with a wide choice of specialized shields.

The STM32 Nucleo-64 board does not require any separate probe as it integrates the ST-LINK debugger/programmer.

## Getting started

- [User manual](https://www.st.com/resource/en/user_manual/um2153-discovery-kit-for-iot-node-multichannel-communication-with-stm32l4-stmicroelectronics.pdf")

### ST-LINK driver installation and firmware upgrade (on Microsoft Windows)

1. Download the latest [ST-LINK driver](https://www.st.com/en/development-tools/stsw-link009.html).
2. Extract the archive and run `dpinst_amd64.exe`. Follow the displayed instructions.
3. Download the latest [ST-LINK firmware upgrade](https://www.st.com/en/development-tools/stsw-link007.html).
4. Extract the archive and run the `ST-LinkUpgrade.exe` program.
5. Connect the board to your PC using a USB cable and wait until the USB enumeration is completed.
6. In the **ST-Link Upgrade** program, press the **Device Connect** button.
7. When the ST-LINK driver is correctly installed, the current ST-LINK version is displayed.
8. Press the **Yes >>>>** button to start the firmware upgrade process.

## Technical reference

- [STM32L476 microcontroller](https://www.st.com/en/microcontrollers-microprocessors/stm32l476rg.html)
- [NUCLEO-L476RG board](https://www.st.com/en/evaluation-tools/nucleo-l476rg.html)
- [User manual](https://www.st.com/resource/en/user_manual/um1724-stm32-nucleo64-boards-mb1136-stmicroelectronics.pdf)
- [Data brief](https://www.st.com/resource/en/data_brief/nucleo-l476rg.pdf)
- [Schematic](https://www.st.com/resource/en/schematic_pack/mb1136-default-c03_schematic.pdf)
