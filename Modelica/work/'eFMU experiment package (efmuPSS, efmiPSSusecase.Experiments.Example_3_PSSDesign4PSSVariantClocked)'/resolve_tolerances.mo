within 'eFMU experiment package (efmuPSS, efmiPSSusecase.Experiments.Example_3_PSSDesign4PSSVariantClocked)';
function resolve_tolerances "Return all absolute and relative tolerances, for every floating-point
     precision and test scenario, as a simple vector (ordered by first test
     scenario, then floating-point precision, absolute before relative
     tolerances and finally eBlock interface order)."

  output Real[:] tolerances "Vector of all tolerances configurations.";

  extends .DymolaEmbedded.Icons.eFMI_ExperimentConfiguration;

algorithm
  tolerances := {tolerances_Scenario_1.absolute_x32.vs,tolerances_Scenario_1.relative_x32.vs,
    tolerances_Scenario_1.absolute_x64.vs,tolerances_Scenario_1.relative_x64.vs};

  annotation (preferredView="info", Protection(hideFromBrowser=true));
end resolve_tolerances;
