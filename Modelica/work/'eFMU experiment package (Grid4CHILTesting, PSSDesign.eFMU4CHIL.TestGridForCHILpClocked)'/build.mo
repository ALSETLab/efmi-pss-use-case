within 'eFMU experiment package (Grid4CHILTesting, PSSDesign.eFMU4CHIL.TestGridForCHILpClocked)';
function build "Build the Behavioral Model container administered by this
     eFMU experiment package."

  extends .DymolaEmbedded.Icons.Runtime;
  extends .DymolaEmbedded.Icons.Build;

  output Boolean succeeded "Whether the build succeeded or failed.";
  output String error_message "Error message in case the build failed.";

protected
  String experiment_package;
  .DymolaEmbedded.BuildUtilities.BinaryCode.BinaryStubGeneration.InterfaceComponent[
    :] interface;

algorithm
  interface := 'Grid4CHILTesting.eFMU_SiL_Support'.resolve_interface();
  (,,experiment_package) := resolve_container();
  (succeeded,error_message) :=
    .DymolaEmbedded.BuildUtilities.BehavioralModel.build(
    experiment_package=experiment_package,
    interface=interface);

  annotation (preferredView="info", __Dymola_interactive=true);
end build;
