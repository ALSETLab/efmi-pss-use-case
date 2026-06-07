# Repository cleanup proposal — `efmi-pss-use-case`

**Status:** proposal only. Nothing has been deleted or moved. Reviewed against the final paper and the current `main` (local clone, in sync with `origin/main`). Please approve per item before I execute.

## Ground rules I'm following

- **Source of truth:** the final paper + the current repository. Meeting notes were used only as background.
- **No history rewrite.** Removals will be ordinary `git rm` commits on a new branch (e.g. `cleanup/repo-tidy`), so nothing is lost and everything is reviewable in a PR. See the size note at the end.
- **I respect the curated `.gitignore`.** See below.

## What I will NOT touch (deliberately kept)

The `.gitignore` is carefully written to **keep** specific generated artifacts inside `Modelica/work/` — the generated eFMUs, the `*_SiLTest_generated.mo` files, the SiL FMUs, and the `Grid4CHIL_batch_results/` `.mat`/`.csv`/`.pdf` (the 50–58 MB batch results behind the MiL figures). These are intentional reproducibility artifacts for the paper, so they stay. Everything below is *outside* that kept set.

---

## Tier 1 — Clear-cut cruft (safe to remove)

Evidence: each item is self-contained — no model on the paper's path (`Components`, `Generator`, `Network`, `RTS`, `Examples.CHIL_Configuration`, `Examples.CHIL_Design`) references into it.

| Item | What it is | Why remove |
| --- | --- | --- |
| `Modelica/OpenIPSL_CHIL/UnderDevelopment/` | Scratch package: `Figures/`, `eFMIIntegration/`, `PhysicalExperiments/`, `Templates/`, `CHIL_Configuration_Grid4CHIL_IOpLUS/`, `BandPass1stOrder`, `LeadLagNoiseFilter`, `SimAndCompare` | Working/experimental models. Every reference to it is internal; nothing in the production packages or the paper depends on it. |
| `Modelica/OpenIPSL_CHIL/Examples/CHILeFMI/` | Empty package (only `package.order`) | Empty stub. |
| `Modelica/OpenIPSL_CHIL/Examples/efmiIntegration/` | Empty package (`package.order` + empty `Templates/`) | Empty stub. |

After removing these, the parent `package.order` files need the deleted names dropped — I'll handle that as part of the same change.

---

## Tier 2 — Verify with the team before removing

These look like leftovers but either duplicate live code or are wired into models that *are* used, so I want a yes/no from you (and Christoff/Joe where relevant) before touching them.

| Item | Observation | Question |
| --- | --- | --- |
| `Examples/PSS_Design/` | Duplicates `Generator/Design/` (GenAVR, GenAVRIO, GenEM, GenEMClassical, GenPSS, GenPSSDesign) | Is `Generator/Design` the canonical one, making `Examples/PSS_Design` an older copy to delete? |
| `Examples/CHIL_Design/` | Overlaps `Generator/ReDesign/`; the paper cites `Generator.ReDesign.GenAVRIOReDesign`. But `CHIL_Design` also holds `PSSReDesignVerification`, `IOCL`, `IOModelforReDesign` | Keep `CHIL_Design` (it has unique verification models) and drop only the duplicated generators? |
| `Grid4CHIL_IOplus` (across `RTS`, `Examples`, `RTS/Tests`) | The paper's final setup uses a single analog in/out; the multi-IO `IOplus` variant appears extra. **But** it's referenced in ~12 files across the library | Is `IOplus` still wanted as an extension, or should it be retired? If retired, this is a larger, coordinated edit — not a quick delete. |
| `STM32/work/Grid4CHIL_G474RE/`, `STM32/work/Grid4CHIL_IOplus_G474RE/` | CubeIDE projects for the **G474RE** board, which the final paper does not use (plant = H723ZG, controller = L476RG) | Leftovers from the earlier board plan — safe to remove? |
| `STM32/work/Grid4CHIL_H723ZG_FP64/` | A double-precision (FP64) variant of the plant project | Experimental, or part of the paper's results? |
| `STM32/stm32-boards-usermanuals/` | Vendor PDFs (~45 MB total): ARM v7-M reference manual (5.7 MB), NUCLEO data-briefs/user-manuals (up to 15 MB), incl. the unused **G474RE** | Replace these with download links in the STM32 README to shrink the working tree? |

---

## Size note (separate decision)

`.git` is ~755 MB. That comes from (a) the intentionally-kept large `.mat`/`.csv`/`.fmu` artifacts and (b) their accumulated history. **Deleting files now does not shrink `.git`** — the blobs remain in history. Actually reclaiming that space requires rewriting history (e.g. `git filter-repo`) and a force-push, which rewrites every collaborator's clone. That's a heavier, coordinated operation I would only do with explicit sign-off from you and Christoff — I'm flagging it, not recommending it as part of this tidy-up.

## Proposed execution order

1. You approve **Tier 1**. I create branch `cleanup/repo-tidy`, `git rm -r` the three items, fix the affected `package.order` files, commit, and show you the diff to review/push.
2. We work through **Tier 2** item by item as you confirm.
3. Size/history is a later, separate conversation if you want it.
