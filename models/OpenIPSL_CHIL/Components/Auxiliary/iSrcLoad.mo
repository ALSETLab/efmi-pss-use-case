within OpenIPSL_CHIL.Components.Auxiliary;
model iSrcLoad "Controlled current source to act as a load"

  OpenIPSL.Electrical.Sources.CurrentSourceReImInput currentSourceReImInput
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  OpenIPSL.Interfaces.PwPin p
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Math.PolarToRectangular polarToRectangular
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Blocks.Sources.Constant iAngle(k=0) "Current angle" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-70,-30})));
  Modelica.Blocks.Interfaces.RealInput iMag "Current inpu"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
equation
  connect(currentSourceReImInput.p, p)
    annotation (Line(points={{22,0},{110,0}}, color={0,0,255}));
  connect(polarToRectangular.y_re, currentSourceReImInput.iRe)
    annotation (Line(points={{-39,6},{-34,8},{-24,8}}, color={0,0,127}));
  connect(polarToRectangular.y_im, currentSourceReImInput.iIm)
    annotation (Line(points={{-39,-6},{-34,-8},{-24,-8}}, color={0,0,127}));
  connect(iAngle.y, polarToRectangular.u_arg)
    annotation (Line(points={{-70,-19},{-70,-6},{-62,-6}}, color={0,0,127}));
  connect(polarToRectangular.u_abs, iMag) annotation (Line(points={{-62,6},{
          -80,6},{-80,0},{-120,0}}, color={0,0,127}));
  annotation (Icon(graphics={ Text(
          extent={{-150,-110},{150,-150}},
          textColor={0,0,255},
          textString="%name"),     Line(points={{100,100},{100,-100},{-100,0},
              {100,100}},
                      color={28,108,200}),
        Text(
          extent={{-40,40},{40,-20}},
          textColor={28,108,200},
          textString="|I| Load")}));
end iSrcLoad;
