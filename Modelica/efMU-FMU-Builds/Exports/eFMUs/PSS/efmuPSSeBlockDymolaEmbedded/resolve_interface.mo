within efmuPSSeBlockDymolaEmbedded;
function resolve_interface
  "Retrieve the eBlock interface of the stub."
  extends .DymolaEmbedded.Icons.SourceCodeAnalysis;

  output .DymolaEmbedded.BuildUtilities.BinaryCode.BinaryStubGeneration.InterfaceComponent[:] interface
    "The stub's eFMI interface.";

algorithm
  interface := {
    .DymolaEmbedded.BuildUtilities.BinaryCode.BinaryStubGeneration.InterfaceComponent(
      io_type = .DymolaEmbedded.BuildUtilities.BinaryCode.BinaryStubGeneration.InterfaceComponent.IOType.Input,
      primitive_type = .DymolaEmbedded.BuildUtilities.BinaryCode.BinaryStubGeneration.InterfaceComponent.PrimitiveType.Real,
      type_name = "Modelica.Blocks.Interfaces.RealInput",
      dimensionality = fill(0, 0),
      component_name = "vSI",
      value = "",
      description = "PSS input signal ",
      placement = "Placement(transformation(extent={{-140,-20},{-100,20}}), iconTransformation(extent={{-140,-20},{-100,20}}))"),
    .DymolaEmbedded.BuildUtilities.BinaryCode.BinaryStubGeneration.InterfaceComponent(
      io_type = .DymolaEmbedded.BuildUtilities.BinaryCode.BinaryStubGeneration.InterfaceComponent.IOType.Output,
      primitive_type = .DymolaEmbedded.BuildUtilities.BinaryCode.BinaryStubGeneration.InterfaceComponent.PrimitiveType.Real,
      type_name = "Modelica.Blocks.Interfaces.RealOutput",
      dimensionality = fill(0, 0),
      component_name = "vs",
      value = "",
      description = "PSS output signal",
      placement = "Placement(transformation(extent={{100,-10},{120,10}}))"),
    .DymolaEmbedded.BuildUtilities.BinaryCode.BinaryStubGeneration.InterfaceComponent(
      io_type = .DymolaEmbedded.BuildUtilities.BinaryCode.BinaryStubGeneration.InterfaceComponent.IOType.Parameter,
      primitive_type = .DymolaEmbedded.BuildUtilities.BinaryCode.BinaryStubGeneration.InterfaceComponent.PrimitiveType.Real,
      type_name = "Real",
      dimensionality = fill(0, 0),
      component_name = "Kw",
      value = "9.5",
      description = "Stabilizer gain [pu/pu]",
      placement = ""),
    .DymolaEmbedded.BuildUtilities.BinaryCode.BinaryStubGeneration.InterfaceComponent(
      io_type = .DymolaEmbedded.BuildUtilities.BinaryCode.BinaryStubGeneration.InterfaceComponent.IOType.Parameter,
      primitive_type = .DymolaEmbedded.BuildUtilities.BinaryCode.BinaryStubGeneration.InterfaceComponent.PrimitiveType.Real,
      type_name = "OpenIPSL.Types.Time",
      dimensionality = fill(0, 0),
      component_name = "T1",
      value = "0.154",
      description = "First stabilizer time constant",
      placement = ""),
    .DymolaEmbedded.BuildUtilities.BinaryCode.BinaryStubGeneration.InterfaceComponent(
      io_type = .DymolaEmbedded.BuildUtilities.BinaryCode.BinaryStubGeneration.InterfaceComponent.IOType.Parameter,
      primitive_type = .DymolaEmbedded.BuildUtilities.BinaryCode.BinaryStubGeneration.InterfaceComponent.PrimitiveType.Real,
      type_name = "OpenIPSL.Types.Time",
      dimensionality = fill(0, 0),
      component_name = "T2",
      value = "0.033",
      description = "Second stabilizer time constant",
      placement = ""),
    .DymolaEmbedded.BuildUtilities.BinaryCode.BinaryStubGeneration.InterfaceComponent(
      io_type = .DymolaEmbedded.BuildUtilities.BinaryCode.BinaryStubGeneration.InterfaceComponent.IOType.Parameter,
      primitive_type = .DymolaEmbedded.BuildUtilities.BinaryCode.BinaryStubGeneration.InterfaceComponent.PrimitiveType.Real,
      type_name = "OpenIPSL.Types.Time",
      dimensionality = fill(0, 0),
      component_name = "T3",
      value = "1",
      description = "Third stabilizer time constant",
      placement = ""),
    .DymolaEmbedded.BuildUtilities.BinaryCode.BinaryStubGeneration.InterfaceComponent(
      io_type = .DymolaEmbedded.BuildUtilities.BinaryCode.BinaryStubGeneration.InterfaceComponent.IOType.Parameter,
      primitive_type = .DymolaEmbedded.BuildUtilities.BinaryCode.BinaryStubGeneration.InterfaceComponent.PrimitiveType.Real,
      type_name = "OpenIPSL.Types.Time",
      dimensionality = fill(0, 0),
      component_name = "T4",
      value = "1",
      description = "Fourth stabilizer time constant",
      placement = ""),
    .DymolaEmbedded.BuildUtilities.BinaryCode.BinaryStubGeneration.InterfaceComponent(
      io_type = .DymolaEmbedded.BuildUtilities.BinaryCode.BinaryStubGeneration.InterfaceComponent.IOType.Parameter,
      primitive_type = .DymolaEmbedded.BuildUtilities.BinaryCode.BinaryStubGeneration.InterfaceComponent.PrimitiveType.Real,
      type_name = "OpenIPSL.Types.Time",
      dimensionality = fill(0, 0),
      component_name = "Tw",
      value = "1.41",
      description = "Wash-out time constant",
      placement = ""),
    .DymolaEmbedded.BuildUtilities.BinaryCode.BinaryStubGeneration.InterfaceComponent(
      io_type = .DymolaEmbedded.BuildUtilities.BinaryCode.BinaryStubGeneration.InterfaceComponent.IOType.Parameter,
      primitive_type = .DymolaEmbedded.BuildUtilities.BinaryCode.BinaryStubGeneration.InterfaceComponent.PrimitiveType.Real,
      type_name = "Real",
      dimensionality = fill(0, 0),
      component_name = "vSI_start",
      value = "1.0",
      description = "Default start value for vSI, the PSS input signal.",
      placement = ""),
    .DymolaEmbedded.BuildUtilities.BinaryCode.BinaryStubGeneration.InterfaceComponent(
      io_type = .DymolaEmbedded.BuildUtilities.BinaryCode.BinaryStubGeneration.InterfaceComponent.IOType.Parameter,
      primitive_type = .DymolaEmbedded.BuildUtilities.BinaryCode.BinaryStubGeneration.InterfaceComponent.PrimitiveType.Real,
      type_name = "OpenIPSL.Types.PerUnit",
      dimensionality = fill(0, 0),
      component_name = "vsmax",
      value = "0.2",
      description = "Max stabilizer output signal",
      placement = ""),
    .DymolaEmbedded.BuildUtilities.BinaryCode.BinaryStubGeneration.InterfaceComponent(
      io_type = .DymolaEmbedded.BuildUtilities.BinaryCode.BinaryStubGeneration.InterfaceComponent.IOType.Parameter,
      primitive_type = .DymolaEmbedded.BuildUtilities.BinaryCode.BinaryStubGeneration.InterfaceComponent.PrimitiveType.Real,
      type_name = "OpenIPSL.Types.PerUnit",
      dimensionality = fill(0, 0),
      component_name = "vsmin",
      value = "-0.2",
      description = "Min stabilizer output signal",
      placement = "")};

  annotation (preferredView = "info");
end resolve_interface;
