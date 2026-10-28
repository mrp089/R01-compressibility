# R01 brainstorm: myocardial volume dynamics and compressibility

Working notes, 2026-10-27. Inputs: Stendahl et al. draft "Dynamics of regional myocardial volume in the setting of graded coronary stenoses and dobutamine stress" (9/2/25 version), Avazmohammadi et al. 2020 (J Biomech) and Liu, Soares et al. 2021 (Sci Rep) from the Sacks group, and John's K08 abstract.

## 1. What the inputs establish

### John's draft

Open-chest canine model, n = 7. Three ~1 cc crystal cubes (16 myocardial crystals, subepicardial/subendocardial pairs) in the ischemic, border and remote beds of the LAD territory; mid-LAD transit-time flow; microsphere flow at each condition; LV and aortic pressure; five loading states (baseline, mild stenosis, mild + dobutamine 5 ug/kg/min, moderate stenosis, moderate + dobutamine).

Findings that matter for the R01:

- Regional myocardial volume falls 6-10% per cycle at baseline (~10% ischemic cube, 6-7% remote), while arterial inflow per cycle is only ~1% of end-diastolic tissue volume. Mild stenosis + dobutamine pushes the per-cycle change above 15% (ischemic) and ~10% (remote); moderate stenosis brings it down to 6-7% in both.
- The volume waveform is in phase with radial/circumferential/longitudinal strain and decoupled from P_LV and P_Ao (figure-eight volume-pressure loops; largest volume changes where pressure changes least). Moderate stenosis breaks the near-linear volume-strain relation (clockwise loops, longitudinal dyskinesia).
- Moderate stenosis lowers end-diastolic volume ~5% in the ischemic bed and also in the remote bed, where microsphere flow is unchanged.
- Low-dose dobutamine raises flow in all beds but raises end-diastolic volume only in the remote bed (moderate stenosis).
- Ischemic-bed per-cycle volume change scales with the diastolic fraction of LAD flow.
- With moderate stenosis the LAD flow peak moves from diastole to systole and the volume-flow loop reverses direction.

Interpretation in the draft: deformation-driven mechanisms (varying elastance, shortening/thickening, vascular deformation) fit better than cavity-pressure-driven ones (waterfall, intramyocardial pump). The excess of volume change over arterial inflow is attributed to systolic retrograde flow into epicardial arterial capacitance plus venous expulsion.

What the draft cannot do: it has no model that quantifies the split between mechanisms, and no venous outflow or intramyocardial pressure, so the volume balance is not closed.

### The Sacks line

Avazmohammadi et al. 2020: 27-crystal array in the ovine LV free wall, convex-hull Jacobian at ~1 cc. J_ES = 0.85 +/- 0.12 in normal myocardium, with regional and transmural gradients; after MI the infarct loses its systolic volume reduction and in places gains volume.

Liu, Soares et al. 2021: single-heart biventricular model (MRI, DTMRI, epicardial MAPs, PV loop; Abaqus UMAT). Incompressible vs compressible comparison, same geometry and parameters:

- Peak active stress needed to match the PV loop roughly doubles under incompressibility (182.8 vs 107.4 kPa in the abstract; 172 vs 98 in the text).
- Wall thickening ES/ED: 1.133 incompressible, 1.094 compressible, 1.093 sonocrystals. LV height ES/ED: 0.939, 0.917, 0.904 (echo).
- Post-MI compensatory rise in peak active stress: 53.3% incompressible vs 32.1% compressible. Active work peaks 8.8 vs 4.6 J pre-MI.

Their constitutive device is a bulk modulus that decreases linearly with active stress, K(T_Ca) = K_inc - gamma T_Ca, incompressible in diastole, compressible only while contracting. They state that they did not model the mechanism behind the compressibility. One heart, no coronary flow data, no regional ischemia gradient, no dobutamine.

### John's K08

"Targeted delivery of nanomedicines to the coronary microvasculature during ex vivo normothermic perfusion of marginal human hearts," started 1/1/2022, five years. Aim 1 is restoring microvascular flow during normothermic machine perfusion (NMP), assessed by microscopy and multimodal imaging; Aim 2 is vascular-targeted nanoparticle delivery. Mentors Sinusas and Tietjen. The platform matters for us: perfusion pressure, flow, heart rate and inotropy can be set independently on the rig, and declined human hearts are available.

### The gap

No mechanistic, perfusion-coupled model of myocardial volume dynamics has been identified against simultaneous flow + volume + strain + pressure data. No noninvasive volume measure has been validated against crystal ground truth. The compressibility modeling literature (Sacks) has no flow; the poromechanics literature (KCL: Cookson et al. 2012 multi-compartment poroelastic LV; Lee et al. 2016 adding 1D coronary flow and active mechanics) is forward simulation, never inverse; the experimental literature (John) has no model.

