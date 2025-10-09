within efmiPSSusecase.Experiments.efmiSILTest;
function resolve_tolerances "Return all absolute and relative tolerances, for every floating-point
     precision and test scenario, as a simple vector (ordered by first test
     scenario, then floating-point precision, absolute before relative
     tolerances and finally eBlock interface order)."

  output Real[:] tolerances "Vector of all tolerances configurations.";

  extends .DymolaEmbedded.Icons.eFMI_ExperimentConfiguration;

algorithm
  tolerances := fill(0.0, 0);

  annotation (preferredView="info", Protection(hideFromBrowser=true));
end resolve_tolerances;
