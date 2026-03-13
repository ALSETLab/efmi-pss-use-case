within OpenIPSL_CHIL.Components.PSS.Blocks.NoiseSupressionFilters;
function bodeLPF
  "Plots the bode response for the LowPass1stOrder filter block."
  extends Modelica.Icons.Function;
algorithm
  Modelica_LinearSystems2.ModelAnalysis.TransferFunctions("OpenIPSL_CHIL.Components.PSS.Blocks.NoiseSupressionFilters.LowPass1stOrder");

  annotation (__Dymola_interactive=true);
end bodeLPF;
