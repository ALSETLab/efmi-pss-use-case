package PSSDesign "PSS Design Tutorial"
  extends Modelica.Icons.ExamplesPackage;

  annotation(
    uses(OpenIPSL(version="3.1.0-dev"),
                                      Modelica(version = "4.0.0"),
      DymolaEmbedded(version="1.0.5"),
      Complex(version="4.0.0"),
      Modelica_LinearSystems2(version="3.0.1")));
end PSSDesign;