### Clinical literature is contradictory

- Mayo (Ryu et al. 2021 Int J Cardiol; Kumar et al. 2021 Echocardiography): systolic/diastolic myocardial volume ratio ~0.87 by CMR and ~0.79 by echo in healthy subjects; ~1.0 in HFrEF. Proposed as a cardiomyopathy marker.
- Oxford (Clin Radiol 2017): CMR end-systolic myocardial volume larger than end-diastolic in controls, HCM, DCM and AS (10-21% "systolic volume gain"), almost certainly a segmentation/trabeculation artifact.
- ISMRM 2024/2025 abstracts: CMR volume ratio correlates with LGE burden in HCM.
- Bonnemains et al. 2019: median ES/ED ratio across published studies ~0.93, proposed as a strain quality check.
- Trial NCT04724304 links contrast-echo blood volume to CMR compressibility in healthy subjects.

A biomarker is being used without anyone having grounded it in physiology or validated it against direct measurement. That is the translational opening.

## 2. Central hypothesis (recommended)

Phasic myocardial volume change is the mechanical signature of the coronary microcirculation. Contraction-generated intramyocardial pressure expels blood from compliant vascular compartments, forward into the veins and backward into epicardial arterial capacitance. Regional compressibility is therefore set jointly by contractility and by microvascular volume and compliance, and is lost when either is impaired.

Testable consequences:

- Model-interpreted volume dynamics give a microvascular index that strain and MBF alone cannot (remote-bed ED volume loss with normal flow is the existing example).
- Compressibility-aware models remove a ~2x bias in inferred contractility, which propagates into any G&R stimulus built on it (link to the DP2 line).
- Volume reserve under stress (dobutamine, adenosine) separates contractile from vascular contributions in a way strain reserve does not.

## 3. Alternative framings, ranked lower

- Tool-centric: "compressibility-aware cardiac digital twins for ischemic heart disease." Reviewers will ask what changes clinically.
- Donor-heart-centric: volume dynamics on the NMP rig as a readout of microvascular viability after cold ischemia. Clinically crisp, but narrower and reads as a K08 extension. Keep it inside the proposal as a testbed (Aim 2), not as the thesis.

## 4. Aim sketch

### Aim 1: mechanism (modeling; Martin)

Mixture/poromechanical myocardium: near-incompressible solid skeleton (myocytes + ECM; McEvoy et al. 2018 suggest the solid phase itself is slightly compressible) plus arterial, capillary and venous compartments with pressure-dependent volume fractions. Intramyocardial pressure from active fiber stress plus transmural transmission of P_LV. Epicardial arterial capacitance that permits systolic retrograde flow. Venous outflow boundary. Local J(t) = 1 + sum of compartment volume-fraction changes + solid-phase term.

Workflow: 0D per crystal cube first (fast; structural identifiability across 5 states x 3 regions x 7 dogs), then 3D in svMultiPhysics as an open-source deliverable.

Questions the model should discriminate:

1. Deformation-driven vs cavity-pressure-driven intramyocardial pressure (quantify the split the draft only argues qualitatively).
2. Partition of the "missing" 5-9% among retrograde arterial flow, venous expulsion and solid compressibility. McEvoy's RVE attributes only ~42% of ex vivo volume change under confined compression to capillary volume, so the solid phase may not be negligible.
3. Whether remote-bed ED volume loss under moderate stenosis follows from mechanical tethering to the dysfunctional bed alone, or needs a vasomotor (alpha-adrenergic) term.

Output: a compressible constitutive law whose volumetric response is a function of perfusion state, not only of active stress. Unknowns to identify: compartment compliances, inter-compartment resistances (stenosis-dependent), regional contractility, passive stiffness.

### Aim 2: experiment (John, Al)

Close the mass balance and decouple the two drivers.

In vivo, the existing protocol plus:

- great cardiac vein / coronary sinus outflow probe (inflow + outflow closes the balance)
- intramyocardial pressure (micromanometer)
- epicardial coronary volume or caliber (IVUS or CT) to quantify capacitance
- interventions that separate inotropy from perfusion: adenosine (vasodilation at near-constant contractility) vs dobutamine (both); esmolol (contractility down, perfusion about constant); pacing-induced dyssynchrony (speaks to the asynchronous-contraction result in Liu et al.); phentolamine (tests the alpha-adrenergic explanation of remote-bed volume loss); microsphere embolization for microvascular obstruction.

Ex vivo NMP (the decisive platform): perfusion-pressure ramps at fixed contractility; Ca2+ or dobutamine titration at fixed perfusion pressure; pacing; cardioplegic arrest (isolates solid-phase and passive vascular contributions). Sonomicrometry, echo and CT on the rig; indicator dilution for blood volume. Declined human hearts give human-tissue validation.

Optional: perfused ex vivo tissue testing in the Yin/Chan/Judd style for the solid-phase term (Humphrey lab).

