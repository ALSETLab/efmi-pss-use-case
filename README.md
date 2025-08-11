# efmi-pss-use-case
Models and resources for the application of eFMI to the use case of a power system stabilizer (i.e., damping control system).

## QuickStart
### A. Setup the environment and load the project files
1. Launch Dymola and connect to the 3DEXPERIENCE platform: ``Dymola > Tools > 3DEXPERIENCE > Connection``
    - If successful, your user name and information will be displayed in a new pop-up, similar to the one shown below: 
    <img src="./docs/images/3dexconinf.png" width=300>
2. Load the OpenIPSL library from the linked dependency as described below.
3. Load the `PSSDesign` package, described below.
4. Load the `efmiPSSusecase` package, described below, this is the main package to be used.
5. Set the working directory. 
  - Note: the directory path should not be long, else, an error ``eFMU generation path exceeds max. path length limit`` can appear which requires to change the working directory. The default Dymola working directory is recommended.

### B. Build the eFMU
- Build the complete eFMU by executing the function ``efmiPSSusecase.eBlockDymolaEmbedded.build()``
    <img src="./docs/images/efmubuildcmd.png" width=200>

- The generated files will be in the working directory. Within this repository, the files have been copied to ``./Modelica/eFMUs``


## Packages and Dependencies
### A. Linked Dependencies
- The latest version of OpenIPSL is already linked via sub-modules and can be found under ``./dependencies/OpenIPSL``
### B. Packages Required
Under ``./Modelica/`` the two required packages can be found:
- `PSSDesign` contains the power system models with different plant architectures that are extended to create the new model to test the `eBlock` with the generated `eFMU`.
- `efmiPSSusecase` contains the package with the modified PSS model to generate the `eBlock` and the `eBlock` inheriting from `DymolaEmbedded.EmbeddedConfiguration`.

### C. Shortcuts
Several shortcuts that call Modelica scripts to open the dependencies have been configured for different PCs and can be found under ``./Shortcuts``. You can copy and edit them to reuse them for your own machine.

## Requirements and TroubleShooting
The following should be available and adequately configurated 
- Ensure that that the 3DExperience account has been linked:
    - To verify call the function ``DymolaEmbedded.UsersGuide.Requirements.link_3DEXPERIENCE_account``
    - If not linked, call the function: ``DymolaEmbedded.UsersGuide.Requirements.link_3DEXPERIENCE_account``

- Java 17 has been installed, the version used herein is [jdk-17.0.12_windows-x64_bin](https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html)
  - The following environment variables need to be configured and point to the Java installation root directory: ``DYMOLA_JAVA_HOME`` and ``JAVA_HOME``
  - The ``PATH`` environment variable needs to also point to the `./bin` directory within the Java installation folder.
  - Verify that the ``DYMOLA_JAVA_HOME`` variable has been set up propertly by going to: ``Dymola > Tools> Options> General``, under "Java runtime" the folder pointing to the Java installation directory should be listed.

### Build Issues
When attempting to build the eFMU, several issues were faced.
- Although Java appears to be properly installed and configured, the following error might appear when attempting to build the eFMU: see [here](./docs/excerpts/dymjavaerror01.md)
- While this is pointed as a Java error, testing in a different computer shows the following error: see [here](./docs/excerpts/dymbuilderror02.md).
