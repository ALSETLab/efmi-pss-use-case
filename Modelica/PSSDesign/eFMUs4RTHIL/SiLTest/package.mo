within PSSDesign.eFMUs4RTHIL;
package SiLTest
  extends 'eFMU experiment package (Grid4HIL, PSSDesign.eFMUs4RTHIL.TestGridForHILClocked)'(
      tolerances_default(
      absolute_x32(
        Pgen=10,
        Qgen=5,
        v=0.2,
        vf0OUT=1.0e-3,
        w=0.1),
      relative_x32(
        Pgen=10,
        Qgen=5,
        v=0.2,
        vf0OUT=1.0e-3,
        w=0.1),
      absolute_x64(
        Pgen=10,
        Qgen=5,
        v=0.2,
        vf0OUT=1.0e-3,
        w=0.1),
      relative_x64(
        Pgen=10,
        Qgen=5,
        v=0.2,
        vf0OUT=1.0e-3,
        w=0.1))   );
end SiLTest;
