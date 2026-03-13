within OpenIPSL_CHIL.Components.PSS.Blocks.NoiseSupressionFilters;
function bodePSSCompare
  "Plots the bode response for the PSSTypeIIParam and PSSTypeIISimpleHPF models."
  extends Modelica.Icons.Function;
algorithm
  Modelica_LinearSystems2.ModelAnalysis.TransferFunctions("OpenIPSL_CHIL.Components.PSS.Blocks.NoiseSupressionFilters.PSSCompare");

  annotation (__Dymola_interactive=true);
end bodePSSCompare;
