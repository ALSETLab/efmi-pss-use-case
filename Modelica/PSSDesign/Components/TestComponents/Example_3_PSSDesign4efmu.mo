within PSSDesign.Components.TestComponents;
model Example_3_PSSDesign4efmu
  "Extends original example 3 to use PSS model refactored for efmi export"
  extends PSSDesign.Examples.Archive.Example_3_PSSDesign(G1(redeclare
        PSSDesign.Components.PSSTypeII4eFMI pss));
end Example_3_PSSDesign4efmu;
