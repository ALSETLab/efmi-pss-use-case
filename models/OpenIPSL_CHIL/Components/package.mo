within OpenIPSL_CHIL;
package Components "Modified components for eFMU generation"

  annotation (Icon(graphics={
        Rectangle(
          lineColor={200,200,200},
          fillColor={248,248,248},
          fillPattern=FillPattern.HorizontalCylinder,
          extent={{-100,-100},{100,100}},
          radius=25.0),
        Rectangle(
          lineColor={128,128,128},
          extent={{-100,-100},{100,100}},
          radius=25.0),
      Rectangle(
        extent={{-34,-54},{-68,-50}},
        lineColor={0,0,0},
        fillColor={0,0,0},
        fillPattern=FillPattern.Solid,
        pattern = LinePattern.None),
      Rectangle(
        extent={{-72,-54},{-68,46}},
        lineColor={0,0,0},
        fillColor={0,0,0},
        fillPattern=FillPattern.Solid,
        pattern = LinePattern.None),
      Rectangle(
        extent={{-38,44},{-72,48}},
        lineColor = {28,108,200},
        fillColor={0,0,0},
        fillPattern=FillPattern.Solid,
        pattern = LinePattern.None),
      Rectangle(
        origin={0,46},
        fillColor={0,0,0},
        fillPattern=FillPattern.Solid,
        extent = {{-50,-20},{50,20}},
        lineColor={0,0,0},
        pattern = LinePattern.None,
          lineThickness=0.5),
      Rectangle(
        extent={{74,-56},{40,-52}},
        lineColor={0,0,0},
        fillColor={0,0,0},
        fillPattern=FillPattern.Solid,
        pattern = LinePattern.None),
      Rectangle(
        extent={{72,-56},{76,48}},
        lineColor={0,0,0},
        fillColor={0,0,0},
        fillPattern=FillPattern.Solid,
        pattern = LinePattern.None),
      Rectangle(
        extent={{76,44},{42,48}},
        lineColor={0,0,0},
        fillColor={0,0,0},
        fillPattern=FillPattern.Solid,
        pattern = LinePattern.None),
      Rectangle(
        origin={2,-50},
        fillColor={0,0,0},
        fillPattern=FillPattern.Solid,
        extent = {{-50,-20},{50,20}},
        lineColor={0,0,0},
        pattern = LinePattern.None),
      Rectangle(
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid,
        extent={{-46,30},{46,56}},
        lineColor={0,0,0},
        pattern = LinePattern.None,
          lineThickness=0.5),
      Rectangle(
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid,
        extent={{-44,-64},{44,-40}},
        lineColor={0,0,0},
        pattern = LinePattern.None,
          lineThickness=0.5)}));
end Components;
