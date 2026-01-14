within 'eFMU experiment package (CHILTest, PSSDesign.eFMU4CHIL.TestGridForCHILpClocked)';
function resolve_tolerances "Return all absolute and relative tolerances, for every floating-point
     precision and test scenario, as a simple vector (ordered by first test
     scenario, then floating-point precision, absolute before relative
     tolerances and finally eBlock interface order)."

  output Real[:] tolerances "Vector of all tolerances configurations.";

  extends .DymolaEmbedded.Icons.eFMI_ExperimentConfiguration;

algorithm
  tolerances := {tolerances_Scenario_1.absolute_x32.Pgen,tolerances_Scenario_1.absolute_x32.Qgen,
    tolerances_Scenario_1.absolute_x32.v,tolerances_Scenario_1.absolute_x32.vf0OUT,
    tolerances_Scenario_1.absolute_x32.w,tolerances_Scenario_1.relative_x32.Pgen,
    tolerances_Scenario_1.relative_x32.Qgen,tolerances_Scenario_1.relative_x32.v,
    tolerances_Scenario_1.relative_x32.vf0OUT,tolerances_Scenario_1.relative_x32.w,
    tolerances_Scenario_1.absolute_x64.Pgen,tolerances_Scenario_1.absolute_x64.Qgen,
    tolerances_Scenario_1.absolute_x64.v,tolerances_Scenario_1.absolute_x64.vf0OUT,
    tolerances_Scenario_1.absolute_x64.w,tolerances_Scenario_1.relative_x64.Pgen,
    tolerances_Scenario_1.relative_x64.Qgen,tolerances_Scenario_1.relative_x64.v,
    tolerances_Scenario_1.relative_x64.vf0OUT,tolerances_Scenario_1.relative_x64.w};

  annotation (preferredView="info", Protection(hideFromBrowser=true));
end resolve_tolerances;
