within efmiPSSusecase.Experiments;
model Example_3_PSSDesign4efmu
  "Extends original example 3 to use PSS model refactored for efmi export"
  extends PSSDesign.Examples.Archive.Example_3_PSSDesign(G1(redeclare
        efmiPSSusecase.Components.PSSTypeIImod4efmi pss));
end Example_3_PSSDesign4efmu;
