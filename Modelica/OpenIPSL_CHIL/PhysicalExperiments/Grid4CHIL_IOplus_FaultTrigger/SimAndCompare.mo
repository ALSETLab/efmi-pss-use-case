within OpenIPSL_CHIL.PhysicalExperiments.Grid4CHIL_IOplus_FaultTrigger;
function SimAndCompare "Simulates and compares the three cases below"
  extends Modelica.Icons.Function;

algorithm

.DymolaCommands.SimulatorAPI.simulateModel(
  problem="OpenIPSL_CHIL.PhysicalExperiments.Grid4CHIL_IOplus_FaultTrigger.Fault",
  stopTime=20,
  resultFile="Fault");
.DymolaCommands.SimulatorAPI.simulateModel(
  problem="OpenIPSL_CHIL.PhysicalExperiments.Grid4CHIL_IOplus_FaultTrigger.Fault_Clocked",
  stopTime=20,
  resultFile="Fault_Clocked");
.DymolaCommands.SimulatorAPI.simulateModel(
  problem="OpenIPSL_CHIL.PhysicalExperiments.Grid4CHIL_IOplus_FaultTrigger.Fault_eFMU",
  stopTime=20,
  resultFile="Fault_eFMU");

.DymolaCommands.Plot.removePlots(false);
Advanced.Plot.Legend.Filename := true;
Advanced.Plot.FilesToKeep := 10;
.DymolaCommands.Plot.createPlot(id=101, position={-3, 26, 871, 758}, y={"v"}, range={0.0, 20.0, 0.30000000000000004, 1.2000000000000002}, autoscale=false, grid=true, filename="Fault.mat", subPlot=101, colors={{28,108,200}}, timeUnit="s", displayUnits={"1"});
.DymolaCommands.Plot.createPlot(id=101, position={-3, 26, 871, 758}, y={"w"}, range={0.0, 20.0, 0.994, 1.008}, grid=true, subPlot=102, colors={{28,108,200}}, timeUnit="s", displayUnits={"1"});
.DymolaCommands.Plot.createPlot(id=101, position={-3, 26, 871, 758}, y={"v"}, range={0.0, 20.0, 0.30000000000000004, 1.2000000000000002}, erase=false, autoscale=false, grid=true, filename="Fault_Clocked.mat", subPlot=101, colors={{238,46,47}}, markers={MarkerStyle.SmallSquare}, timeUnit="s", displayUnits={"1"});
.DymolaCommands.Plot.createPlot(id=101, position={-3, 26, 871, 758}, y={"w"}, range={0.0, 20.0, 0.994, 1.008}, erase=false, grid=true, subPlot=102, colors={{238,46,47}}, markers={MarkerStyle.SmallSquare}, timeUnit="s", displayUnits={"1"});
.DymolaCommands.Plot.createPlot(id=101, position={-3, 26, 871, 758}, y={"v"}, range={0.0, 20.0, 0.30000000000000004, 1.2000000000000002}, erase=false, autoscale=false, grid=true, filename="Fault_eFMU.mat", subPlot=101, colors={{0,140,72}}, timeUnit="s");
.DymolaCommands.Plot.createPlot(id=101, position={-3, 26, 871, 758}, y={"w"}, range={0.0, 20.0, 0.994, 1.008}, erase=false, grid=true, subPlot=102, colors={{0,140,72}}, timeUnit="s");

annotation (__Dymola_interactive=true);
end SimAndCompare;
