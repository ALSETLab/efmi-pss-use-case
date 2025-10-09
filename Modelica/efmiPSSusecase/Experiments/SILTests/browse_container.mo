within efmiPSSusecase.Experiments.SILTests;
function browse_container "Open the root directory of the eFMI Behavioral Model container backing
     this package."

  extends .DymolaEmbedded.Icons.Terminal;

  input Boolean open_file_manager=true "Shall the container directory be opened in the operating system's
       default file manager?";

  output String container_directory "Absolute path of the Dymola-administered eFMI Behavioral Model
       container for the test scenarios of this package.";
  output Boolean container_exists
    "Whether the eFMI Behavioral Model container exists or not.";

algorithm
  (container_directory,container_exists,) := resolve_container(
    create_directory=false);
  if open_file_manager then
    if container_exists then
      () := .DymolaCommands.System.Execute(
        file="cmd /c start \"\" \"" + container_directory + "\"",
        terminal=false,
        wait=false);
    else
      assert(false, "\n\nERROR (browse_container):" +
        "\n  Behavioral Model container not built yet; cannot browse its content.\n\n");
    end if;
  end if;

  annotation (preferredView="info", __Dymola_interactive=true);
end browse_container;
