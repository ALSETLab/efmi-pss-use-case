package OpenIPSL_CHIL
  "Extensions of OpenIPSL for embedded real-time applications."

  annotation(
    uses(OpenIPSL(version="3.1.0-dev"),
                                      Modelica(version = "4.0.0"),
      DymolaEmbedded(version="1.0.5"),
      Complex(version="4.0.0"),
      Modelica_LinearSystems2(version="3.0.1")), Icon(graphics={Bitmap(extent={{-100,
              -100},{100,100}}, fileName=
              "modelica://OpenIPSL_CHIL/Resources/images/logo.svg")}));
end OpenIPSL_CHIL;
