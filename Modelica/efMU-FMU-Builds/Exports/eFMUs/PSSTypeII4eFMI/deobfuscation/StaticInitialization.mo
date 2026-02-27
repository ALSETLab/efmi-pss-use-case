encapsulated package 'PSSDesign.Components.PSSTypeII4eFMI: static initialization'
	extends .DymolaEmbedded.Icons.EmbeddedBuiltinFunction;

	import DymolaEmbedded.BuiltinFunctions.*;

	record Self

	/* ********************************************************************************************************** Block inputs: */
	Real vSI;

	/* ********************************************************************************************************* Block outputs: */
	Real vs;

	/* **************************************************************************************************** Tunable parameters: */
	Real Kw;
	Real T1;
	Real T2;
	Real T3;
	Real T4;
	Real Tw;
	Real vSI_start;
	Real vsmax;
	Real vsmin;
	/* derivativeLag: */
	Real 'derivativeLag.y_start';
	Real 'derivativeLag.K';
	Real 'derivativeLag.K_dummy';
	Real 'derivativeLag.T';
	Real 'derivativeLag.T_dummy';

	/* derivativeLag.TF: */
	Real 'derivativeLag.TF.a'[ 2 ];
	Real 'derivativeLag.TF.b'[ 2 ];
	Real 'derivativeLag.TF.bb'[ 2 ];
	Real 'derivativeLag.TF.d';
	Real 'derivativeLag.TF.y_start';
	Real 'derivative(derivativeLag.TF.x_scaled[1])';
	Real 'derivativeLag.TF.x_scaled'[ 1 ];

	/* imLeadLag: */
	Real 'imLeadLag.K';
	Real 'imLeadLag.y_start';
	Real 'imLeadLag.T1';
	Real 'imLeadLag.T2';
	Real 'imLeadLag.T2_dummy';

	/* imLeadLag.TF: */
	Real 'imLeadLag.TF.a'[ 2 ];
	Real 'imLeadLag.TF.b'[ 2 ];
	Real 'imLeadLag.TF.bb'[ 2 ];
	Real 'imLeadLag.TF.d';
	Real 'imLeadLag.TF.y_start';
	Real 'derivative(imLeadLag.TF.x_scaled[1])';
	Real 'imLeadLag.TF.x_scaled'[ 1 ];

	/* imLeadLag1: */
	Real 'imLeadLag1.K';
	Real 'imLeadLag1.y_start';
	Real 'imLeadLag1.T1';
	Real 'imLeadLag1.T2';
	Real 'imLeadLag1.T2_dummy';

	/* imLeadLag1.TF: */
	Real 'imLeadLag1.TF.a'[ 2 ];
	Real 'imLeadLag1.TF.b'[ 2 ];
	Real 'imLeadLag1.TF.bb'[ 2 ];
	Real 'imLeadLag1.TF.d';
	Real 'imLeadLag1.TF.y_start';
	Real 'derivative(imLeadLag1.TF.x_scaled[1])';
	Real 'imLeadLag1.TF.x_scaled'[ 1 ];

	/* limiter: */
	Real 'limiter.uMax';
	Real 'limiter.uMin';

	/* Internal sampling time: */
	Real 'discrete.stepSize';
	Boolean 'discrete.stepSize.active';

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
		  problem = "'PSSDesign.Components.PSSTypeII4eFMI: static initialization'.StartupModel",
		  resultFile = result_file);
		
		if succeeded then
			trajectories_buffer[1:60] := .DymolaCommands.Trajectories.readTrajectory(
			 fileName = result_file + ".mat",
			 rows = 1,
			 signals = {
			  "self.vSI",
			  "self.vs",
			  "self.Kw",
			  "self.T1",
			  "self.T2",
			  "self.T3",
			  "self.T4",
			  "self.Tw",
			  "self.vSI_start",
			  "self.vsmax",
			  "self.vsmin",
			  "self.'derivativeLag.y_start'",
			  "self.'derivativeLag.K'",
			  "self.'derivativeLag.K_dummy'",
			  "self.'derivativeLag.T'",
			  "self.'derivativeLag.T_dummy'",
			  "self.'derivativeLag.TF.a'[1]",
			  "self.'derivativeLag.TF.a'[2]",
			  "self.'derivativeLag.TF.b'[1]",
			  "self.'derivativeLag.TF.b'[2]",
			  "self.'derivativeLag.TF.bb'[1]",
			  "self.'derivativeLag.TF.bb'[2]",
			  "self.'derivativeLag.TF.d'",
			  "self.'derivativeLag.TF.y_start'",
			  "self.'derivative(derivativeLag.TF.x_scaled[1])'",
			  "self.'derivativeLag.TF.x_scaled'[1]",
			  "self.'imLeadLag.K'",
			  "self.'imLeadLag.y_start'",
			  "self.'imLeadLag.T1'",
			  "self.'imLeadLag.T2'",
			  "self.'imLeadLag.T2_dummy'",
			  "self.'imLeadLag.TF.a'[1]",
			  "self.'imLeadLag.TF.a'[2]",
			  "self.'imLeadLag.TF.b'[1]",
			  "self.'imLeadLag.TF.b'[2]",
			  "self.'imLeadLag.TF.bb'[1]",
			  "self.'imLeadLag.TF.bb'[2]",
			  "self.'imLeadLag.TF.d'",
			  "self.'imLeadLag.TF.y_start'",
			  "self.'derivative(imLeadLag.TF.x_scaled[1])'",
			  "self.'imLeadLag.TF.x_scaled'[1]",
			  "self.'imLeadLag1.K'",
			  "self.'imLeadLag1.y_start'",
			  "self.'imLeadLag1.T1'",
			  "self.'imLeadLag1.T2'",
			  "self.'imLeadLag1.T2_dummy'",
			  "self.'imLeadLag1.TF.a'[1]",
			  "self.'imLeadLag1.TF.a'[2]",
			  "self.'imLeadLag1.TF.b'[1]",
			  "self.'imLeadLag1.TF.b'[2]",
			  "self.'imLeadLag1.TF.bb'[1]",
			  "self.'imLeadLag1.TF.bb'[2]",
			  "self.'imLeadLag1.TF.d'",
			  "self.'imLeadLag1.TF.y_start'",
			  "self.'derivative(imLeadLag1.TF.x_scaled[1])'",
			  "self.'imLeadLag1.TF.x_scaled'[1]",
			  "self.'limiter.uMax'",
			  "self.'limiter.uMin'",
			  "self.'discrete.stepSize'",
			  "self.'discrete.stepSize.active'"});
			self.vSI := trajectories_buffer[1, 1];
			self.vs := trajectories_buffer[2, 1];
			self.Kw := trajectories_buffer[3, 1];
			self.T1 := trajectories_buffer[4, 1];
			self.T2 := trajectories_buffer[5, 1];
			self.T3 := trajectories_buffer[6, 1];
			self.T4 := trajectories_buffer[7, 1];
			self.Tw := trajectories_buffer[8, 1];
			self.vSI_start := trajectories_buffer[9, 1];
			self.vsmax := trajectories_buffer[10, 1];
			self.vsmin := trajectories_buffer[11, 1];
			self.'derivativeLag.y_start' := trajectories_buffer[12, 1];
			self.'derivativeLag.K' := trajectories_buffer[13, 1];
			self.'derivativeLag.K_dummy' := trajectories_buffer[14, 1];
			self.'derivativeLag.T' := trajectories_buffer[15, 1];
			self.'derivativeLag.T_dummy' := trajectories_buffer[16, 1];
			self.'derivativeLag.TF.a'[1] := trajectories_buffer[17, 1];
			self.'derivativeLag.TF.a'[2] := trajectories_buffer[18, 1];
			self.'derivativeLag.TF.b'[1] := trajectories_buffer[19, 1];
			self.'derivativeLag.TF.b'[2] := trajectories_buffer[20, 1];
			self.'derivativeLag.TF.bb'[1] := trajectories_buffer[21, 1];
			self.'derivativeLag.TF.bb'[2] := trajectories_buffer[22, 1];
			self.'derivativeLag.TF.d' := trajectories_buffer[23, 1];
			self.'derivativeLag.TF.y_start' := trajectories_buffer[24, 1];
			self.'derivative(derivativeLag.TF.x_scaled[1])' := trajectories_buffer[25, 1];
			self.'derivativeLag.TF.x_scaled'[1] := trajectories_buffer[26, 1];
			self.'imLeadLag.K' := trajectories_buffer[27, 1];
			self.'imLeadLag.y_start' := trajectories_buffer[28, 1];
			self.'imLeadLag.T1' := trajectories_buffer[29, 1];
			self.'imLeadLag.T2' := trajectories_buffer[30, 1];
			self.'imLeadLag.T2_dummy' := trajectories_buffer[31, 1];
			self.'imLeadLag.TF.a'[1] := trajectories_buffer[32, 1];
			self.'imLeadLag.TF.a'[2] := trajectories_buffer[33, 1];
			self.'imLeadLag.TF.b'[1] := trajectories_buffer[34, 1];
			self.'imLeadLag.TF.b'[2] := trajectories_buffer[35, 1];
			self.'imLeadLag.TF.bb'[1] := trajectories_buffer[36, 1];
			self.'imLeadLag.TF.bb'[2] := trajectories_buffer[37, 1];
			self.'imLeadLag.TF.d' := trajectories_buffer[38, 1];
			self.'imLeadLag.TF.y_start' := trajectories_buffer[39, 1];
			self.'derivative(imLeadLag.TF.x_scaled[1])' := trajectories_buffer[40, 1];
			self.'imLeadLag.TF.x_scaled'[1] := trajectories_buffer[41, 1];
			self.'imLeadLag1.K' := trajectories_buffer[42, 1];
			self.'imLeadLag1.y_start' := trajectories_buffer[43, 1];
			self.'imLeadLag1.T1' := trajectories_buffer[44, 1];
			self.'imLeadLag1.T2' := trajectories_buffer[45, 1];
			self.'imLeadLag1.T2_dummy' := trajectories_buffer[46, 1];
			self.'imLeadLag1.TF.a'[1] := trajectories_buffer[47, 1];
			self.'imLeadLag1.TF.a'[2] := trajectories_buffer[48, 1];
			self.'imLeadLag1.TF.b'[1] := trajectories_buffer[49, 1];
			self.'imLeadLag1.TF.b'[2] := trajectories_buffer[50, 1];
			self.'imLeadLag1.TF.bb'[1] := trajectories_buffer[51, 1];
			self.'imLeadLag1.TF.bb'[2] := trajectories_buffer[52, 1];
			self.'imLeadLag1.TF.d' := trajectories_buffer[53, 1];
			self.'imLeadLag1.TF.y_start' := trajectories_buffer[54, 1];
			self.'derivative(imLeadLag1.TF.x_scaled[1])' := trajectories_buffer[55, 1];
			self.'imLeadLag1.TF.x_scaled'[1] := trajectories_buffer[56, 1];
			self.'limiter.uMax' := trajectories_buffer[57, 1];
			self.'limiter.uMin' := trajectories_buffer[58, 1];
			self.'discrete.stepSize' := trajectories_buffer[59, 1];
			self.'discrete.stepSize.active' := trajectories_buffer[60, 1] > 0.0;

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
		
		assert(succeeded, "Simulation of 'PSSDesign.Components.PSSTypeII4eFMI: static initialization'.StartupModel failed.");
		
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
		self.'imLeadLag.K' := 1.0;
		self.'imLeadLag1.K' := 1.0;
		self.'derivativeLag.y_start' := 0.0;
		self.'imLeadLag1.y_start' := 0.0;
		self.'imLeadLag.y_start' := 0.0;

		/* ******************************************************* Default initialize tuneable parameters (based on constants): */
		/*
			Initialize variables with explicit start value (independent initializations):
		*/
		self.Tw := 1.40999999999999992;
		self.Kw := 9.5;
		self.vsmin := -2.00000000000000011e-1;
		self.vsmax := 2.00000000000000011e-1;
		self.T4 := 1.0;
		self.T3 := 1.0;
		self.T2 := 3.30000000000000016e-2;
		self.T1 := 1.53999999999999998e-1;
		self.vSI_start := 1.0;

		/* ****************************** Default initialize dependend parameters (based on constants and tuneable parameters): */
		self := Saturate(self);
		self := Recalibrate(self);
		self := Saturate(self);

		/* ***************************************************** Default initialize inputs (based on constants and parameters): */
		/*
			Initialize variables with start value equation (dependent initializations):
		*/
		self.vSI := self.vSI_start;

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
		self.'imLeadLag.T1' := self.T1;
		self.'imLeadLag.T2' := self.T2;
		self.'imLeadLag.TF.b'[ 1 ] := (self.'imLeadLag.K' * self.'imLeadLag.T1');
		self.'imLeadLag.TF.b'[ 2 ] := self.'imLeadLag.K';
		self.'imLeadLag.T2_dummy' := (if (absolute((self.'imLeadLag.T1' - self.'imLeadLag.T2')) < 2.22044604925031308e-16) then 1.0e+3 else self.'imLeadLag.T2');
		self.'imLeadLag.TF.a'[ 1 ] := self.'imLeadLag.T2_dummy';
		self.'imLeadLag.TF.y_start' := self.'imLeadLag.y_start';
		self.'imLeadLag.TF.bb'[ 1 ] := self.'imLeadLag.TF.b'[ 1 ];
		self.'imLeadLag.TF.bb'[ 2 ] := self.'imLeadLag.TF.b'[ 2 ];
		self.'imLeadLag.TF.d' := (self.'imLeadLag.TF.bb'[ 1 ] / self.'imLeadLag.TF.a'[ 1 ]);
		self.'imLeadLag1.T1' := self.T3;
		self.'imLeadLag1.T2' := self.T4;
		self.'imLeadLag1.TF.b'[ 1 ] := (self.'imLeadLag1.K' * self.'imLeadLag1.T1');
		self.'imLeadLag1.TF.b'[ 2 ] := self.'imLeadLag1.K';
		self.'imLeadLag1.T2_dummy' := (if (absolute((self.'imLeadLag1.T1' - self.'imLeadLag1.T2')) < 2.22044604925031308e-16) then 1.0e+3 else self.'imLeadLag1.T2');
		self.'imLeadLag1.TF.a'[ 1 ] := self.'imLeadLag1.T2_dummy';
		self.'imLeadLag1.TF.y_start' := self.'imLeadLag1.y_start';
		self.'imLeadLag1.TF.bb'[ 1 ] := self.'imLeadLag1.TF.b'[ 1 ];
		self.'imLeadLag1.TF.bb'[ 2 ] := self.'imLeadLag1.TF.b'[ 2 ];
		self.'imLeadLag1.TF.d' := (self.'imLeadLag1.TF.bb'[ 1 ] / self.'imLeadLag1.TF.a'[ 1 ]);
		self.'limiter.uMax' := self.vsmax;
		self.'limiter.uMin' := self.vsmin;
		self.'derivativeLag.K' := (self.Kw * self.Tw);
		self.'derivativeLag.T' := self.Tw;
		self.'derivativeLag.K_dummy' := (if (absolute(self.'derivativeLag.K') < 2.22044604925031308e-16) then 1.0 else self.'derivativeLag.K');
		self.'derivativeLag.TF.b'[ 1 ] := self.'derivativeLag.K_dummy';
		self.'derivativeLag.T_dummy' := (if (absolute(self.'derivativeLag.T') < 2.22044604925031308e-16) then 1.0e+3 else self.'derivativeLag.T');
		self.'derivativeLag.TF.a'[ 1 ] := self.'derivativeLag.T_dummy';
		self.'derivativeLag.TF.y_start' := self.'derivativeLag.y_start';
		self.'derivativeLag.TF.bb'[ 1 ] := self.'derivativeLag.TF.b'[ 1 ];
		self.'derivativeLag.TF.d' := (self.'derivativeLag.TF.bb'[ 1 ] / self.'derivativeLag.TF.a'[ 1 ]);
	end Recalibrate;

	function Reinitialize
		input Self self_in;
		output Self self = self_in;


	protected
		/* derivativeLag.TF: */
		Real 'derivativeLag.TF.y';

		/* imLeadLag: */
		Real 'imLeadLag.u';
		Real 'imLeadLag.y';

		/* imLeadLag.TF: */
		Real 'imLeadLag.TF.y';

		/* imLeadLag1: */
		Real 'imLeadLag1.y';

		/* imLeadLag1.TF: */
		Real 'imLeadLag1.TF.y';

	algorithm
		/*
			Initialize variables without explicit start value or equation (implicit initializations):
		*/
		self.'derivative(derivativeLag.TF.x_scaled[1])' := 0.0;
		self.'derivative(imLeadLag.TF.x_scaled[1])' := 0.0;
		self.'derivative(imLeadLag1.TF.x_scaled[1])' := 0.0;
		/*
			Initialize variables with start value equation (dependent initializations):
		*/
		'derivativeLag.TF.y' := self.'derivativeLag.TF.y_start';
		self.'derivativeLag.TF.x_scaled'[ 1 ] := (((self.'derivativeLag.TF.d' * self.vSI) - 'derivativeLag.TF.y') / self.'derivativeLag.TF.d');
		'imLeadLag.u' := (if (absolute(self.'derivativeLag.T') < 2.22044604925031308e-16) then self.vSI else 'derivativeLag.TF.y');
		'imLeadLag.TF.y' := self.'imLeadLag.TF.y_start';
		self.'imLeadLag.TF.x_scaled'[ 1 ] := (((self.'imLeadLag.TF.d' * 'imLeadLag.u') - 'imLeadLag.TF.y') / (self.'imLeadLag.TF.d' - self.'imLeadLag.TF.bb'[ 2 ]));
		'imLeadLag.y' := (if (absolute((self.'imLeadLag.T1' - self.'imLeadLag.T2')) < 2.22044604925031308e-16) then (self.'imLeadLag.K' * 'imLeadLag.u') else 'imLeadLag.TF.y');
		'imLeadLag1.TF.y' := self.'imLeadLag1.TF.y_start';
		self.'imLeadLag1.TF.x_scaled'[ 1 ] := (((self.'imLeadLag1.TF.d' * 'imLeadLag.y') - 'imLeadLag1.TF.y') / (self.'imLeadLag1.TF.d' - self.'imLeadLag1.TF.bb'[ 2 ]));
		'imLeadLag1.y' := (if (absolute((self.'imLeadLag1.T1' - self.'imLeadLag1.T2')) < 2.22044604925031308e-16) then (self.'imLeadLag1.K' * 'imLeadLag.y') else 'imLeadLag1.TF.y');
		self.vs := (if ('imLeadLag1.y' > self.'limiter.uMax') then self.'limiter.uMax' elseif ('imLeadLag1.y' < self.'limiter.uMin') then self.'limiter.uMin' else 'imLeadLag1.y');
		/* Conduct delta(t) = 0 super-dense time initialization at next sampling:: */
		self.'discrete.stepSize.active' := false;
	end Reinitialize;

	function Saturate
		input Self self_in;
		output Self self = self_in;
	algorithm
	end Saturate;
end 'PSSDesign.Components.PSSTypeII4eFMI: static initialization';
