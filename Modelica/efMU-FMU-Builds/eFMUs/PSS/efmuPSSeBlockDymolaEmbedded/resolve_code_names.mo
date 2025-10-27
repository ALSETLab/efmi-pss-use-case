within efmuPSSeBlockDymolaEmbedded;
function resolve_code_names
  "Get names of all production codes supported by the stub."
  extends .Modelica.Units.Icons.Conversion;

  output String[ProductionCodes] names
    "Production code names.";

algorithm
  for c in ProductionCodes loop
    names[c] := String(c);
  end for;

  annotation (preferredView = "info");
end resolve_code_names;
