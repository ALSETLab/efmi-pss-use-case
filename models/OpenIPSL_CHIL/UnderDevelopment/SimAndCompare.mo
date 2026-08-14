within OpenIPSL_CHIL.UnderDevelopment;
function SimAndCompare "Simulates and compares the three cases below"
  extends Modelica.Icons.Function;

algorithm

.DymolaCommands.SimulatorAPI.simulateModel(
  problem="OpenIPSL_CHIL.RTS.Tests.CHIL.Grid4CHIL",
  stopTime=20,
  resultFile="Grid4CHIL",numberOfIntervals=5000,
  method="Dassl");
.DymolaCommands.SimulatorAPI.simulateModel(
  problem="OpenIPSL_CHIL.RTS.Tests.CHIL.Grid4CHIL_Clocked",
  stopTime=20,
  resultFile="Grid4CHIL_Clocked",numberOfIntervals=5000,
  method="Dassl");

.DymolaCommands.Plot.removePlots(false);
Advanced.Plot.Legend.Filename := true;
Advanced.Plot.FilesToKeep := 10;
.DymolaCommands.Plot.createPlot(id=1, position={15, 15, 923, 712}, y={"w"}, range={0.0, 20.0, 0.99, 1.008}, grid=true, filename="Grid4CHIL.mat", subPlot=101, colors={{28,108,200}}, timeUnit="s", displayUnits={"1"});
.DymolaCommands.Plot.createPlot(id=1, position={15, 15, 923, 712}, y={"Pgen"}, range={0.0, 20.0, 0.0, 30.0}, grid=true, subPlot=102, colors={{28,108,200}}, timeUnit="s");
.DymolaCommands.Plot.createPlot(id=1, position={15, 15, 923, 712}, y={"v"}, range={0.0, 20.0, 0.30000000000000004, 1.3}, grid=true, subPlot=201, colors={{28,108,200}}, timeUnit="s", displayUnits={"1"});
.DymolaCommands.Plot.createPlot(id=1, position={15, 15, 923, 712}, y={"Qgen"}, range={0.0, 20.0, 0.0, 30.0}, grid=true, subPlot=202, colors={{28,108,200}}, timeUnit="s");
.DymolaCommands.Plot.createPlot(id=1, position={15, 15, 923, 712}, y={"w"}, range={0.0, 20.0, 0.99, 1.008}, erase=false, grid=true, filename="Grid4CHIL_Clocked.mat", subPlot=101, colors={{238,46,47}}, markers={MarkerStyle.SmallSquare}, timeUnit="s", displayUnits={"1"});
.DymolaCommands.Plot.createPlot(id=1, position={15, 15, 923, 712}, y={"Pgen"}, range={0.0, 20.0, 0.0, 30.0}, erase=false, grid=true, subPlot=102, colors={{238,46,47}}, markers={MarkerStyle.SmallSquare}, timeUnit="s");
.DymolaCommands.Plot.createPlot(id=1, position={15, 15, 923, 712}, y={"v"}, range={0.0, 20.0, 0.30000000000000004, 1.3}, erase=false, grid=true, subPlot=201, colors={{238,46,47}}, markers={MarkerStyle.SmallSquare}, timeUnit="s", displayUnits={"1"});
.DymolaCommands.Plot.createPlot(id=1, position={15, 15, 923, 712}, y={"Qgen"}, range={0.0, 20.0, 0.0, 30.0}, erase=false, grid=true, subPlot=202, colors={{238,46,47}}, markers={MarkerStyle.SmallSquare}, timeUnit="s");

annotation (
  __Dymola_interactive = true);
end SimAndCompare;
