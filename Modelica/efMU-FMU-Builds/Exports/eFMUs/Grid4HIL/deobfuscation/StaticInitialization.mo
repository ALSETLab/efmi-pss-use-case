encapsulated package 'PSSDesign.eFMUs4RTHIL.GridForHILTesting: static initialization'
	extends .DymolaEmbedded.Icons.EmbeddedBuiltinFunction;

	import DymolaEmbedded.BuiltinFunctions.*;

	record Self

	/* ********************************************************************************************************** Block inputs: */
	Boolean fault;
	Real vf;

	/* ********************************************************************************************************* Block outputs: */
	Real Pgen;
	Real Qgen;
	Real v;
	Real vf0OUT;
	Real w;
	/* B3: */
	Real 'B3.angle_0';
	Real 'B3.v_0';

	/* B3.p: */
	Real 'B3.p.vi';
	Real 'B3.p.vr';

	/* G1: */
	Real 'G1.P_0';
	Real 'G1.Q_0';
	Real 'G1.V_b';
	Real 'G1.angle_0';
	Real 'G1.v_0';

	/* G1.feedbackVf0: */
	Real 'G1.feedbackVf0.u2';

	/* G1.gainVf0: */
	Real 'G1.gainVf0.k';

	/* G1.machine: */
	Real 'G1.machine.M';
	Real 'G1.machine.Sn';
	Real 'G1.machine.T1d0';
	Real 'G1.machine.T1q0';
	Real 'G1.machine.T2d0';
	Real 'G1.machine.T2q0';
	Real 'G1.machine.Taa';
	Real 'G1.machine.Vn';
	Real 'G1.machine.ra';
	Real 'G1.machine.x1d';
	Real 'G1.machine.x1q';
	Real 'G1.machine.x2d';
	Real 'G1.machine.x2q';
	Real 'G1.machine.xd';
	Real 'G1.machine.xq';
	Real 'G1.machine.I_MBtoSB';
	Real 'G1.machine.K1';
	Real 'G1.machine.K2';
	Real 'G1.machine.S_SBtoMB';
	Real 'G1.machine.V_MBtoSB';
	Real 'G1.machine.Z_MBtoSB';
	Real 'G1.machine.delta0';
	Real 'G1.machine.e1d0';
	Real 'G1.machine.e1q0';
	Real 'G1.machine.e2d0';
	Real 'G1.machine.e2q0';
	Real 'G1.machine.id0';
	Real 'G1.machine.iq0';
	Real 'G1.machine.p0';
	Real 'G1.machine.pm00';
	Real 'G1.machine.q0';
	Real 'G1.machine.vd0';
	Real 'G1.machine.vf00';
	Real 'G1.machine.vq0';
	Real 'G1.machine.w_b';
	Real 'derivative(G1.machine.delta)';
	Real 'derivative(G1.machine.e1d)';
	Real 'derivative(G1.machine.e1q)';
	Real 'derivative(G1.machine.e2d)';
	Real 'derivative(G1.machine.e2q)';
	Real 'derivative(G1.machine.w)';
	Real 'G1.machine.delta';
	Real 'G1.machine.e1d';
	Real 'G1.machine.e1q';
	Real 'G1.machine.e2d';
	Real 'G1.machine.e2q';
	Real 'G1.machine.id';
	Real 'G1.machine.iq';
	Real 'G1.machine.w';

	/* G1.machine.I0: */
	Real 'G1.machine.I0.im';
	Real 'G1.machine.I0.re';

	/* G1.machine.Idq0: */
	Real 'G1.machine.Idq0.im';
	Real 'G1.machine.Idq0.re';

	/* G1.machine.S0: */
	Real 'G1.machine.S0.im';

	/* G1.machine.Vdq0: */
	Real 'G1.machine.Vdq0.im';
	Real 'G1.machine.Vdq0.re';

	/* G1.machine.Vt0: */
	Real 'G1.machine.Vt0.im';
	Real 'G1.machine.Vt0.re';

	/* G1.machine.auxCMval: */
	Real 'G1.machine.auxCMval.im';
	Real 'G1.machine.auxCMval.re';

	/* L1: */
	Real 'L1.B';
	Real 'L1.G';
	Real 'L1.R';
	Real 'L1.X';

	/* L2: */
	Real 'L2.B';
	Real 'L2.G';
	Real 'L2.R';
	Real 'L2.X';

	/* L2.p: */
	Real 'L2.p.ii';
	Real 'L2.p.ir';

	/* SysData: */
	Real 'SysData.S_b';
	Real 'SysData.fn';

	/* transformer: */
	Real 'transformer.Sn';
	Real 'transformer.V_b';
	Real 'transformer.Vn';
	Real 'transformer.m';
	Real 'transformer.rT';
	Real 'transformer.xT';
	Real 'transformer.Zb';
	Real 'transformer.Zn';
	Real 'transformer.r';
	Real 'transformer.x';

	/* transformer.n: */
	Real 'transformer.n.ii';
	Real 'transformer.n.ir';

	/* Internal sampling time: */
	Real 'discrete.stepSize';
	end Self;

	function ReadStartupModelResults
		output Self self;

	protected
		constant String result_file = "StartupModel";
		Real trajectories_buffer[64, 1];
		Boolean succeeded;
		constant Boolean[:] old_configuration =
		 .DymolaCommands.SimulatorAPI.experimentGetOutput();

	algorithm
		succeeded := .DymolaCommands.SimulatorAPI.experimentSetupOutput(
		 textual = false,
		 doublePrecision = true,
		 states = true,
		 derivatives = true,
		 inputs = true,
		 outputs = true,
		 auxiliaries = true,
		 equidistant = true,
		 events = true,
		 onlyStopTime = true,
		 debug = false);
		succeeded := succeeded
		 and .DymolaCommands.SimulatorAPI.simulateModel(
		  problem = "'PSSDesign.eFMUs4RTHIL.GridForHILTesting: static initialization'.StartupModel",
		  resultFile = result_file);
		
		if succeeded then
			trajectories_buffer := .DymolaCommands.Trajectories.readTrajectory(
			 fileName = result_file + ".mat",
			 rows = 1,
			 signals = {
			  "self.fault",
			  "self.vf",
			  "self.Pgen",
			  "self.Qgen",
			  "self.v",
			  "self.vf0OUT",
			  "self.w",
			  "self.'B3.angle_0'",
			  "self.'B3.v_0'",
			  "self.'B3.p.vi'",
			  "self.'B3.p.vr'",
			  "self.'G1.P_0'",
			  "self.'G1.Q_0'",
			  "self.'G1.V_b'",
			  "self.'G1.angle_0'",
			  "self.'G1.v_0'",
			  "self.'G1.feedbackVf0.u2'",
			  "self.'G1.gainVf0.k'",
			  "self.'G1.machine.M'",
			  "self.'G1.machine.Sn'",
			  "self.'G1.machine.T1d0'",
			  "self.'G1.machine.T1q0'",
			  "self.'G1.machine.T2d0'",
			  "self.'G1.machine.T2q0'",
			  "self.'G1.machine.Taa'",
			  "self.'G1.machine.Vn'",
			  "self.'G1.machine.ra'",
			  "self.'G1.machine.x1d'",
			  "self.'G1.machine.x1q'",
			  "self.'G1.machine.x2d'",
			  "self.'G1.machine.x2q'",
			  "self.'G1.machine.xd'",
			  "self.'G1.machine.xq'",
			  "self.'G1.machine.I_MBtoSB'",
			  "self.'G1.machine.K1'",
			  "self.'G1.machine.K2'",
			  "self.'G1.machine.S_SBtoMB'",
			  "self.'G1.machine.V_MBtoSB'",
			  "self.'G1.machine.Z_MBtoSB'",
			  "self.'G1.machine.delta0'",
			  "self.'G1.machine.e1d0'",
			  "self.'G1.machine.e1q0'",
			  "self.'G1.machine.e2d0'",
			  "self.'G1.machine.e2q0'",
			  "self.'G1.machine.id0'",
			  "self.'G1.machine.iq0'",
			  "self.'G1.machine.p0'",
			  "self.'G1.machine.pm00'",
			  "self.'G1.machine.q0'",
			  "self.'G1.machine.vd0'",
			  "self.'G1.machine.vf00'",
			  "self.'G1.machine.vq0'",
			  "self.'G1.machine.w_b'",
			  "self.'derivative(G1.machine.delta)'",
			  "self.'derivative(G1.machine.e1d)'",
			  "self.'derivative(G1.machine.e1q)'",
			  "self.'derivative(G1.machine.e2d)'",
			  "self.'derivative(G1.machine.e2q)'",
			  "self.'derivative(G1.machine.w)'",
			  "self.'G1.machine.delta'",
			  "self.'G1.machine.e1d'",
			  "self.'G1.machine.e1q'",
			  "self.'G1.machine.e2d'",
			  "self.'G1.machine.e2q'"});
			self.fault := trajectories_buffer[1, 1] > 0.0;
			self.vf := trajectories_buffer[2, 1];
			self.Pgen := trajectories_buffer[3, 1];
			self.Qgen := trajectories_buffer[4, 1];
			self.v := trajectories_buffer[5, 1];
			self.vf0OUT := trajectories_buffer[6, 1];
			self.w := trajectories_buffer[7, 1];
			self.'B3.angle_0' := trajectories_buffer[8, 1];
			self.'B3.v_0' := trajectories_buffer[9, 1];
			self.'B3.p.vi' := trajectories_buffer[10, 1];
			self.'B3.p.vr' := trajectories_buffer[11, 1];
			self.'G1.P_0' := trajectories_buffer[12, 1];
			self.'G1.Q_0' := trajectories_buffer[13, 1];
			self.'G1.V_b' := trajectories_buffer[14, 1];
			self.'G1.angle_0' := trajectories_buffer[15, 1];
			self.'G1.v_0' := trajectories_buffer[16, 1];
			self.'G1.feedbackVf0.u2' := trajectories_buffer[17, 1];
			self.'G1.gainVf0.k' := trajectories_buffer[18, 1];
			self.'G1.machine.M' := trajectories_buffer[19, 1];
			self.'G1.machine.Sn' := trajectories_buffer[20, 1];
			self.'G1.machine.T1d0' := trajectories_buffer[21, 1];
			self.'G1.machine.T1q0' := trajectories_buffer[22, 1];
			self.'G1.machine.T2d0' := trajectories_buffer[23, 1];
			self.'G1.machine.T2q0' := trajectories_buffer[24, 1];
			self.'G1.machine.Taa' := trajectories_buffer[25, 1];
			self.'G1.machine.Vn' := trajectories_buffer[26, 1];
			self.'G1.machine.ra' := trajectories_buffer[27, 1];
			self.'G1.machine.x1d' := trajectories_buffer[28, 1];
			self.'G1.machine.x1q' := trajectories_buffer[29, 1];
			self.'G1.machine.x2d' := trajectories_buffer[30, 1];
			self.'G1.machine.x2q' := trajectories_buffer[31, 1];
			self.'G1.machine.xd' := trajectories_buffer[32, 1];
			self.'G1.machine.xq' := trajectories_buffer[33, 1];
			self.'G1.machine.I_MBtoSB' := trajectories_buffer[34, 1];
			self.'G1.machine.K1' := trajectories_buffer[35, 1];
			self.'G1.machine.K2' := trajectories_buffer[36, 1];
			self.'G1.machine.S_SBtoMB' := trajectories_buffer[37, 1];
			self.'G1.machine.V_MBtoSB' := trajectories_buffer[38, 1];
			self.'G1.machine.Z_MBtoSB' := trajectories_buffer[39, 1];
			self.'G1.machine.delta0' := trajectories_buffer[40, 1];
			self.'G1.machine.e1d0' := trajectories_buffer[41, 1];
			self.'G1.machine.e1q0' := trajectories_buffer[42, 1];
			self.'G1.machine.e2d0' := trajectories_buffer[43, 1];
			self.'G1.machine.e2q0' := trajectories_buffer[44, 1];
			self.'G1.machine.id0' := trajectories_buffer[45, 1];
			self.'G1.machine.iq0' := trajectories_buffer[46, 1];
			self.'G1.machine.p0' := trajectories_buffer[47, 1];
			self.'G1.machine.pm00' := trajectories_buffer[48, 1];
			self.'G1.machine.q0' := trajectories_buffer[49, 1];
			self.'G1.machine.vd0' := trajectories_buffer[50, 1];
			self.'G1.machine.vf00' := trajectories_buffer[51, 1];
			self.'G1.machine.vq0' := trajectories_buffer[52, 1];
			self.'G1.machine.w_b' := trajectories_buffer[53, 1];
			self.'derivative(G1.machine.delta)' := trajectories_buffer[54, 1];
			self.'derivative(G1.machine.e1d)' := trajectories_buffer[55, 1];
			self.'derivative(G1.machine.e1q)' := trajectories_buffer[56, 1];
			self.'derivative(G1.machine.e2d)' := trajectories_buffer[57, 1];
			self.'derivative(G1.machine.e2q)' := trajectories_buffer[58, 1];
			self.'derivative(G1.machine.w)' := trajectories_buffer[59, 1];
			self.'G1.machine.delta' := trajectories_buffer[60, 1];
			self.'G1.machine.e1d' := trajectories_buffer[61, 1];
			self.'G1.machine.e1q' := trajectories_buffer[62, 1];
			self.'G1.machine.e2d' := trajectories_buffer[63, 1];
			self.'G1.machine.e2q' := trajectories_buffer[64, 1];

			trajectories_buffer[1:39] := .DymolaCommands.Trajectories.readTrajectory(
			 fileName = result_file + ".mat",
			 rows = 1,
			 signals = {
			  "self.'G1.machine.id'",
			  "self.'G1.machine.iq'",
			  "self.'G1.machine.w'",
			  "self.'G1.machine.I0.im'",
			  "self.'G1.machine.I0.re'",
			  "self.'G1.machine.Idq0.im'",
			  "self.'G1.machine.Idq0.re'",
			  "self.'G1.machine.S0.im'",
			  "self.'G1.machine.Vdq0.im'",
			  "self.'G1.machine.Vdq0.re'",
			  "self.'G1.machine.Vt0.im'",
			  "self.'G1.machine.Vt0.re'",
			  "self.'G1.machine.auxCMval.im'",
			  "self.'G1.machine.auxCMval.re'",
			  "self.'L1.B'",
			  "self.'L1.G'",
			  "self.'L1.R'",
			  "self.'L1.X'",
			  "self.'L2.B'",
			  "self.'L2.G'",
			  "self.'L2.R'",
			  "self.'L2.X'",
			  "self.'L2.p.ii'",
			  "self.'L2.p.ir'",
			  "self.'SysData.S_b'",
			  "self.'SysData.fn'",
			  "self.'transformer.Sn'",
			  "self.'transformer.V_b'",
			  "self.'transformer.Vn'",
			  "self.'transformer.m'",
			  "self.'transformer.rT'",
			  "self.'transformer.xT'",
			  "self.'transformer.Zb'",
			  "self.'transformer.Zn'",
			  "self.'transformer.r'",
			  "self.'transformer.x'",
			  "self.'transformer.n.ii'",
			  "self.'transformer.n.ir'",
			  "self.'discrete.stepSize'"});
			self.'G1.machine.id' := trajectories_buffer[1, 1];
			self.'G1.machine.iq' := trajectories_buffer[2, 1];
			self.'G1.machine.w' := trajectories_buffer[3, 1];
			self.'G1.machine.I0.im' := trajectories_buffer[4, 1];
			self.'G1.machine.I0.re' := trajectories_buffer[5, 1];
			self.'G1.machine.Idq0.im' := trajectories_buffer[6, 1];
			self.'G1.machine.Idq0.re' := trajectories_buffer[7, 1];
			self.'G1.machine.S0.im' := trajectories_buffer[8, 1];
			self.'G1.machine.Vdq0.im' := trajectories_buffer[9, 1];
			self.'G1.machine.Vdq0.re' := trajectories_buffer[10, 1];
			self.'G1.machine.Vt0.im' := trajectories_buffer[11, 1];
			self.'G1.machine.Vt0.re' := trajectories_buffer[12, 1];
			self.'G1.machine.auxCMval.im' := trajectories_buffer[13, 1];
			self.'G1.machine.auxCMval.re' := trajectories_buffer[14, 1];
			self.'L1.B' := trajectories_buffer[15, 1];
			self.'L1.G' := trajectories_buffer[16, 1];
			self.'L1.R' := trajectories_buffer[17, 1];
			self.'L1.X' := trajectories_buffer[18, 1];
			self.'L2.B' := trajectories_buffer[19, 1];
			self.'L2.G' := trajectories_buffer[20, 1];
			self.'L2.R' := trajectories_buffer[21, 1];
			self.'L2.X' := trajectories_buffer[22, 1];
			self.'L2.p.ii' := trajectories_buffer[23, 1];
			self.'L2.p.ir' := trajectories_buffer[24, 1];
			self.'SysData.S_b' := trajectories_buffer[25, 1];
			self.'SysData.fn' := trajectories_buffer[26, 1];
			self.'transformer.Sn' := trajectories_buffer[27, 1];
			self.'transformer.V_b' := trajectories_buffer[28, 1];
			self.'transformer.Vn' := trajectories_buffer[29, 1];
			self.'transformer.m' := trajectories_buffer[30, 1];
			self.'transformer.rT' := trajectories_buffer[31, 1];
			self.'transformer.xT' := trajectories_buffer[32, 1];
			self.'transformer.Zb' := trajectories_buffer[33, 1];
			self.'transformer.Zn' := trajectories_buffer[34, 1];
			self.'transformer.r' := trajectories_buffer[35, 1];
			self.'transformer.x' := trajectories_buffer[36, 1];
			self.'transformer.n.ii' := trajectories_buffer[37, 1];
			self.'transformer.n.ir' := trajectories_buffer[38, 1];
			self.'discrete.stepSize' := trajectories_buffer[39, 1];

		end if;
		
		() := .DymolaCommands.SimulatorAPI.experimentSetupOutput(
		 old_configuration[1],
		 old_configuration[2],
		 old_configuration[3],
		 old_configuration[4],
		 old_configuration[5],
		 old_configuration[6],
		 old_configuration[7],
		 old_configuration[8],
		 old_configuration[9],
		 old_configuration[10],
		 old_configuration[11]);
		
		assert(succeeded, "Simulation of 'PSSDesign.eFMUs4RTHIL.GridForHILTesting: static initialization'.StartupModel failed.");
		
		annotation (
		 __Dymola_interactive = true);
	end ReadStartupModelResults;

	model StartupModel
		extends .Modelica.Icons.Example;

		Self self;

	equation
		self = Startup();

		annotation (
		 __Dymola_experimentFlags(Hidden(Define(NoGuard = true))),
		 __Dymola_experimentSetupOutput(doublePrecision = true));
	end StartupModel;

	function Startup
		output Self self;


	protected
	algorithm
		/* ********************************************************************************************** Initialize constants: */
		/*
			Initialize variables with explicit start value (independent initializations):
		*/
		self.'discrete.stepSize' := 1.00000000000000002e-3;
		self.'G1.V_b' := 4.0e+5;
		self.'G1.machine.Vn' := 4.0e+5;
		self.'transformer.m' := 1.0;
		self.'G1.machine.x2q' := 2.5e-1;
		self.'G1.machine.ra' := 3.00000000000000006e-3;
		self.'G1.machine.x2d' := 2.3000000000000001e-1;
		self.'L1.X' := 2.25225225225225215e-2;
		self.'L1.R' := 0.0;
		self.'L1.G' := 0.0;
		self.'L1.B' := 0.0;
		self.'L2.R' := 0.0;
		self.'L2.X' := 4.18918918918918942e-2;
		self.'L2.B' := 0.0;
		self.'L2.G' := 0.0;
		self.'G1.machine.Taa' := 2.00000000000000004e-3;
		self.'G1.machine.T1d0' := 8.0;
		self.'G1.machine.xd' := 1.81000000000000005;
		self.'G1.machine.x1d' := 2.99999999999999989e-1;
		self.'G1.machine.T2d0' := 2.99999999999999989e-2;
		self.'G1.machine.M' := 7.0;
		self.'G1.machine.xq' := 1.76000000000000001;
		self.'G1.machine.x1q' := 6.50000000000000022e-1;
		self.'G1.machine.T2q0' := 7.00000000000000067e-2;
		self.'G1.machine.T1q0' := 1.0;
		self.'SysData.S_b' := 1.0e+8;
		self.'B3.v_0' := 1.0;
		self.'B3.angle_0' := 0.0;
		self.'G1.gainVf0.k' := -1.0;
		self.'G1.v_0' := 1.0;
		self.'G1.angle_0' := 4.94677176989159972e-1;
		self.'G1.Q_0' := 9.67924969906579971e+8;
		self.'G1.P_0' := 1.99799999999359989e+9;
		self.'G1.machine.Sn' := 2.22e+9;
		self.'SysData.fn' := 6.0e+1;
		self.'transformer.xT' := 1.49999999999999994e-1;
		self.'transformer.rT' := 0.0;
		self.'transformer.V_b' := 4.0e+5;
		self.'transformer.Vn' := 4.0e+5;
		self.'transformer.Sn' := 2.22e+9;

		/* ******************************************************* Default initialize tuneable parameters (based on constants): */

		/* ****************************** Default initialize dependend parameters (based on constants and tuneable parameters): */
		self := Saturate(self);
		self := Recalibrate(self);
		self := Saturate(self);

		/* ***************************************************** Default initialize inputs (based on constants and parameters): */
		/*
			Initialize variables without explicit start value or equation (implicit initializations):
		*/
		self.vf := 0.0;
		self.fault := false;

		/* ********************************* Default initialize states and outputs (based on constants, parameters and inputs): */
		self := Saturate(self);
		self := Reinitialize(self);
		self := Saturate(self);

	end Startup;

	function Recalibrate
		input Self self_in;
		output Self self = self_in;
	protected
	algorithm
		/*
			Initialize variables with start value equation (dependent initializations):
		*/
		self.'transformer.Zn' := ((self.'transformer.Vn' ^ 2) / self.'transformer.Sn');
		self.'transformer.Zb' := ((self.'transformer.V_b' ^ 2) / self.'SysData.S_b');
		self.'transformer.r' := ((self.'transformer.rT' * self.'transformer.Zn') / self.'transformer.Zb');
		self.'transformer.x' := ((self.'transformer.xT' * self.'transformer.Zn') / self.'transformer.Zb');
		self.'G1.machine.w_b' := (6.28318530717958623 * self.'SysData.fn');
		self.'G1.machine.S_SBtoMB' := (self.'SysData.S_b' / self.'G1.machine.Sn');
		self.'G1.machine.I_MBtoSB' := ((self.'G1.machine.Sn' * self.'G1.V_b') / (self.'SysData.S_b' * self.'G1.machine.Vn'));
		self.'G1.machine.V_MBtoSB' := (self.'G1.machine.Vn' / self.'G1.V_b');
		self.'G1.machine.Z_MBtoSB' := ((self.'SysData.S_b' * (self.'G1.machine.Vn' ^ 2)) / (self.'G1.machine.Sn' * (self.'G1.V_b' ^ 2)));
		self.'G1.machine.p0' := (self.'G1.P_0' / self.'SysData.S_b');
		self.'G1.machine.q0' := (self.'G1.Q_0' / self.'SysData.S_b');
		self.'G1.machine.Vt0.re' := (self.'G1.v_0' * cos(self.'G1.angle_0'));
		self.'G1.machine.Vt0.im' := (self.'G1.v_0' * sin(self.'G1.angle_0'));
		self.'G1.machine.S0.im' := (-1.0 * (self.'G1.machine.q0'));
		self.'G1.machine.I0.re' := (((self.'G1.machine.p0' * self.'G1.machine.Vt0.re') - (self.'G1.machine.S0.im' * self.'G1.machine.Vt0.im')) / ((self.'G1.machine.Vt0.re' * self.'G1.machine.Vt0.re') + (self.'G1.machine.Vt0.im' * self.'G1.machine.Vt0.im')));
		self.'G1.machine.I0.im' := (((self.'G1.machine.p0' * self.'G1.machine.Vt0.im') + (self.'G1.machine.S0.im' * self.'G1.machine.Vt0.re')) / ((self.'G1.machine.Vt0.re' * self.'G1.machine.Vt0.re') + (self.'G1.machine.Vt0.im' * self.'G1.machine.Vt0.im')));
		self.'G1.machine.auxCMval.re' := (self.'G1.machine.Vt0.re' + (((self.'G1.machine.ra' * self.'G1.machine.Z_MBtoSB') * self.'G1.machine.I0.re') - ((self.'G1.machine.xq' * self.'G1.machine.Z_MBtoSB') * self.'G1.machine.I0.im')));
		self.'G1.machine.auxCMval.im' := (self.'G1.machine.Vt0.im' + (((self.'G1.machine.ra' * self.'G1.machine.Z_MBtoSB') * self.'G1.machine.I0.im') + ((self.'G1.machine.xq' * self.'G1.machine.Z_MBtoSB') * self.'G1.machine.I0.re')));
		self.'G1.machine.delta0' := atan2(self.'G1.machine.auxCMval.im', self.'G1.machine.auxCMval.re');
		self.'G1.machine.Vdq0.re' := (((self.'G1.machine.Vt0.re' * cos((1.57079632679489656 - self.'G1.machine.delta0'))) - (self.'G1.machine.Vt0.im' * sin((1.57079632679489656 - self.'G1.machine.delta0')))) / self.'G1.machine.V_MBtoSB');
		self.'G1.machine.Vdq0.im' := (((self.'G1.machine.Vt0.re' * sin((1.57079632679489656 - self.'G1.machine.delta0'))) + (self.'G1.machine.Vt0.im' * cos((1.57079632679489656 - self.'G1.machine.delta0')))) / self.'G1.machine.V_MBtoSB');
		self.'G1.machine.Idq0.re' := (((self.'G1.machine.I0.re' * cos((1.57079632679489656 - self.'G1.machine.delta0'))) - (self.'G1.machine.I0.im' * sin((1.57079632679489656 - self.'G1.machine.delta0')))) / self.'G1.machine.I_MBtoSB');
		self.'G1.machine.Idq0.im' := (((self.'G1.machine.I0.re' * sin((1.57079632679489656 - self.'G1.machine.delta0'))) + (self.'G1.machine.I0.im' * cos((1.57079632679489656 - self.'G1.machine.delta0')))) / self.'G1.machine.I_MBtoSB');
		self.'G1.machine.vd0' := self.'G1.machine.Vdq0.re';
		self.'G1.machine.vq0' := self.'G1.machine.Vdq0.im';
		self.'G1.machine.id0' := self.'G1.machine.Idq0.re';
		self.'G1.machine.iq0' := self.'G1.machine.Idq0.im';
		self.'G1.machine.pm00' := ((((self.'G1.machine.vq0' + (self.'G1.machine.ra' * self.'G1.machine.iq0')) * self.'G1.machine.iq0') + ((self.'G1.machine.vd0' + (self.'G1.machine.ra' * self.'G1.machine.id0')) * self.'G1.machine.id0')) / self.'G1.machine.S_SBtoMB');
		self.'G1.machine.e2q0' := ((self.'G1.machine.vq0' + (self.'G1.machine.ra' * self.'G1.machine.iq0')) + (self.'G1.machine.x2d' * self.'G1.machine.id0'));
		self.'G1.machine.e2d0' := ((self.'G1.machine.vd0' + (self.'G1.machine.ra' * self.'G1.machine.id0')) - (self.'G1.machine.x2q' * self.'G1.machine.iq0'));
		self.'G1.machine.e1d0' := (((self.'G1.machine.xq' - self.'G1.machine.x1q') - (((self.'G1.machine.T2q0' * self.'G1.machine.x2q') * (self.'G1.machine.xq' - self.'G1.machine.x1q')) / (self.'G1.machine.T1q0' * self.'G1.machine.x1q'))) * self.'G1.machine.iq0');
		self.'G1.machine.K1' := ((self.'G1.machine.xd' - self.'G1.machine.x1d') - (((self.'G1.machine.T2d0' * self.'G1.machine.x2d') * (self.'G1.machine.xd' - self.'G1.machine.x1d')) / (self.'G1.machine.T1d0' * self.'G1.machine.x1d')));
		self.'G1.machine.K2' := ((self.'G1.machine.x1d' - self.'G1.machine.x2d') + (((self.'G1.machine.T2d0' * self.'G1.machine.x2d') * (self.'G1.machine.xd' - self.'G1.machine.x1d')) / (self.'G1.machine.T1d0' * self.'G1.machine.x1d')));
		self.'G1.machine.e1q0' := ((self.'G1.machine.e2q0' + (self.'G1.machine.K2' * self.'G1.machine.id0')) - ((self.'G1.machine.Taa' * (((self.'G1.machine.K1' + self.'G1.machine.K2') * self.'G1.machine.id0') + self.'G1.machine.e2q0')) / self.'G1.machine.T1d0'));
		self.'G1.machine.vf00' := ((self.'G1.machine.V_MBtoSB' * ((self.'G1.machine.K1' * self.'G1.machine.id0') + self.'G1.machine.e1q0')) / (1.0 - (self.'G1.machine.Taa' / self.'G1.machine.T1d0')));
		self.'G1.feedbackVf0.u2' := (self.'G1.gainVf0.k' * self.'G1.machine.vf00');
		self.vf0OUT := self.'G1.machine.vf00';
	end Recalibrate;

	function Reinitialize
		input Self self_in;
		output Self self = self_in;


	protected
		Boolean DymolaConvertInputToREAL0;

		/* Internal work-buffers for solutions of linear systems of equations: */
		Real 'solution_buffer.for.x[6]'[ 6 ];

	algorithm
		/*
			Initialize variables without explicit start value or equation (implicit initializations):
		*/
		self.'derivative(G1.machine.e1q)' := 0.0;
		self.'derivative(G1.machine.e2q)' := 0.0;
		self.'derivative(G1.machine.w)' := 0.0;
		self.'derivative(G1.machine.delta)' := 0.0;
		self.Pgen := 0.0;
		self.Qgen := 0.0;
		/*
			Initialize variables with explicit start value (independent initializations):
		*/
		self.'G1.machine.e1q' := self.'G1.machine.e1q0';
		self.'G1.machine.e2q' := self.'G1.machine.e2q0';
		self.'G1.machine.w' := 1.0;
		self.'G1.machine.delta' := self.'G1.machine.delta0';
		self.'G1.machine.e1d' := self.'G1.machine.e1d0';
		self.'G1.machine.e2d' := self.'G1.machine.e2d0';
		DymolaConvertInputToREAL0 := false;
		self.'B3.p.vr' := (self.'B3.v_0' * cos(self.'B3.angle_0'));
		self.'B3.p.vi' := (self.'B3.v_0' * sin(self.'B3.angle_0'));
		self.w := 1.0;
		self.v := self.'G1.v_0';
		/*
			Initialize variables with start value equation (dependent initializations):
		*/
		self.'derivative(G1.machine.e1d)' := 0.0;
		self.'derivative(G1.machine.e2d)' := 0.0;
		/* Solve linear system of equations A*x = b: */
		'solution_buffer.for.x[6]' := solveLinearEquations(
			/* A matrix: */
			{
				/* Row 1: */
				{ (-1.0 * ((self.'transformer.x' / self.'transformer.m'))), (self.'transformer.r' / self.'transformer.m'), 0.0, 0.0, (((((((((self.'G1.machine.V_MBtoSB' * sin(self.'G1.machine.delta')) * (((1.0 / self.'transformer.m') / self.'transformer.m') - (1.0 / (self.'transformer.m' ^ 2)))) * (self.'G1.machine.T1q0' * ((self.'G1.machine.xq' - self.'G1.machine.x1q') - ((((self.'G1.machine.T2q0' * self.'G1.machine.x2q') * (self.'G1.machine.xq' - self.'G1.machine.x1q')) / self.'G1.machine.T1q0') / self.'G1.machine.x1q')))) / self.'G1.machine.T1q0') + ((((self.'G1.machine.V_MBtoSB' * sin(self.'G1.machine.delta')) * (((1.0 / self.'transformer.m') / self.'transformer.m') - (1.0 / (self.'transformer.m' ^ 2)))) * (self.'G1.machine.T2q0' * ((self.'G1.machine.x1q' - self.'G1.machine.x2q') + ((((self.'G1.machine.T2q0' * self.'G1.machine.x2q') * (self.'G1.machine.xq' - self.'G1.machine.x1q')) / self.'G1.machine.T1q0') / self.'G1.machine.x1q')))) / self.'G1.machine.T2q0')) + (((self.'G1.machine.V_MBtoSB' * sin(self.'G1.machine.delta')) * (((1.0 / self.'transformer.m') / self.'transformer.m') - (1.0 / (self.'transformer.m' ^ 2)))) * self.'G1.machine.x2q')) - (((self.'G1.machine.V_MBtoSB' * cos(self.'G1.machine.delta')) * (((1.0 / self.'transformer.m') / self.'transformer.m') - (1.0 / (self.'transformer.m' ^ 2)))) * self.'G1.machine.ra')) - (self.'transformer.x' * (self.'G1.machine.I_MBtoSB' * sin(self.'G1.machine.delta')))) + (self.'transformer.r' * (self.'G1.machine.I_MBtoSB' * cos(self.'G1.machine.delta')))), (((self.'transformer.x' * (self.'G1.machine.I_MBtoSB' * cos(self.'G1.machine.delta'))) - ((((self.'G1.machine.V_MBtoSB' * sin(self.'G1.machine.delta')) * (((1.0 / self.'transformer.m') / self.'transformer.m') - (1.0 / (self.'transformer.m' ^ 2)))) * self.'G1.machine.ra') + (((self.'G1.machine.V_MBtoSB' * cos(self.'G1.machine.delta')) * (((1.0 / self.'transformer.m') / self.'transformer.m') - (1.0 / (self.'transformer.m' ^ 2)))) * self.'G1.machine.x2d'))) + (self.'transformer.r' * (self.'G1.machine.I_MBtoSB' * sin(self.'G1.machine.delta')))) },
				/* Row 2: */
				{ (self.'transformer.r' / self.'transformer.m'), (self.'transformer.x' / self.'transformer.m'), 0.0, 0.0, (((self.'transformer.r' * (self.'G1.machine.I_MBtoSB' * sin(self.'G1.machine.delta'))) - (((((((self.'G1.machine.V_MBtoSB' * cos(self.'G1.machine.delta')) * (((1.0 / self.'transformer.m') / self.'transformer.m') - (1.0 / (self.'transformer.m' ^ 2)))) * (self.'G1.machine.T1q0' * ((self.'G1.machine.xq' - self.'G1.machine.x1q') - ((((self.'G1.machine.T2q0' * self.'G1.machine.x2q') * (self.'G1.machine.xq' - self.'G1.machine.x1q')) / self.'G1.machine.T1q0') / self.'G1.machine.x1q')))) / self.'G1.machine.T1q0') + ((((self.'G1.machine.V_MBtoSB' * cos(self.'G1.machine.delta')) * (((1.0 / self.'transformer.m') / self.'transformer.m') - (1.0 / (self.'transformer.m' ^ 2)))) * (self.'G1.machine.T2q0' * ((self.'G1.machine.x1q' - self.'G1.machine.x2q') + ((((self.'G1.machine.T2q0' * self.'G1.machine.x2q') * (self.'G1.machine.xq' - self.'G1.machine.x1q')) / self.'G1.machine.T1q0') / self.'G1.machine.x1q')))) / self.'G1.machine.T2q0')) + (((self.'G1.machine.V_MBtoSB' * cos(self.'G1.machine.delta')) * (((1.0 / self.'transformer.m') / self.'transformer.m') - (1.0 / (self.'transformer.m' ^ 2)))) * self.'G1.machine.x2q')) + (((self.'G1.machine.V_MBtoSB' * sin(self.'G1.machine.delta')) * (((1.0 / self.'transformer.m') / self.'transformer.m') - (1.0 / (self.'transformer.m' ^ 2)))) * self.'G1.machine.ra'))) + (self.'transformer.x' * (self.'G1.machine.I_MBtoSB' * cos(self.'G1.machine.delta')))), ((((((self.'G1.machine.V_MBtoSB' * cos(self.'G1.machine.delta')) * (((1.0 / self.'transformer.m') / self.'transformer.m') - (1.0 / (self.'transformer.m' ^ 2)))) * self.'G1.machine.ra') - (((self.'G1.machine.V_MBtoSB' * sin(self.'G1.machine.delta')) * (((1.0 / self.'transformer.m') / self.'transformer.m') - (1.0 / (self.'transformer.m' ^ 2)))) * self.'G1.machine.x2d')) - (self.'transformer.r' * (self.'G1.machine.I_MBtoSB' * cos(self.'G1.machine.delta')))) + (self.'transformer.x' * (self.'G1.machine.I_MBtoSB' * sin(self.'G1.machine.delta')))) },
				/* Row 3: */
				{ ((((((if (real(DymolaConvertInputToREAL0) == false) then 0.0 elseif (real(DymolaConvertInputToREAL0) == true) then 2.22e+3 else 0.0) * self.'L1.R') - ((self.'L1.R' * self.'L1.B') + (self.'L1.X' * self.'L1.G'))) * self.'transformer.r') - ((1.0 + (((self.'L1.R' * self.'L1.G') - (self.'L1.X' * self.'L1.B')) - ((if (real(DymolaConvertInputToREAL0) == false) then 0.0 elseif (real(DymolaConvertInputToREAL0) == true) then -2.22e+3 else 0.0) * self.'L1.X'))) * self.'transformer.x')) - self.'L1.X'), ((((1.0 + (((self.'L1.R' * self.'L1.G') - (self.'L1.X' * self.'L1.B')) - ((if (real(DymolaConvertInputToREAL0) == false) then 0.0 elseif (real(DymolaConvertInputToREAL0) == true) then -2.22e+3 else 0.0) * self.'L1.X'))) * self.'transformer.r') + ((((if (real(DymolaConvertInputToREAL0) == false) then 0.0 elseif (real(DymolaConvertInputToREAL0) == true) then 2.22e+3 else 0.0) * self.'L1.R') - ((self.'L1.R' * self.'L1.B') + (self.'L1.X' * self.'L1.G'))) * self.'transformer.x')) + self.'L1.R'), self.'L1.R', (-1.0 * self.'L1.X'), (((((((((self.'G1.machine.V_MBtoSB' * sin(self.'G1.machine.delta')) * (1.0 + (((self.'L1.R' * self.'L1.G') - (self.'L1.X' * self.'L1.B')) - ((if (real(DymolaConvertInputToREAL0) == false) then 0.0 elseif (real(DymolaConvertInputToREAL0) == true) then -2.22e+3 else 0.0) * self.'L1.X')))) - ((self.'G1.machine.V_MBtoSB' * cos(self.'G1.machine.delta')) * (((if (real(DymolaConvertInputToREAL0) == false) then 0.0 elseif (real(DymolaConvertInputToREAL0) == true) then 2.22e+3 else 0.0) * self.'L1.R') - ((self.'L1.R' * self.'L1.B') + (self.'L1.X' * self.'L1.G'))))) * (self.'G1.machine.T1q0' * ((self.'G1.machine.xq' - self.'G1.machine.x1q') - ((((self.'G1.machine.T2q0' * self.'G1.machine.x2q') * (self.'G1.machine.xq' - self.'G1.machine.x1q')) / self.'G1.machine.T1q0') / self.'G1.machine.x1q')))) / self.'transformer.m') / self.'G1.machine.T1q0') + ((((((self.'G1.machine.V_MBtoSB' * sin(self.'G1.machine.delta')) * (1.0 + (((self.'L1.R' * self.'L1.G') - (self.'L1.X' * self.'L1.B')) - ((if (real(DymolaConvertInputToREAL0) == false) then 0.0 elseif (real(DymolaConvertInputToREAL0) == true) then -2.22e+3 else 0.0) * self.'L1.X')))) - ((self.'G1.machine.V_MBtoSB' * cos(self.'G1.machine.delta')) * (((if (real(DymolaConvertInputToREAL0) == false) then 0.0 elseif (real(DymolaConvertInputToREAL0) == true) then 2.22e+3 else 0.0) * self.'L1.R') - ((self.'L1.R' * self.'L1.B') + (self.'L1.X' * self.'L1.G'))))) * (self.'G1.machine.T2q0' * ((self.'G1.machine.x1q' - self.'G1.machine.x2q') + ((((self.'G1.machine.T2q0' * self.'G1.machine.x2q') * (self.'G1.machine.xq' - self.'G1.machine.x1q')) / self.'G1.machine.T1q0') / self.'G1.machine.x1q')))) / self.'transformer.m') / self.'G1.machine.T2q0')) + (((((self.'G1.machine.V_MBtoSB' * sin(self.'G1.machine.delta')) * (1.0 + (((self.'L1.R' * self.'L1.G') - (self.'L1.X' * self.'L1.B')) - ((if (real(DymolaConvertInputToREAL0) == false) then 0.0 elseif (real(DymolaConvertInputToREAL0) == true) then -2.22e+3 else 0.0) * self.'L1.X')))) - ((self.'G1.machine.V_MBtoSB' * cos(self.'G1.machine.delta')) * (((if (real(DymolaConvertInputToREAL0) == false) then 0.0 elseif (real(DymolaConvertInputToREAL0) == true) then 2.22e+3 else 0.0) * self.'L1.R') - ((self.'L1.R' * self.'L1.B') + (self.'L1.X' * self.'L1.G'))))) * self.'G1.machine.x2q') / self.'transformer.m')) - (((((self.'G1.machine.V_MBtoSB' * cos(self.'G1.machine.delta')) * (1.0 + (((self.'L1.R' * self.'L1.G') - (self.'L1.X' * self.'L1.B')) - ((if (real(DymolaConvertInputToREAL0) == false) then 0.0 elseif (real(DymolaConvertInputToREAL0) == true) then -2.22e+3 else 0.0) * self.'L1.X')))) + ((self.'G1.machine.V_MBtoSB' * sin(self.'G1.machine.delta')) * (((if (real(DymolaConvertInputToREAL0) == false) then 0.0 elseif (real(DymolaConvertInputToREAL0) == true) then 2.22e+3 else 0.0) * self.'L1.R') - ((self.'L1.R' * self.'L1.B') + (self.'L1.X' * self.'L1.G'))))) * self.'G1.machine.ra') / self.'transformer.m')), (-1.0 * (((((((self.'G1.machine.V_MBtoSB' * sin(self.'G1.machine.delta')) * (1.0 + (((self.'L1.R' * self.'L1.G') - (self.'L1.X' * self.'L1.B')) - ((if (real(DymolaConvertInputToREAL0) == false) then 0.0 elseif (real(DymolaConvertInputToREAL0) == true) then -2.22e+3 else 0.0) * self.'L1.X')))) - ((self.'G1.machine.V_MBtoSB' * cos(self.'G1.machine.delta')) * (((if (real(DymolaConvertInputToREAL0) == false) then 0.0 elseif (real(DymolaConvertInputToREAL0) == true) then 2.22e+3 else 0.0) * self.'L1.R') - ((self.'L1.R' * self.'L1.B') + (self.'L1.X' * self.'L1.G'))))) * self.'G1.machine.ra') + ((((self.'G1.machine.V_MBtoSB' * cos(self.'G1.machine.delta')) * (1.0 + (((self.'L1.R' * self.'L1.G') - (self.'L1.X' * self.'L1.B')) - ((if (real(DymolaConvertInputToREAL0) == false) then 0.0 elseif (real(DymolaConvertInputToREAL0) == true) then -2.22e+3 else 0.0) * self.'L1.X')))) + ((self.'G1.machine.V_MBtoSB' * sin(self.'G1.machine.delta')) * (((if (real(DymolaConvertInputToREAL0) == false) then 0.0 elseif (real(DymolaConvertInputToREAL0) == true) then 2.22e+3 else 0.0) * self.'L1.R') - ((self.'L1.R' * self.'L1.B') + (self.'L1.X' * self.'L1.G'))))) * self.'G1.machine.x2d')) / self.'transformer.m'))) },
				/* Row 4: */
				{ ((((1.0 + (((self.'L1.R' * self.'L1.G') - (self.'L1.X' * self.'L1.B')) + ((if (real(DymolaConvertInputToREAL0) == false) then 0.0 elseif (real(DymolaConvertInputToREAL0) == true) then 2.22e+3 else 0.0) * self.'L1.X'))) * self.'transformer.r') - ((((self.'L1.R' * self.'L1.B') + (self.'L1.X' * self.'L1.G')) + ((if (real(DymolaConvertInputToREAL0) == false) then 0.0 elseif (real(DymolaConvertInputToREAL0) == true) then -2.22e+3 else 0.0) * self.'L1.R')) * self.'transformer.x')) + self.'L1.R'), ((((((self.'L1.R' * self.'L1.B') + (self.'L1.X' * self.'L1.G')) + ((if (real(DymolaConvertInputToREAL0) == false) then 0.0 elseif (real(DymolaConvertInputToREAL0) == true) then -2.22e+3 else 0.0) * self.'L1.R')) * self.'transformer.r') + ((1.0 + (((self.'L1.R' * self.'L1.G') - (self.'L1.X' * self.'L1.B')) + ((if (real(DymolaConvertInputToREAL0) == false) then 0.0 elseif (real(DymolaConvertInputToREAL0) == true) then 2.22e+3 else 0.0) * self.'L1.X'))) * self.'transformer.x')) + self.'L1.X'), self.'L1.X', self.'L1.R', (((((((((self.'G1.machine.V_MBtoSB' * sin(self.'G1.machine.delta')) * (((self.'L1.R' * self.'L1.B') + (self.'L1.X' * self.'L1.G')) + ((if (real(DymolaConvertInputToREAL0) == false) then 0.0 elseif (real(DymolaConvertInputToREAL0) == true) then -2.22e+3 else 0.0) * self.'L1.R'))) - ((self.'G1.machine.V_MBtoSB' * cos(self.'G1.machine.delta')) * (1.0 + (((self.'L1.R' * self.'L1.G') - (self.'L1.X' * self.'L1.B')) + ((if (real(DymolaConvertInputToREAL0) == false) then 0.0 elseif (real(DymolaConvertInputToREAL0) == true) then 2.22e+3 else 0.0) * self.'L1.X'))))) * (self.'G1.machine.T1q0' * ((self.'G1.machine.xq' - self.'G1.machine.x1q') - ((((self.'G1.machine.T2q0' * self.'G1.machine.x2q') * (self.'G1.machine.xq' - self.'G1.machine.x1q')) / self.'G1.machine.T1q0') / self.'G1.machine.x1q')))) / self.'transformer.m') / self.'G1.machine.T1q0') + ((((((self.'G1.machine.V_MBtoSB' * sin(self.'G1.machine.delta')) * (((self.'L1.R' * self.'L1.B') + (self.'L1.X' * self.'L1.G')) + ((if (real(DymolaConvertInputToREAL0) == false) then 0.0 elseif (real(DymolaConvertInputToREAL0) == true) then -2.22e+3 else 0.0) * self.'L1.R'))) - ((self.'G1.machine.V_MBtoSB' * cos(self.'G1.machine.delta')) * (1.0 + (((self.'L1.R' * self.'L1.G') - (self.'L1.X' * self.'L1.B')) + ((if (real(DymolaConvertInputToREAL0) == false) then 0.0 elseif (real(DymolaConvertInputToREAL0) == true) then 2.22e+3 else 0.0) * self.'L1.X'))))) * (self.'G1.machine.T2q0' * ((self.'G1.machine.x1q' - self.'G1.machine.x2q') + ((((self.'G1.machine.T2q0' * self.'G1.machine.x2q') * (self.'G1.machine.xq' - self.'G1.machine.x1q')) / self.'G1.machine.T1q0') / self.'G1.machine.x1q')))) / self.'transformer.m') / self.'G1.machine.T2q0')) + (((((self.'G1.machine.V_MBtoSB' * sin(self.'G1.machine.delta')) * (((self.'L1.R' * self.'L1.B') + (self.'L1.X' * self.'L1.G')) + ((if (real(DymolaConvertInputToREAL0) == false) then 0.0 elseif (real(DymolaConvertInputToREAL0) == true) then -2.22e+3 else 0.0) * self.'L1.R'))) - ((self.'G1.machine.V_MBtoSB' * cos(self.'G1.machine.delta')) * (1.0 + (((self.'L1.R' * self.'L1.G') - (self.'L1.X' * self.'L1.B')) + ((if (real(DymolaConvertInputToREAL0) == false) then 0.0 elseif (real(DymolaConvertInputToREAL0) == true) then 2.22e+3 else 0.0) * self.'L1.X'))))) * self.'G1.machine.x2q') / self.'transformer.m')) - (((((self.'G1.machine.V_MBtoSB' * cos(self.'G1.machine.delta')) * (((self.'L1.R' * self.'L1.B') + (self.'L1.X' * self.'L1.G')) + ((if (real(DymolaConvertInputToREAL0) == false) then 0.0 elseif (real(DymolaConvertInputToREAL0) == true) then -2.22e+3 else 0.0) * self.'L1.R'))) + ((self.'G1.machine.V_MBtoSB' * sin(self.'G1.machine.delta')) * (1.0 + (((self.'L1.R' * self.'L1.G') - (self.'L1.X' * self.'L1.B')) + ((if (real(DymolaConvertInputToREAL0) == false) then 0.0 elseif (real(DymolaConvertInputToREAL0) == true) then 2.22e+3 else 0.0) * self.'L1.X'))))) * self.'G1.machine.ra') / self.'transformer.m')), (-1.0 * (((((((self.'G1.machine.V_MBtoSB' * sin(self.'G1.machine.delta')) * (((self.'L1.R' * self.'L1.B') + (self.'L1.X' * self.'L1.G')) + ((if (real(DymolaConvertInputToREAL0) == false) then 0.0 elseif (real(DymolaConvertInputToREAL0) == true) then -2.22e+3 else 0.0) * self.'L1.R'))) - ((self.'G1.machine.V_MBtoSB' * cos(self.'G1.machine.delta')) * (1.0 + (((self.'L1.R' * self.'L1.G') - (self.'L1.X' * self.'L1.B')) + ((if (real(DymolaConvertInputToREAL0) == false) then 0.0 elseif (real(DymolaConvertInputToREAL0) == true) then 2.22e+3 else 0.0) * self.'L1.X'))))) * self.'G1.machine.ra') + ((((self.'G1.machine.V_MBtoSB' * cos(self.'G1.machine.delta')) * (((self.'L1.R' * self.'L1.B') + (self.'L1.X' * self.'L1.G')) + ((if (real(DymolaConvertInputToREAL0) == false) then 0.0 elseif (real(DymolaConvertInputToREAL0) == true) then -2.22e+3 else 0.0) * self.'L1.R'))) + ((self.'G1.machine.V_MBtoSB' * sin(self.'G1.machine.delta')) * (1.0 + (((self.'L1.R' * self.'L1.G') - (self.'L1.X' * self.'L1.B')) + ((if (real(DymolaConvertInputToREAL0) == false) then 0.0 elseif (real(DymolaConvertInputToREAL0) == true) then 2.22e+3 else 0.0) * self.'L1.X'))))) * self.'G1.machine.x2d')) / self.'transformer.m'))) },
				/* Row 5: */
				{ (-1.0 * ((((1.0 + ((self.'L2.R' * self.'L2.G') - (self.'L2.X' * self.'L2.B'))) * self.'transformer.x') + (((self.'L2.R' * self.'L2.B') + (self.'L2.X' * self.'L2.G')) * self.'transformer.r')))), (((1.0 + ((self.'L2.R' * self.'L2.G') - (self.'L2.X' * self.'L2.B'))) * self.'transformer.r') - (((self.'L2.R' * self.'L2.B') + (self.'L2.X' * self.'L2.G')) * self.'transformer.x')), (-1.0 * (self.'L2.R')), self.'L2.X', (((((((((self.'G1.machine.V_MBtoSB' * sin(self.'G1.machine.delta')) * (1.0 + ((self.'L2.R' * self.'L2.G') - (self.'L2.X' * self.'L2.B')))) + ((self.'G1.machine.V_MBtoSB' * cos(self.'G1.machine.delta')) * ((self.'L2.R' * self.'L2.B') + (self.'L2.X' * self.'L2.G')))) * (self.'G1.machine.T1q0' * ((self.'G1.machine.xq' - self.'G1.machine.x1q') - ((((self.'G1.machine.T2q0' * self.'G1.machine.x2q') * (self.'G1.machine.xq' - self.'G1.machine.x1q')) / self.'G1.machine.T1q0') / self.'G1.machine.x1q')))) / self.'transformer.m') / self.'G1.machine.T1q0') + ((((((self.'G1.machine.V_MBtoSB' * sin(self.'G1.machine.delta')) * (1.0 + ((self.'L2.R' * self.'L2.G') - (self.'L2.X' * self.'L2.B')))) + ((self.'G1.machine.V_MBtoSB' * cos(self.'G1.machine.delta')) * ((self.'L2.R' * self.'L2.B') + (self.'L2.X' * self.'L2.G')))) * (self.'G1.machine.T2q0' * ((self.'G1.machine.x1q' - self.'G1.machine.x2q') + ((((self.'G1.machine.T2q0' * self.'G1.machine.x2q') * (self.'G1.machine.xq' - self.'G1.machine.x1q')) / self.'G1.machine.T1q0') / self.'G1.machine.x1q')))) / self.'transformer.m') / self.'G1.machine.T2q0')) + (((((self.'G1.machine.V_MBtoSB' * sin(self.'G1.machine.delta')) * (1.0 + ((self.'L2.R' * self.'L2.G') - (self.'L2.X' * self.'L2.B')))) + ((self.'G1.machine.V_MBtoSB' * cos(self.'G1.machine.delta')) * ((self.'L2.R' * self.'L2.B') + (self.'L2.X' * self.'L2.G')))) * self.'G1.machine.x2q') / self.'transformer.m')) - (((((self.'G1.machine.V_MBtoSB' * cos(self.'G1.machine.delta')) * (1.0 + ((self.'L2.R' * self.'L2.G') - (self.'L2.X' * self.'L2.B')))) - ((self.'G1.machine.V_MBtoSB' * sin(self.'G1.machine.delta')) * ((self.'L2.R' * self.'L2.B') + (self.'L2.X' * self.'L2.G')))) * self.'G1.machine.ra') / self.'transformer.m')), (-1.0 * (((((((self.'G1.machine.V_MBtoSB' * sin(self.'G1.machine.delta')) * (1.0 + ((self.'L2.R' * self.'L2.G') - (self.'L2.X' * self.'L2.B')))) + ((self.'G1.machine.V_MBtoSB' * cos(self.'G1.machine.delta')) * ((self.'L2.R' * self.'L2.B') + (self.'L2.X' * self.'L2.G')))) * self.'G1.machine.ra') + ((((self.'G1.machine.V_MBtoSB' * cos(self.'G1.machine.delta')) * (1.0 + ((self.'L2.R' * self.'L2.G') - (self.'L2.X' * self.'L2.B')))) - ((self.'G1.machine.V_MBtoSB' * sin(self.'G1.machine.delta')) * ((self.'L2.R' * self.'L2.B') + (self.'L2.X' * self.'L2.G')))) * self.'G1.machine.x2d')) / self.'transformer.m'))) },
				/* Row 6: */
				{ (((1.0 + ((self.'L2.R' * self.'L2.G') - (self.'L2.X' * self.'L2.B'))) * self.'transformer.r') - (((self.'L2.R' * self.'L2.B') + (self.'L2.X' * self.'L2.G')) * self.'transformer.x')), ((((self.'L2.R' * self.'L2.B') + (self.'L2.X' * self.'L2.G')) * self.'transformer.r') + ((1.0 + ((self.'L2.R' * self.'L2.G') - (self.'L2.X' * self.'L2.B'))) * self.'transformer.x')), (-1.0 * (self.'L2.X')), (-1.0 * (self.'L2.R')), (((((((((self.'G1.machine.V_MBtoSB' * sin(self.'G1.machine.delta')) * ((self.'L2.R' * self.'L2.B') + (self.'L2.X' * self.'L2.G'))) - ((self.'G1.machine.V_MBtoSB' * cos(self.'G1.machine.delta')) * (1.0 + ((self.'L2.R' * self.'L2.G') - (self.'L2.X' * self.'L2.B'))))) * (self.'G1.machine.T1q0' * ((self.'G1.machine.xq' - self.'G1.machine.x1q') - ((((self.'G1.machine.T2q0' * self.'G1.machine.x2q') * (self.'G1.machine.xq' - self.'G1.machine.x1q')) / self.'G1.machine.T1q0') / self.'G1.machine.x1q')))) / self.'transformer.m') / self.'G1.machine.T1q0') + ((((((self.'G1.machine.V_MBtoSB' * sin(self.'G1.machine.delta')) * ((self.'L2.R' * self.'L2.B') + (self.'L2.X' * self.'L2.G'))) - ((self.'G1.machine.V_MBtoSB' * cos(self.'G1.machine.delta')) * (1.0 + ((self.'L2.R' * self.'L2.G') - (self.'L2.X' * self.'L2.B'))))) * (self.'G1.machine.T2q0' * ((self.'G1.machine.x1q' - self.'G1.machine.x2q') + ((((self.'G1.machine.T2q0' * self.'G1.machine.x2q') * (self.'G1.machine.xq' - self.'G1.machine.x1q')) / self.'G1.machine.T1q0') / self.'G1.machine.x1q')))) / self.'transformer.m') / self.'G1.machine.T2q0')) + (((((self.'G1.machine.V_MBtoSB' * sin(self.'G1.machine.delta')) * ((self.'L2.R' * self.'L2.B') + (self.'L2.X' * self.'L2.G'))) - ((self.'G1.machine.V_MBtoSB' * cos(self.'G1.machine.delta')) * (1.0 + ((self.'L2.R' * self.'L2.G') - (self.'L2.X' * self.'L2.B'))))) * self.'G1.machine.x2q') / self.'transformer.m')) - (((((self.'G1.machine.V_MBtoSB' * cos(self.'G1.machine.delta')) * ((self.'L2.R' * self.'L2.B') + (self.'L2.X' * self.'L2.G'))) + ((self.'G1.machine.V_MBtoSB' * sin(self.'G1.machine.delta')) * (1.0 + ((self.'L2.R' * self.'L2.G') - (self.'L2.X' * self.'L2.B'))))) * self.'G1.machine.ra') / self.'transformer.m')), (-1.0 * (((((((self.'G1.machine.V_MBtoSB' * sin(self.'G1.machine.delta')) * ((self.'L2.R' * self.'L2.B') + (self.'L2.X' * self.'L2.G'))) - ((self.'G1.machine.V_MBtoSB' * cos(self.'G1.machine.delta')) * (1.0 + ((self.'L2.R' * self.'L2.G') - (self.'L2.X' * self.'L2.B'))))) * self.'G1.machine.ra') + ((((self.'G1.machine.V_MBtoSB' * cos(self.'G1.machine.delta')) * ((self.'L2.R' * self.'L2.B') + (self.'L2.X' * self.'L2.G'))) + ((self.'G1.machine.V_MBtoSB' * sin(self.'G1.machine.delta')) * (1.0 + ((self.'L2.R' * self.'L2.G') - (self.'L2.X' * self.'L2.B'))))) * self.'G1.machine.x2d')) / self.'transformer.m'))) }
			},
			/* b vector: */
			{ (-1.0 * ((((self.'G1.machine.V_MBtoSB' * cos(self.'G1.machine.delta')) * (((1.0 / self.'transformer.m') / self.'transformer.m') - (1.0 / (self.'transformer.m' ^ 2)))) * self.'G1.machine.e2q'))), (-1.0 * ((((self.'G1.machine.V_MBtoSB' * sin(self.'G1.machine.delta')) * (((1.0 / self.'transformer.m') / self.'transformer.m') - (1.0 / (self.'transformer.m' ^ 2)))) * self.'G1.machine.e2q'))), (self.'B3.p.vr' - (((((self.'G1.machine.V_MBtoSB' * cos(self.'G1.machine.delta')) * (1.0 + (((self.'L1.R' * self.'L1.G') - (self.'L1.X' * self.'L1.B')) - ((if (real(DymolaConvertInputToREAL0) == false) then 0.0 elseif (real(DymolaConvertInputToREAL0) == true) then -2.22e+3 else 0.0) * self.'L1.X')))) + ((self.'G1.machine.V_MBtoSB' * sin(self.'G1.machine.delta')) * (((if (real(DymolaConvertInputToREAL0) == false) then 0.0 elseif (real(DymolaConvertInputToREAL0) == true) then 2.22e+3 else 0.0) * self.'L1.R') - ((self.'L1.R' * self.'L1.B') + (self.'L1.X' * self.'L1.G'))))) * self.'G1.machine.e2q') / self.'transformer.m')), (self.'B3.p.vi' - (((((self.'G1.machine.V_MBtoSB' * cos(self.'G1.machine.delta')) * (((self.'L1.R' * self.'L1.B') + (self.'L1.X' * self.'L1.G')) + ((if (real(DymolaConvertInputToREAL0) == false) then 0.0 elseif (real(DymolaConvertInputToREAL0) == true) then -2.22e+3 else 0.0) * self.'L1.R'))) + ((self.'G1.machine.V_MBtoSB' * sin(self.'G1.machine.delta')) * (1.0 + (((self.'L1.R' * self.'L1.G') - (self.'L1.X' * self.'L1.B')) + ((if (real(DymolaConvertInputToREAL0) == false) then 0.0 elseif (real(DymolaConvertInputToREAL0) == true) then 2.22e+3 else 0.0) * self.'L1.X'))))) * self.'G1.machine.e2q') / self.'transformer.m')), (self.'B3.p.vr' - (((((self.'G1.machine.V_MBtoSB' * cos(self.'G1.machine.delta')) * (1.0 + ((self.'L2.R' * self.'L2.G') - (self.'L2.X' * self.'L2.B')))) - ((self.'G1.machine.V_MBtoSB' * sin(self.'G1.machine.delta')) * ((self.'L2.R' * self.'L2.B') + (self.'L2.X' * self.'L2.G')))) * self.'G1.machine.e2q') / self.'transformer.m')), (self.'B3.p.vi' - (((((self.'G1.machine.V_MBtoSB' * cos(self.'G1.machine.delta')) * ((self.'L2.R' * self.'L2.B') + (self.'L2.X' * self.'L2.G'))) + ((self.'G1.machine.V_MBtoSB' * sin(self.'G1.machine.delta')) * (1.0 + ((self.'L2.R' * self.'L2.G') - (self.'L2.X' * self.'L2.B'))))) * self.'G1.machine.e2q') / self.'transformer.m')) });
if false then
			/* Set states to default start-values and propagate error: */
			self.'transformer.n.ii' := 1.00000000000000008e-15;
			self.'transformer.n.ir' := 1.00000000000000008e-15;
			self.'L2.p.ir' := 1.00000000000000008e-15;
			self.'L2.p.ii' := 1.00000000000000008e-15;
			self.'G1.machine.iq' := self.'G1.machine.iq0';
			self.'G1.machine.id' := self.'G1.machine.id0';

		else
			/* Only if the system can be solved, assign computed states: */
			self.'transformer.n.ii' := 'solution_buffer.for.x[6]'[1];
			self.'transformer.n.ir' := 'solution_buffer.for.x[6]'[2];
			self.'L2.p.ir' := 'solution_buffer.for.x[6]'[3];
			self.'L2.p.ii' := 'solution_buffer.for.x[6]'[4];
			self.'G1.machine.iq' := 'solution_buffer.for.x[6]'[5];
			self.'G1.machine.id' := 'solution_buffer.for.x[6]'[6];
		end if;
	end Reinitialize;

	function Saturate
		input Self self_in;
		output Self self = self_in;
	algorithm
	end Saturate;
end 'PSSDesign.eFMUs4RTHIL.GridForHILTesting: static initialization';
