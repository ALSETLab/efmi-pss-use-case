within OpenIPSL_CHIL.RTS.HIL.eFMUs.Grid4HIL;
package SiLTest
  extends Grid4HIL_SiLTest_generated(
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