### Aim 3: measurement and translation (John, Al, Jim Duncan, Chi Liu)

Validate noninvasive regional myocardial volume against crystals in the same animals: 4D echo (Jim's tracking networks already appear in John's prior papers), 4D CT, CMR cine. In parallel, blood-volume imaging: gated 99mTc-RBC SPECT/CT (Mohy-Ud-Din et al. 2017 preclinical; Yousefi et al. 2023 human pilot), myocardial contrast echo, dynamic CT perfusion. The direct test: does tissue dV equal blood dV?

Then one human stress cohort, interpreted through the Aim 1 model (contractile vs vascular contribution to volume change).

## 5. Clinical cohort options for Aim 3

- INOCA / coronary microvascular dysfunction with stress imaging. Most coherent: the animal protocol is a dobutamine stress test, and "phasic volume reserve" becomes a new stress index. Yale already quantifies microvascular function (Feher and Sinusas).
- HCM: John's cohort; CMR volume ratio reportedly tracks LGE; ties to the DP2.
- Heart transplant recipients / cardiac allograft vasculopathy: ties to the K08 and John's transplant interests.
- HFrEF: the Mayo observation of lost compressibility.

Pick one for the aim; the rest are future directions.

## 6. Strategy

- Distinctness: separate from Al's hydrogel R01 (different question; its porcine reperfused-MI cohort could serve as a microvascular-obstruction testbed) and from the Sacks line (mechanism + flow + inverse identification rather than a phenomenological bulk modulus).
- Sacks: bring him in as collaborator or consultant. The Oden JTO visit is the natural venue. His 27-crystal sheep data would be a second identification dataset for Aim 1.
- Team and ESI: an MPI application keeps ESI status only if every PI is an ESI, so Al as MPI would forfeit it; Al as co-I with a strong letter instead. Confirm John's ESI status. Jim Duncan (4D echo), Chi Liu (SPECT/CT quantification) as co-Is.
- Timing: K08 started 1/1/2022 and runs through the end of 2026; a Feb or June 2027 submission fits a K-to-R transition. Confirm NHLBI rules on holding an R01 during the final K years.
- Open-source resource: perfusion-coupled compressible myocardium in svMultiPhysics is itself a deliverable reviewers can count.

Pitfalls to pre-empt in the Approach:

- Identifiability: stiffness, contractility and compressibility all thicken and shorten the wall. The multiple loading states are the lever; do the structural identifiability analysis in the 0D model before promising 3D.
- Crystal-cube volume depends on placement. The draft itself flags the larger ischemic-bed dV as possibly instrumentation.
- Canine collaterals vs porcine anatomy (and VF risk). Decide whether new in vivo work moves to pigs, which would match the hydrogel R01 and human microvasculature better.
- Imaging ground truth: CMR cine volumes show the ES > ED artifact; crystal validation is the contribution, so design the validation to expose the artifact rather than average it away.
- Scope: three aims each with model + experiment + imaging is three R01s. One owner and one deliverable per aim.

## 7. Preliminary data already in hand

- The canine dataset (n = 7; volumes, strains, flows, pressures, five states).
- Any inverse-modeling results already obtained on it.
- RBC-SPECT blood-volume quantification (Sinusas, Liu).
- 4D echo tracking (Duncan).
- The NMP rig and K08 microvascular imaging.

## 8. Decisions needed before drafting the Aims page

1. Which clinical cohort anchors Aim 3.
2. Whether Aim 2 leads with in vivo (dog or pig) or with ex vivo NMP, and which one gets the human hearts.
3. MPI structure (Martin + John) and Al's role.
4. Sacks' role (collaborator vs consultant) and whether the sheep data enter Aim 1.
5. Whether the solid-phase compressibility term gets its own experiment or is handled as a model sensitivity.
6. Title. Candidates: "Perfusion-coupled compressibility of the beating heart: mechanism, measurement, translation"; "Myocardial volume dynamics as a window on the coronary microcirculation".

## 9. References to pull into Zotero

10.1016/j.jbiomech.2020.109767
10.1152/ajpheart.00735.2022
10.1186/s12947-019-0183-x
10.1007/s12350-017-0970-4
10.1016/j.jbiomech.2011.11.026
10.1007/s10237-016-0782-5
10.1016/j.crad.2016.10.024
10.1007/s10237-025-01931-0

Also (DOIs not verified, search by title): Ryu et al., Int J Cardiol 2021;322:272-277; Kumar et al., Echocardiography 2021;38:1235-1244; McEvoy, Holzapfel, McGarry, J Biomech Eng 2018;140; Ashikaga et al., Am J Physiol Heart Circ Physiol 2008;295:H610; Yin, Chan, Judd, Am J Physiol 1996;271:H1864; Chadwick et al., Am J Physiol 1990;258:H1687.
