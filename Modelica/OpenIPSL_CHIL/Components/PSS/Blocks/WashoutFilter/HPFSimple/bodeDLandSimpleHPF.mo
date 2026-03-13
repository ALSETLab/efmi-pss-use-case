within OpenIPSL_CHIL.Components.PSS.Blocks.WashoutFilter.HPFSimple;
function bodeDLandSimpleHPF
  "Plots the bode response for the derivative lag and simple high pass filter parametrized to replace it."
  extends Modelica.Icons.Function;
algorithm
  Modelica_LinearSystems2.ModelAnalysis.TransferFunctions("OpenIPSL_CHIL.Components.PSS.Blocks.DLandHPF(order=1)");

  annotation (__Dymola_interactive=true);
end bodeDLandSimpleHPF;
