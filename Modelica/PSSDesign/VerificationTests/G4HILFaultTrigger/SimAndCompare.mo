within PSSDesign.VerificationTests.G4HILFaultTrigger;
function SimAndCompare "Simulates and compares the three cases below"
  extends Modelica.Icons.Function;

algorithm

simulateModel(
  "PSSDesign.VerificationTests.FaultTrigger.Fault",
  stopTime=20,
  resultFile="Fault");
simulateModel(
  "PSSDesign.VerificationTests.FaultTrigger.FaultClocked",
  stopTime=20,
  resultFile="FaultClocked");
simulateModel(
  "PSSDesign.VerificationTests.FaultTrigger.FaultBinStub",
  stopTime=20,
  resultFile="FaultBinStub");

removePlots(false);
Advanced.FilenameInLegend :=true;
Advanced.FilesToKeep :=10;
createPlot(id=101, position={-3, 26, 871, 758}, y={"v"}, range={0.0, 20.0, 0.30000000000000004, 1.2000000000000002}, autoscale=false, grid=true, filename="Fault.mat", subPlot=101, colors={{28,108,200}}, timeUnit="s", displayUnits={"1"});
createPlot(id=101, position={-3, 26, 871, 758}, y={"w"}, range={0.0, 20.0, 0.994, 1.008}, grid=true, subPlot=102, colors={{28,108,200}}, timeUnit="s", displayUnits={"1"});
createPlot(id=101, position={-3, 26, 871, 758}, y={"v"}, range={0.0, 20.0, 0.30000000000000004, 1.2000000000000002}, erase=false, autoscale=false, grid=true, filename="FaultClocked.mat", subPlot=101, colors={{238,46,47}}, markers={MarkerStyle.SmallSquare}, timeUnit="s", displayUnits={"1"});
createPlot(id=101, position={-3, 26, 871, 758}, y={"w"}, range={0.0, 20.0, 0.994, 1.008}, erase=false, grid=true, subPlot=102, colors={{238,46,47}}, markers={MarkerStyle.SmallSquare}, timeUnit="s", displayUnits={"1"});
createPlot(id=101, position={-3, 26, 871, 758}, y={"v"}, range={0.0, 20.0, 0.30000000000000004, 1.2000000000000002}, erase=false, autoscale=false, grid=true, filename="FaultBinStub.mat", subPlot=101, colors={{0,140,72}}, timeUnit="s");
createPlot(id=101, position={-3, 26, 871, 758}, y={"w"}, range={0.0, 20.0, 0.994, 1.008}, erase=false, grid=true, subPlot=102, colors={{0,140,72}}, timeUnit="s");

end SimAndCompare;
