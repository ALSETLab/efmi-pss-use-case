within 'eFMU experiment package (efmuPSS, efmiPSSusecase.Experiments.Example_3_PSSDesign4PSSVariantClocked)';
function resolve_container "Resolve the root directory of the eFMI Behavioral Model container backing
     this package. The directory is created on request if it does not exist yet."

  extends .DymolaEmbedded.Icons.Configuration;

  input Boolean create_directory=true "Whether the directory of the backing eFMI Behavioral Model container
       shall be created or not.";

  output String container_directory "Absolute path of the Dymola-administered eFMI Behavioral Model
       container for the test scenarios of this package.";
  output Boolean container_exists
    "Whether the eFMI Behavioral Model container exists or not.";
  output String experiment_package "Full qualified name of this eFMU experiment package, i.e., the package
       defining the eFMI Behavioral Model container.";

protected
  String build_directory;

algorithm
  experiment_package := getInstanceName();
  experiment_package := .Modelica.Utilities.Strings.substring(
    experiment_package,
    1,
    .Modelica.Utilities.Strings.findLast(experiment_package,
      ".resolve_container") - 1);
  (build_directory,,) := configuration.configuration_resources();
  container_directory := build_directory + "/eFMU/BModel_Dymola_" + hashString(
    experiment_package);
  container_exists := .Modelica.Utilities.Files.exist(container_directory);
  if create_directory and not (container_exists) then
    .Modelica.Utilities.Files.createDirectory(container_directory);
  end if;

  annotation (preferredView="info", Protection(hideFromBrowser=true));
end resolve_container;
