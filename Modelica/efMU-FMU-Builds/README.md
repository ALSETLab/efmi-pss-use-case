# eFMU-FMU-Builds Directory

This directory contains the FMU exported from Dymola and OpenModelica, and the eFMUs generated through Dymola and the Software Production Engineering Tool.

The package `ExportedFMUS` requires to have installed the `Modelica-FMI`, which you can find at [Modelica-FMI](here.)

# Usage
After installing, downloading and loading the `Modelica-FMI` Library (see below), you can load the `ExportedFMUs` package and browse the examples under `Test`.

## Install, Download and Load the Modelica-FMI library
### Installation in your Computer
See instructions [here](https://github.com/modelica/Modelica-FMI#:~:text=to%20a%20file-,Installation,-To%20import%20FMUs)

### Library Download and Installation in Dymola
One needs to download the release version of the library from [Releases](https://github.com/modelica/Modelica-FMI/releases). Version v.0.0.8 was used in development.

In Dymola, install the library by going to `Tools>Library Management>Install` and as destination select `Working Directory` if you prefer (this is the choice used under development).

### Load Library in Dymola
In Dymola, go to `File>Libraries>FMI`, this will make available the library in the `Package Browser` and the `FMU Import` menu will be made available under `Tools`.