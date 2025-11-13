within PSSDesign.eFMU4CHIL.UnderDevelopment;
function SimAndCompare "Simulates and compares the three cases below"
  extends Modelica.Icons.Function;

algorithm

simulateModel(
  "PSSDesign.eFMU4CHIL.TestGridForCHIL",
  stopTime=20,
  resultFile="TestGridForCHILt",numberOfIntervals=5000,
  method="Dassl");
simulateModel(
  "PSSDesign.eFMU4CHIL.TestGridForCHILpClocked",
  stopTime=20,
  resultFile="TestGridForCHILpClocked",numberOfIntervals=5000,
  method="Dassl");

removePlots(false);
Advanced.FilenameInLegend :=true;
Advanced.FilesToKeep :=10;
createPlot(id=1, position={15, 15, 923, 712}, y={"w"}, range={0.0, 20.0, 0.99, 1.008}, grid=true, filename="TestGridForCHIL.mat", subPlot=101, colors={{28,108,200}}, timeUnit="s", displayUnits={"1"});
createPlot(id=1, position={15, 15, 923, 712}, y={"Pgen"}, range={0.0, 20.0, 0.0, 30.0}, grid=true, subPlot=102, colors={{28,108,200}}, timeUnit="s");
createPlot(id=1, position={15, 15, 923, 712}, y={"v"}, range={0.0, 20.0, 0.30000000000000004, 1.3}, grid=true, subPlot=201, colors={{28,108,200}}, timeUnit="s", displayUnits={"1"});
createPlot(id=1, position={15, 15, 923, 712}, y={"Qgen"}, range={0.0, 20.0, 0.0, 30.0}, grid=true, subPlot=202, colors={{28,108,200}}, timeUnit="s");
createPlot(id=1, position={15, 15, 923, 712}, y={"w"}, range={0.0, 20.0, 0.99, 1.008}, erase=false, grid=true, filename="TestGridForCHILpClocked.mat", subPlot=101, colors={{238,46,47}}, markers={MarkerStyle.SmallSquare}, timeUnit="s", displayUnits={"1"});
createPlot(id=1, position={15, 15, 923, 712}, y={"Pgen"}, range={0.0, 20.0, 0.0, 30.0}, erase=false, grid=true, subPlot=102, colors={{238,46,47}}, markers={MarkerStyle.SmallSquare}, timeUnit="s");
createPlot(id=1, position={15, 15, 923, 712}, y={"v"}, range={0.0, 20.0, 0.30000000000000004, 1.3}, erase=false, grid=true, subPlot=201, colors={{238,46,47}}, markers={MarkerStyle.SmallSquare}, timeUnit="s", displayUnits={"1"});
createPlot(id=1, position={15, 15, 923, 712}, y={"Qgen"}, range={0.0, 20.0, 0.0, 30.0}, erase=false, grid=true, subPlot=202, colors={{238,46,47}}, markers={MarkerStyle.SmallSquare}, timeUnit="s");

end SimAndCompare;
