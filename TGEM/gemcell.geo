// *********************************************************************
// gemcell.geo
//
// Description:
// Geometry file for a GEM cell.
// This cell can be repeated any number of times within Garfield 
// to construct an arbitrarily large GEM.
//
// References: 
// 1. This specific form of GEM cell was found in 
//    "A How-to Approach for a 3d Simulation of Charge Transfer
//    Characteristics in a Gas Electron Multiplier (GEM)" by A. Sharma.
//    As of 04/08/10, this document can be found at:
//    www.slac.stanford.edu/pubs/icfa/fall99/paper2/paper2.pdf
//
// See also:
// 2. A. Sharma.  Nucl. Instr. Meth. A 454, 267-271 (2000).
// 3. O. Bouianov et al. Nucl. Instr. Meth. A 450, 277-287 (2000).
// 4. V. Tikhonov and R. Veenhof. Nucl. Instr. Meth. A 478, 452-459 (2002).
// 5. C. Shalem et al. Nucl. Instr. Meth. A, 558, 475–489 (2006).
//
// Obtained from Carlos Barreto bachelor's thesis at Uniandes
// *********************************************************************

// Parameters
r0 = 0.0035;     // the hole radius
r1 = 0.0025;     // the etching amount (etch radius = r0 + r1)
tC = 0.0005;     // copper thickness
tD = 0.005;     // dielectric thickness
lE = 0.3;     // distance from GEM plates to upper exterior electrode
lG = 0.2;		// distance between GEM foils
lP = 0.2;     // distance from lower GEM plate to pad (readout) plane
a = 0.014;     // the "pitch", or distance between GEM holes

// Characteristic lengths
lcDielectricHole = 0.0025;
lcEtchingHole = 0.0004;
lcCopperPlateBdry = 0.001;
lcExtElectrodeBdry = 0.006;
lcGEMHole = 0.001;

// TOP GEM FOIL

// ------------------------------------------------------------
// Hole 1 (quarter hole)
// ------------------------------------------------------------

// *******************************
// Center
// *******************************
pc1_1 = newp; Point(pc1_1) = {0, 0, tD/2,lcGEMHole};
pc2_1 = newp; Point(pc2_1) = {0, 0, -1*tD/2,lcGEMHole};
pc3_1 = newp; Point(pc3_1) = {0, 0, (2*tC+tD)/2,lcGEMHole};
pc4_1 = newp; Point(pc4_1) = {0, 0, -1*(2*tC+tD)/2,lcGEMHole};
pc5_1 = newp; Point(pc5_1) = {0, 0, 0, lcGEMHole};

// *******************************
// Dielectric hole
// *******************************
// Top
pth1_1 = newp; Point(pth1_1) = {r0, 0, tD/2,lcDielectricHole};
pth2_1 = newp; Point(pth2_1) = {0, r0, tD/2,lcDielectricHole};
cth1_1 = 200; Circle(cth1_1) = {pth2_1, pc1_1, pth1_1};

// Middle
pmh1_1 = newp; Point(pmh1_1) = {r1, 0, 0, lcDielectricHole};
pmh2_1 = newp; Point(pmh2_1) = {0, r1, 0, lcDielectricHole};
cmh1_1 = newc; Circle(cmh1_1) = {pmh2_1, pc5_1, pmh1_1};	

// Bottom
pbh1_1 = newp; Point(pbh1_1) = {r0, 0, -1*tD/2,lcDielectricHole};
pbh2_1 = newp; Point(pbh2_1) = {0, r0, -1*tD/2,lcDielectricHole};
cbh1_1 = newc; Circle(cbh1_1) = {pbh2_1, pc2_1, pbh1_1};

// *******************************
// Upper Etching
// *******************************

// Top
ptue1_1 = newp; Point(ptue1_1) = {r0, 0, (2*tC+tD)/2,lcEtchingHole};
ptue2_1 = newp; Point(ptue2_1) = {0, r0, (2*tC+tD)/2,lcEtchingHole};

// Circular boundary
ctue1_1 = newc; Circle(ctue1_1) = {ptue2_1, pc3_1, ptue1_1};

// *******************************
// Lower Etching
// *******************************

// Bottom
pble1_1 = newp; Point(pble1_1) = {r0, 0, -1*(2*tC+tD)/2,lcEtchingHole};
pble2_1 = newp; Point(pble2_1) = {0, r0, -1*(2*tC+tD)/2,lcEtchingHole};

// Circular boundaries
cble1_1 = newc; Circle(cble1_1) = {pble2_1, pc4_1, pble1_1};

// Lines connecting top, middle and bottom
lconn1_1 = newc; Line(lconn1_1) = {pbh1_1, pmh1_1};
lconn2_1 = newc; Line(lconn2_1) = {pbh2_1, pmh2_1};
lconn3_1 = newc; Line(lconn3_1) = {pmh1_1, pth1_1};
lconn4_1 = newc; Line(lconn4_1) = {pmh2_1, pth2_1};


// ------------------------------------------------------------
// Hole 2 (half hole)
// ------------------------------------------------------------

// *******************************
// Center
// *******************************
pc1_2 = newp; Point(pc1_2) = {a/2, a, tD/2,lcGEMHole};
pc2_2 = newp; Point(pc2_2) = {a/2, a, -tD/2,lcGEMHole};
pc3_2 = newp; Point(pc3_2) = {a/2, a, (2*tC+tD)/2,lcGEMHole};
pc4_2 = newp; Point(pc4_2) = {a/2, a, -(2*tC+tD)/2,lcGEMHole};
pc5_2 = newp; Point(pc5_2) = {a/2, a, 0, lcGEMHole};

// *******************************
// Dielectric hole
// *******************************
// Top
pth1_2 = newp; Point(pth1_2) = {a/2-r0, a, tD/2,lcDielectricHole};
pth2_2 = newp; Point(pth2_2) = {a/2+r0, a, tD/2,lcDielectricHole};
pth3_2 = newp; Point(pth3_2) = {a/2, a-r0, tD/2,lcDielectricHole};
cth1_2 = newc; Circle(cth1_2) = {pth1_2, pc1_2, pth3_2};
cth2_2 = newc; Circle(cth2_2) = {pth3_2, pc1_2, pth2_2};

// Middle
pmh1_2 = newp; Point(pmh1_2) = {a/2-r1, a, 0, lcDielectricHole};
pmh2_2 = newp; Point(pmh2_2) = {a/2+r1, a, 0, lcDielectricHole};
pmh3_2 = newp; Point(pmh3_2) = {a/2, a-r1, 0, lcDielectricHole};
cmh1_2 = newc; Circle(cmh1_2) = {pmh1_2, pc5_2, pmh3_2};
cmh2_2 = newc; Circle(cmh2_2) = {pmh3_2, pc5_2, pmh2_2};

// Bottom
pbh1_2 = newp; Point(pbh1_2) = {a/2-r0, a, -tD/2,lcDielectricHole};
pbh2_2 = newp; Point(pbh2_2) = {a/2+r0, a, -tD/2,lcDielectricHole};
pbh3_2 = newp; Point(pbh3_2) = {a/2, a-r0, -tD/2,lcDielectricHole};
cbh1_2 = newc; Circle(cbh1_2) = {pbh1_2, pc2_2, pbh3_2};
cbh2_2 = newc; Circle(cbh2_2) = {pbh3_2, pc2_2, pbh2_2};

// *******************************
// Upper Etching
// *******************************

// Top
ptue1_2 = newp; Point(ptue1_2) = {a/2-r0, a, (2*tC+tD)/2,lcEtchingHole};
ptue2_2 = newp; Point(ptue2_2) = {a/2+r0, a, (2*tC+tD)/2,lcEtchingHole};
ptue3_2 = newp; Point(ptue3_2) = {a/2, a-r0, (2*tC+tD)/2,lcEtchingHole};

// Circular boundary
ctue1_2 = newc; Circle(ctue1_2) = {ptue1_2, pc3_2, ptue3_2};
ctue2_2 = newc; Circle(ctue2_2) = {ptue3_2, pc3_2, ptue2_2};

lue1_2 = newc; Line(lue1_2) = {ptue1_2, pth1_2};
lue2_2 = newc; Line(lue2_2) = {ptue2_2, pth2_2};
lue3_2 = newc; Line(lue3_2) = {ptue3_2, pth3_2};

// *******************************
// Lower Etching
// *******************************

// Bottom
pble1_2 = newp; Point(pble1_2) = {a/2-r0, a, -(2*tC+tD)/2,lcEtchingHole};
pble2_2 = newp; Point(pble2_2) = {a/2+r0, a, -(2*tC+tD)/2,lcEtchingHole};
pble3_2 = newp; Point(pble3_2) = {a/2, a-r0, -(2*tC+tD)/2,lcEtchingHole};

// Circular boundaries
cble1_2 = newc; Circle(cble1_2) = {pble1_2, pc4_2, pble3_2};
cble2_2 = newc; Circle(cble2_2) = {pble3_2, pc4_2, pble2_2};

lle1_2 = newc; Line(lle1_2) = {pbh1_2, pble1_2};
lle2_2 = newc; Line(lle2_2) = {pbh2_2, pble2_2};
lle3_2 = newc; Line(lle3_2) = {pbh3_2, pble3_2};

// Lines connecting top, middle and bottom
lconn1_2 = newc; Line(lconn1_2) = {pbh1_2, pmh1_2};
lconn2_2 = newc; Line(lconn2_2) = {pbh2_2, pmh2_2};
lconn3_2 = newc; Line(lconn3_2) = {pbh3_2, pmh3_2};
lconn4_2 = newc; Line(lconn4_2) = {pmh1_2, pth1_2};
lconn5_2 = newc; Line(lconn5_2) = {pmh2_2, pth2_2};
lconn6_2 = newc; Line(lconn6_2) = {pmh3_2, pth3_2};


// ------------------------------------------------------------
// Hole 3 (quarter hole)
// ------------------------------------------------------------

// *******************************
// Center
// *******************************
pc1_3 = newp; Point(pc1_3) = {a, 0, tD/2,lcGEMHole};
pc2_3 = newp; Point(pc2_3) = {a, 0, -1*tD/2,lcGEMHole};
pc3_3 = newp; Point(pc3_3) = {a, 0, (2*tC+tD)/2,lcGEMHole};
pc4_3 = newp; Point(pc4_3) = {a, 0, -1*(2*tC+tD)/2,lcGEMHole};
pc5_3 = newp; Point(pc5_3) = {a, 0, 0,lcGEMHole};

// *******************************
// Dielectric hole
// *******************************
// Top
pth1_3 = newp; Point(pth1_3) = {a-r0, 0, tD/2,lcDielectricHole};
pth2_3 = newp; Point(pth2_3) = {a, r0, tD/2,lcDielectricHole};
cth1_3 = newc; Circle(cth1_3) = {pth2_3, pc1_3, pth1_3};

// Middle
pmh1_3 = newp; Point(pmh1_3) = {a-r1, 0, 0, lcDielectricHole};
pmh2_3 = newp; Point(pmh2_3) = {a, r1, 0, lcDielectricHole};
cmh1_3 = newc; Circle(cmh1_3) = {pmh2_3, pc5_3, pmh1_3};

// Bottom
pbh1_3 = newp; Point(pbh1_3) = {a-r0, 0, -1*tD/2,lcDielectricHole};
pbh2_3 = newp; Point(pbh2_3) = {a, r0, -1*tD/2,lcDielectricHole};
cbh1_3 = newc; Circle(cbh1_3) = {pbh2_3, pc2_3, pbh1_3};

// *******************************
// Upper Etching
// *******************************

// Top
ptue1_3 = newp; Point(ptue1_3) = {a-r0, 0, (2*tC+tD)/2,lcEtchingHole};
ptue2_3 = newp; Point(ptue2_3) = {a, r0, (2*tC+tD)/2,lcEtchingHole};

// Circular boundary
ctue1_3 = newc; Circle(ctue1_3) = {ptue2_3, pc3_3, ptue1_3};

// *******************************
// Lower Etching
// *******************************

// Bottom
pble1_3 = newp; Point(pble1_3) = {a-r0, 0, -1*(2*tC+tD)/2,lcEtchingHole};
pble2_3 = newp; Point(pble2_3) = {a, r0, -1*(2*tC+tD)/2,lcEtchingHole};

// Circular boundaries
cble1_3 = newc; Circle(cble1_3) = {pble2_3, pc4_3, pble1_3};

// Lines connecting top and bottom
lconn1_3 = newc; Line(lconn1_3) = {pbh1_3, pmh1_3};
lconn2_3 = newc; Line(lconn2_3) = {pbh2_3, pmh2_3};
lconn3_3 = newc; Line(lconn3_3) = {pmh1_3, pth1_3};
lconn4_3 = newc; Line(lconn4_3) = {pmh2_3, pth2_3};

// --------------------------------------------------------------------------


// *******************************************************
// Copper planes
// *******************************************************

// Points between two half holes on upper GEM
ptmc = newp; Point(ptmc) = {a/2, 0, (2*tC+tD)/2, lcCopperPlateBdry};
ptmd = newp; Point(ptmd) = {a/2, 0, tD/2, lcCopperPlateBdry};

// Top lower boundary
pcptl2 = newp; Point(pcptl2) = {a, a, tD/2,lcCopperPlateBdry};
pcptl3 = newp; Point(pcptl3) = {0, a, tD/2,lcCopperPlateBdry};

// Top upper boundary
pcptu2 = newp; Point(pcptu2) = {a, a, (tD+2*tC)/2,lcCopperPlateBdry};
pcptu3 = newp; Point(pcptu3) = {0, a, (tD+2*tC)/2,lcCopperPlateBdry};

// Border lines
// Upper boundary
lcpt1 = newc; Line(lcpt1) = {ptue1_2,pcptu3};
lcpt2 = newc; Line(lcpt2) = {pcptu3,ptue2_1};
lcpt3a = newc; Line(lcpt3a) = {ptue1_1,ptmc};
lcpt3b = newc; Line(lcpt3b) = {ptmc,ptue1_3};
lcpt4 = newc; Line(lcpt4) = {ptue2_3,pcptu2};
lcpt5 = newc; Line(lcpt5) = {pcptu2,ptue2_2};

// Lower boundary
lcpt6 = newc; Line(lcpt6) = {pc1_1,pth2_1};  // starts at point 1 and goes CW holes 1,2,then 3 
//lcpt7 = newc; Line(lcpt7) = {pth2_1,pbue2_1}; 
lcpt8 = newc; Line(lcpt8) = {pth2_1,pcptl3};
lcpt9 = newc; Line(lcpt9) = {pcptl3,pth1_2};
//lcpt10 = newc; Line(lcpt10) = {pbue1_2,pth1_2};
lcpt11a = newc; Line(lcpt11a) = {pth1_2,pc1_2};
lcpt11b = newc; Line(lcpt11b) = {pc1_2,pth2_2};

//lcpt12 = newc; Line(lcpt12) = {pth2_2,pbue2_2};
lcpt13 = newc; Line(lcpt13) = {pth2_2,pcptl2};
lcpt14 = newc; Line(lcpt14) = {pcptl2,pth2_3};
//lcpt15 = newc; Line(lcpt15) = {pbue2_3,pth2_3};
lcpt16 = newc; Line(lcpt16) = {pth2_3,pc1_3};
lcpt17 = newc; Line(lcpt17) = {pc1_3,pth1_3};
//lcpt18 = newc; Line(lcpt18) = {pth1_3,ptmd};
lcpt19a = newc; Line(lcpt19a) = {pth1_3,ptmd};
lcpt19b = newc; Line(lcpt19b) = {ptmd,pth1_1};
//lcpt20 = newc; Line(lcpt20) = {pbue1_1,pth1_1};
lcpt21 = newc; Line(lcpt21) = {pth1_1,pc1_1};

// Connect the upper and lower points with lines to form the plate
lcpt22 = newc; Line(lcpt22) = {pcptu2, pcptl2}; 
lcpt23 = newc; Line(lcpt23) = {pcptu3, pcptl3}; 
lcpt24 = newc; Line(lcpt24) = {pc3_1, pc1_1}; 
lcpt25 = newc; Line(lcpt25) = {pc3_3, pc1_3}; 
lcpt26 = newc; Line(lcpt26) = {ptue2_3, pth2_3}; 
lcpt27 = newc; Line(lcpt27) = {ptue1_3, pth1_3}; 
lcpt28 = newc; Line(lcpt28) = {ptue1_1, pth1_1};
lcpt29 = newc; Line(lcpt29) = {ptue2_1, pth2_1};

// ---------------------------------------------

// Points between two half holes on lower GEM
pbmd = newp; Point(pbmd) = {a/2, 0, -1*tD/2, lcCopperPlateBdry};
pbmc = newp; Point(pbmc) = {a/2, 0, -1*(2*tC+tD)/2, lcCopperPlateBdry};

// Bottom lower boundary
pcpbl2 = newp; Point(pcpbl2) = {a, a, -1*(tD+2*tC)/2,lcCopperPlateBdry};
pcpbl3 = newp; Point(pcpbl3) = {0, a, -1*(tD+2*tC)/2,lcCopperPlateBdry};

// Bottom upper boundary
pcpbu2 = newp; Point(pcpbu2) = {a, a, -1*tD/2,lcCopperPlateBdry};
pcpbu3 = newp; Point(pcpbu3) = {0, a, -1*tD/2,lcCopperPlateBdry};

// Border lines
// Upper boundary
lcpb1 = newc; Line(lcpb1) = {pble1_2,pcpbl3};
lcpb2 = newc; Line(lcpb2) = {pcpbl3,pble2_1};
lcpb3a = newc; Line(lcpb3a) = {pble1_1,pbmc};
lcpb3b = newc; Line(lcpb3b) = {pbmc,pble1_3};
lcpb4 = newc; Line(lcpb4) = {pble2_3,pcpbl2};
lcpb5 = newc; Line(lcpb5) = {pcpbl2,pble2_2};

// Lower boundary
lcpb6 = newc; Line(lcpb6) = {pc2_1,pbh2_1};  // starts at point 1 and goes CW holes 1,2,then 3
//lcpb7 = newc; Line(lcpb7) = {pbh2_1,ptle2_1};
lcpb8 = newc; Line(lcpb8) = {pbh2_1,pcpbu3};
lcpb9 = newc; Line(lcpb9) = {pcpbu3,pbh1_2};
//lcpb10 = newc; Line(lcpb10) = {ptle1_2,pbh1_2};
lcpb11a = newc; Line(lcpb11a) = {pbh1_2,pc2_2};
lcpb11b = newc; Line(lcpb11b) = {pc2_2,pbh2_2};
//lcpb12 = newc; Line(lcpb12) = {pbh2_2,ptle2_2};
lcpb13 = newc; Line(lcpb13) = {pbh2_2,pcpbu2};
lcpb14 = newc; Line(lcpb14) = {pcpbu2,pbh2_3};
//lcpb15 = newc; Line(lcpb15) = {ptle2_3,pbh2_3};
lcpb16 = newc; Line(lcpb16) = {pbh2_3,pc2_3};
lcpb17 = newc; Line(lcpb17) = {pc2_3,pbh1_3};
//lcpb18 = newc; Line(lcpb18) = {pbh1_3,pbmd};
lcpb19a = newc; Line(lcpb19a) = {pbh1_3,pbmd};
lcpb19b = newc; Line(lcpb19b) = {pbmd,pbh1_1};
//lcpb20 = newc; Line(lcpb20) = {ptle1_1,pbh1_1};
lcpb21 = newc; Line(lcpb21) = {pbh1_1,pc2_1};

// Connect the upper and lower points with lines to form the plate
lcpb22 = newc; Line(lcpb22) = {pcpbu2, pcpbl2};
lcpb23 = newc; Line(lcpb23) = {pcpbu3, pcpbl3};
lcpb24 = newc; Line(lcpb24) = {pc2_1, pc4_1};
lcpb25 = newc; Line(lcpb25) = {pc2_3, pc4_3};
lcpb26 = newc; Line(lcpb26) = {pbh2_3, pble2_3};
lcpb27 = newc; Line(lcpb27) = {pbh1_3, pble1_3};
lcpb28 = newc; Line(lcpb28) = {pbh1_1, pble1_1};
lcpb29 = newc; Line(lcpb29) = {pbh2_1, pble2_1};

lcpb30 = newc; Line(lcpb30) = {pc1_1, pc2_1};
lcpb31 = newc; Line(lcpb31) = {pcptl2, pcpbu2};
lcpb32 = newc; Line(lcpb32) = {pcptl3, pcpbu3};
lcpb33 = newc; Line(lcpb33) = {pc1_3, pc2_3};

// Lines splitting the GEM in half: half hole side
lshalf1 = newc; Line(lshalf1) = {pc3_2, pc1_2};
lshalf2 = newc; Line(lshalf2) = {pc1_2, pc2_2};
lshalf3 = newc; Line(lshalf3) = {pc2_2, pc4_2};

// Lines splitting the GEM in half: quarter hole side
lsqt1 = newc; Line(lsqt1) = {ptmc, ptmd};
lsqt2 = newc; Line(lsqt2) = {ptmd, pbmd};
lsqt3 = newc; Line(lsqt3) = {pbmd, pbmc};

// MIDDLE GEM FOIL

// ------------------------------------------------------------
// Hole 1 (quarter hole)
// ------------------------------------------------------------

// *******************************
// Center
// *******************************
pc1_1x = newp; Point(pc1_1x) = {0, 0, tD/2-lG,lcGEMHole};
pc2_1x = newp; Point(pc2_1x) = {0, 0, -1*tD/2-lG,lcGEMHole};
pc3_1x = newp; Point(pc3_1x) = {0, 0, (2*tC+tD)/2-lG,lcGEMHole};
pc4_1x = newp; Point(pc4_1x) = {0, 0, -1*(2*tC+tD)/2-lG,lcGEMHole};
pc5_1x = newp; Point(pc5_1x) = {0, 0, 0-lG, lcGEMHole};

// *******************************
// Dielectric hole
// *******************************
// Top
pth1_1x = newp; Point(pth1_1x) = {r0, 0, tD/2-lG,lcDielectricHole};
pth2_1x = newp; Point(pth2_1x) = {0, r0, tD/2-lG,lcDielectricHole};
cth1_1x = 1200; Circle(cth1_1x) = {pth2_1x, pc1_1x, pth1_1x};

// Middle
pmh1_1x = newp; Point(pmh1_1x) = {r1, 0, 0-lG, lcDielectricHole};
pmh2_1x = newp; Point(pmh2_1x) = {0, r1, 0-lG, lcDielectricHole};
cmh1_1x = newc; Circle(cmh1_1x) = {pmh2_1x, pc5_1x, pmh1_1x};	

// Bottom
pbh1_1x = newp; Point(pbh1_1x) = {r0, 0, -1*tD/2-lG,lcDielectricHole};
pbh2_1x = newp; Point(pbh2_1x) = {0, r0, -1*tD/2-lG,lcDielectricHole};
cbh1_1x = newc; Circle(cbh1_1x) = {pbh2_1x, pc2_1x, pbh1_1x};

// *******************************
// Upper Etching
// *******************************

// Top
ptue1_1x = newp; Point(ptue1_1x) = {r0, 0, (2*tC+tD)/2-lG,lcEtchingHole};
ptue2_1x = newp; Point(ptue2_1x) = {0, r0, (2*tC+tD)/2-lG,lcEtchingHole};

// Circular boundary
ctue1_1x = newc; Circle(ctue1_1x) = {ptue2_1x, pc3_1x, ptue1_1x};

// *******************************
// Lower Etching
// *******************************

// Bottom
pble1_1x = newp; Point(pble1_1x) = {r0, 0, -1*(2*tC+tD)/2-lG,lcEtchingHole};
pble2_1x = newp; Point(pble2_1x) = {0, r0, -1*(2*tC+tD)/2-lG,lcEtchingHole};

// Circular boundaries
cble1_1x = newc; Circle(cble1_1x) = {pble2_1x, pc4_1x, pble1_1x};

// Lines connecting top, middle and bottom
lconn1_1x = newc; Line(lconn1_1x) = {pbh1_1x, pmh1_1x};
lconn2_1x = newc; Line(lconn2_1x) = {pbh2_1x, pmh2_1x};
lconn3_1x = newc; Line(lconn3_1x) = {pmh1_1x, pth1_1x};
lconn4_1x = newc; Line(lconn4_1x) = {pmh2_1x, pth2_1x};


// ------------------------------------------------------------
// Hole 2 (half hole)
// ------------------------------------------------------------

// *******************************
// Center
// *******************************
pc1_2x = newp; Point(pc1_2x) = {a/2, a, tD/2-lG,lcGEMHole};
pc2_2x = newp; Point(pc2_2x) = {a/2, a, -tD/2-lG,lcGEMHole};
pc3_2x = newp; Point(pc3_2x) = {a/2, a, (2*tC+tD)/2-lG,lcGEMHole};
pc4_2x = newp; Point(pc4_2x) = {a/2, a, -(2*tC+tD)/2-lG,lcGEMHole};
pc5_2x = newp; Point(pc5_2x) = {a/2, a, 0-lG, lcGEMHole};

// *******************************
// Dielectric hole
// *******************************
// Top
pth1_2x = newp; Point(pth1_2x) = {a/2-r0, a, tD/2-lG,lcDielectricHole};
pth2_2x = newp; Point(pth2_2x) = {a/2+r0, a, tD/2-lG,lcDielectricHole};
pth3_2x = newp; Point(pth3_2x) = {a/2, a-r0, tD/2-lG,lcDielectricHole};
cth1_2x = newc; Circle(cth1_2x) = {pth1_2x, pc1_2x, pth3_2x};
cth2_2x = newc; Circle(cth2_2x) = {pth3_2x, pc1_2x, pth2_2x};

// Middle
pmh1_2x = newp; Point(pmh1_2x) = {a/2-r1, a, 0-lG, lcDielectricHole};
pmh2_2x = newp; Point(pmh2_2x) = {a/2+r1, a, 0-lG, lcDielectricHole};
pmh3_2x = newp; Point(pmh3_2x) = {a/2, a-r1, 0-lG, lcDielectricHole};
cmh1_2x = newc; Circle(cmh1_2x) = {pmh1_2x, pc5_2x, pmh3_2x};
cmh2_2x = newc; Circle(cmh2_2x) = {pmh3_2x, pc5_2x, pmh2_2x};

// Bottom
pbh1_2x = newp; Point(pbh1_2x) = {a/2-r0, a, -tD/2-lG,lcDielectricHole};
pbh2_2x = newp; Point(pbh2_2x) = {a/2+r0, a, -tD/2-lG,lcDielectricHole};
pbh3_2x = newp; Point(pbh3_2x) = {a/2, a-r0, -tD/2-lG,lcDielectricHole};
cbh1_2x = newc; Circle(cbh1_2x) = {pbh1_2x, pc2_2x, pbh3_2x};
cbh2_2x = newc; Circle(cbh2_2x) = {pbh3_2x, pc2_2x, pbh2_2x};

// *******************************
// Upper Etching
// *******************************

// Top
ptue1_2x = newp; Point(ptue1_2x) = {a/2-r0, a, (2*tC+tD)/2-lG,lcEtchingHole};
ptue2_2x = newp; Point(ptue2_2x) = {a/2+r0, a, (2*tC+tD)/2-lG,lcEtchingHole};
ptue3_2x = newp; Point(ptue3_2x) = {a/2, a-r0, (2*tC+tD)/2-lG,lcEtchingHole};

// Circular boundary
ctue1_2x = newc; Circle(ctue1_2x) = {ptue1_2x, pc3_2x, ptue3_2x};
ctue2_2x = newc; Circle(ctue2_2x) = {ptue3_2x, pc3_2x, ptue2_2x};

lue1_2x = newc; Line(lue1_2x) = {ptue1_2x, pth1_2x};
lue2_2x = newc; Line(lue2_2x) = {ptue2_2x, pth2_2x};
lue3_2x = newc; Line(lue3_2x) = {ptue3_2x, pth3_2x};

// *******************************
// Lower Etching
// *******************************

// Bottom
pble1_2x = newp; Point(pble1_2x) = {a/2-r0, a, -(2*tC+tD)/2-lG,lcEtchingHole};
pble2_2x = newp; Point(pble2_2x) = {a/2+r0, a, -(2*tC+tD)/2-lG,lcEtchingHole};
pble3_2x = newp; Point(pble3_2x) = {a/2, a-r0, -(2*tC+tD)/2-lG,lcEtchingHole};

// Circular boundaries
cble1_2x = newc; Circle(cble1_2x) = {pble1_2x, pc4_2x, pble3_2x};
cble2_2x = newc; Circle(cble2_2x) = {pble3_2x, pc4_2x, pble2_2x};

lle1_2x = newc; Line(lle1_2x) = {pbh1_2x, pble1_2x};
lle2_2x = newc; Line(lle2_2x) = {pbh2_2x, pble2_2x};
lle3_2x = newc; Line(lle3_2x) = {pbh3_2x, pble3_2x};

// Lines connecting top, middle and bottom
lconn1_2x = newc; Line(lconn1_2x) = {pbh1_2x, pmh1_2x};
lconn2_2x = newc; Line(lconn2_2x) = {pbh2_2x, pmh2_2x};
lconn3_2x = newc; Line(lconn3_2x) = {pbh3_2x, pmh3_2x};
lconn4_2x = newc; Line(lconn4_2x) = {pmh1_2x, pth1_2x};
lconn5_2x = newc; Line(lconn5_2x) = {pmh2_2x, pth2_2x};
lconn6_2x = newc; Line(lconn6_2x) = {pmh3_2x, pth3_2x};


// ------------------------------------------------------------
// Hole 3 (quarter hole)
// ------------------------------------------------------------

// *******************************
// Center
// *******************************
pc1_3x = newp; Point(pc1_3x) = {a, 0, tD/2-lG,lcGEMHole};
pc2_3x = newp; Point(pc2_3x) = {a, 0, -1*tD/2-lG,lcGEMHole};
pc3_3x = newp; Point(pc3_3x) = {a, 0, (2*tC+tD)/2-lG,lcGEMHole};
pc4_3x = newp; Point(pc4_3x) = {a, 0, -1*(2*tC+tD)/2-lG,lcGEMHole};
pc5_3x = newp; Point(pc5_3x) = {a, 0, 0-lG,lcGEMHole};

// *******************************
// Dielectric hole
// *******************************
// Top
pth1_3x = newp; Point(pth1_3x) = {a-r0, 0, tD/2-lG,lcDielectricHole};
pth2_3x = newp; Point(pth2_3x) = {a, r0, tD/2-lG,lcDielectricHole};
cth1_3x = newc; Circle(cth1_3x) = {pth2_3x, pc1_3x, pth1_3x};

// Middle
pmh1_3x = newp; Point(pmh1_3x) = {a-r1, 0, 0-lG, lcDielectricHole};
pmh2_3x = newp; Point(pmh2_3x) = {a, r1, 0-lG, lcDielectricHole};
cmh1_3x = newc; Circle(cmh1_3x) = {pmh2_3x, pc5_3x, pmh1_3x};

// Bottom
pbh1_3x = newp; Point(pbh1_3x) = {a-r0, 0, -1*tD/2-lG,lcDielectricHole};
pbh2_3x = newp; Point(pbh2_3x) = {a, r0, -1*tD/2-lG,lcDielectricHole};
cbh1_3x = newc; Circle(cbh1_3x) = {pbh2_3x, pc2_3x, pbh1_3x};

// *******************************
// Upper Etching
// *******************************

// Top
ptue1_3x = newp; Point(ptue1_3x) = {a-r0, 0, (2*tC+tD)/2-lG,lcEtchingHole};
ptue2_3x = newp; Point(ptue2_3x) = {a, r0, (2*tC+tD)/2-lG,lcEtchingHole};

// Circular boundary
ctue1_3x = newc; Circle(ctue1_3x) = {ptue2_3x, pc3_3x, ptue1_3x};

// *******************************
// Lower Etching
// *******************************

// Bottom
pble1_3x = newp; Point(pble1_3x) = {a-r0, 0, -1*(2*tC+tD)/2-lG,lcEtchingHole};
pble2_3x = newp; Point(pble2_3x) = {a, r0, -1*(2*tC+tD)/2-lG,lcEtchingHole};

// Circular boundaries
cble1_3x = newc; Circle(cble1_3x) = {pble2_3x, pc4_3x, pble1_3x};

// Lines connecting top and bottom
lconn1_3x = newc; Line(lconn1_3x) = {pbh1_3x, pmh1_3x};
lconn2_3x = newc; Line(lconn2_3x) = {pbh2_3x, pmh2_3x};
lconn3_3x = newc; Line(lconn3_3x) = {pmh1_3x, pth1_3x};
lconn4_3x = newc; Line(lconn4_3x) = {pmh2_3x, pth2_3x};

// --------------------------------------------------------------------------


// *******************************************************
// Copper planes
// *******************************************************

// Points between two half holes on upper GEM
ptmcx = newp; Point(ptmcx) = {a/2, 0, (2*tC+tD)/2-lG, lcCopperPlateBdry};
ptmdx = newp; Point(ptmdx) = {a/2, 0, tD/2-lG, lcCopperPlateBdry};

// Top lower boundary
pcptl2x = newp; Point(pcptl2x) = {a, a, tD/2-lG,lcCopperPlateBdry};
pcptl3x = newp; Point(pcptl3x) = {0, a, tD/2-lG,lcCopperPlateBdry};

// Top upper boundary
pcptu2x = newp; Point(pcptu2x) = {a, a, (tD+2*tC)/2-lG,lcCopperPlateBdry};
pcptu3x = newp; Point(pcptu3x) = {0, a, (tD+2*tC)/2-lG,lcCopperPlateBdry};

// Border lines
// Upper boundary
lcpt1x = newc; Line(lcpt1x) = {ptue1_2x,pcptu3x};
lcpt2x = newc; Line(lcpt2x) = {pcptu3x,ptue2_1x};
lcpt3ax = newc; Line(lcpt3ax) = {ptue1_1x,ptmcx};
lcpt3bx = newc; Line(lcpt3bx) = {ptmcx,ptue1_3x};
lcpt4x = newc; Line(lcpt4x) = {ptue2_3x,pcptu2x};
lcpt5x = newc; Line(lcpt5x) = {pcptu2x,ptue2_2x};

// Lower boundary
lcpt6x = newc; Line(lcpt6x) = {pc1_1x,pth2_1x};  // starts at point 1 and goes CW holes 1,2,then 3 
lcpt8x = newc; Line(lcpt8x) = {pth2_1x,pcptl3x};
lcpt9x = newc; Line(lcpt9x) = {pcptl3x,pth1_2x};
lcpt11ax = newc; Line(lcpt11ax) = {pth1_2x,pc1_2x};
lcpt11bx = newc; Line(lcpt11bx) = {pc1_2x,pth2_2x};

lcpt13x = newc; Line(lcpt13x) = {pth2_2x,pcptl2x};
lcpt14x = newc; Line(lcpt14x) = {pcptl2x,pth2_3x};
lcpt16x = newc; Line(lcpt16x) = {pth2_3x,pc1_3x};
lcpt17x = newc; Line(lcpt17x) = {pc1_3x,pth1_3x};
lcpt19ax = newc; Line(lcpt19ax) = {pth1_3x,ptmdx};
lcpt19bx = newc; Line(lcpt19bx) = {ptmdx,pth1_1x};
lcpt21x = newc; Line(lcpt21x) = {pth1_1x,pc1_1x};

// Connect the upper and lower points with lines to form the plate
lcpt22x = newc; Line(lcpt22x) = {pcptu2x, pcptl2x}; 
lcpt23x = newc; Line(lcpt23x) = {pcptu3x, pcptl3x}; 
lcpt24x = newc; Line(lcpt24x) = {pc3_1x, pc1_1x}; 
lcpt25x = newc; Line(lcpt25x) = {pc3_3x, pc1_3x}; 
lcpt26x = newc; Line(lcpt26x) = {ptue2_3x, pth2_3x}; 
lcpt27x = newc; Line(lcpt27x) = {ptue1_3x, pth1_3x}; 
lcpt28x = newc; Line(lcpt28x) = {ptue1_1x, pth1_1x};
lcpt29x = newc; Line(lcpt29x) = {ptue2_1x, pth2_1x};

// ---------------------------------------------

// Points between two half holes on lower GEM
pbmdx = newp; Point(pbmdx) = {a/2, 0, -1*tD/2-lG, lcCopperPlateBdry};
pbmcx = newp; Point(pbmcx) = {a/2, 0, -1*(2*tC+tD)/2-lG, lcCopperPlateBdry};

// Bottom lower boundary
pcpbl2x = newp; Point(pcpbl2x) = {a, a, -1*(tD+2*tC)/2-lG,lcCopperPlateBdry};
pcpbl3x = newp; Point(pcpbl3x) = {0, a, -1*(tD+2*tC)/2-lG,lcCopperPlateBdry};

// Bottom upper boundary
pcpbu2x = newp; Point(pcpbu2x) = {a, a, -1*tD/2-lG,lcCopperPlateBdry};
pcpbu3x = newp; Point(pcpbu3x) = {0, a, -1*tD/2-lG,lcCopperPlateBdry};

// Border lines
// Upper boundary
lcpb1x = newc; Line(lcpb1x) = {pble1_2x,pcpbl3x};
lcpb2x = newc; Line(lcpb2x) = {pcpbl3x,pble2_1x};
lcpb3ax = newc; Line(lcpb3ax) = {pble1_1x,pbmcx};
lcpb3bx = newc; Line(lcpb3bx) = {pbmcx,pble1_3x};
lcpb4x = newc; Line(lcpb4x) = {pble2_3x,pcpbl2x};
lcpb5x = newc; Line(lcpb5x) = {pcpbl2x,pble2_2x};

// Lower boundary
lcpb6x = newc; Line(lcpb6x) = {pc2_1x,pbh2_1x};  // starts at point 1 and goes CW holes 1,2,then 3
lcpb8x = newc; Line(lcpb8x) = {pbh2_1x,pcpbu3x};
lcpb9x = newc; Line(lcpb9x) = {pcpbu3x,pbh1_2x};
lcpb11ax = newc; Line(lcpb11ax) = {pbh1_2x,pc2_2x};
lcpb11bx = newc; Line(lcpb11bx) = {pc2_2x,pbh2_2x};
lcpb13x = newc; Line(lcpb13x) = {pbh2_2x,pcpbu2x};
lcpb14x = newc; Line(lcpb14x) = {pcpbu2x,pbh2_3x};
lcpb16x = newc; Line(lcpb16x) = {pbh2_3x,pc2_3x};
lcpb17x = newc; Line(lcpb17x) = {pc2_3x,pbh1_3x};
lcpb19ax = newc; Line(lcpb19ax) = {pbh1_3x,pbmdx};
lcpb19bx = newc; Line(lcpb19bx) = {pbmdx,pbh1_1x};
lcpb21x = newc; Line(lcpb21x) = {pbh1_1x,pc2_1x};

// Connect the upper and lower points with lines to form the plate
lcpb22x = newc; Line(lcpb22x) = {pcpbu2x, pcpbl2x};
lcpb23x = newc; Line(lcpb23x) = {pcpbu3x, pcpbl3x};
lcpb24x = newc; Line(lcpb24x) = {pc2_1x, pc4_1x};
lcpb25x = newc; Line(lcpb25x) = {pc2_3x, pc4_3x};
lcpb26x = newc; Line(lcpb26x) = {pbh2_3x, pble2_3x};
lcpb27x = newc; Line(lcpb27x) = {pbh1_3x, pble1_3x};
lcpb28x = newc; Line(lcpb28x) = {pbh1_1x, pble1_1x};
lcpb29x = newc; Line(lcpb29x) = {pbh2_1x, pble2_1x};

lcpb30x = newc; Line(lcpb30x) = {pc1_1x, pc2_1x};
lcpb31x = newc; Line(lcpb31x) = {pcptl2x, pcpbu2x};
lcpb32x = newc; Line(lcpb32x) = {pcptl3x, pcpbu3x};
lcpb33x = newc; Line(lcpb33x) = {pc1_3x, pc2_3x};

// Lines splitting the GEM in half: half hole side
lshalf1x = newc; Line(lshalf1x) = {pc3_2x, pc1_2x};
lshalf2x = newc; Line(lshalf2x) = {pc1_2x, pc2_2x};
lshalf3x = newc; Line(lshalf3x) = {pc2_2x, pc4_2x};

// Lines splitting the GEM in half: quarter hole side
lsqt1x = newc; Line(lsqt1x) = {ptmcx, ptmdx};
lsqt2x = newc; Line(lsqt2x) = {ptmdx, pbmdx};
lsqt3x = newc; Line(lsqt3x) = {pbmdx, pbmcx};

// THIRD GEM FOIL

// ------------------------------------------------------------
// Hole 1 (quarter hole)
// ------------------------------------------------------------

// *******************************
// Center
// *******************************
pc1_1x_x = newp; Point(pc1_1x_x) = {0, 0, tD/2-2*lG,lcGEMHole};
pc2_1x_x = newp; Point(pc2_1x_x) = {0, 0, -1*tD/2-2*lG,lcGEMHole};
pc3_1x_x = newp; Point(pc3_1x_x) = {0, 0, (2*tC+tD)/2-2*lG,lcGEMHole};
pc4_1x_x = newp; Point(pc4_1x_x) = {0, 0, -1*(2*tC+tD)/2-2*lG,lcGEMHole};
pc5_1x_x = newp; Point(pc5_1x_x) = {0, 0, 0-2*lG, lcGEMHole};

// *******************************
// Dielectric hole
// *******************************
// Top
pth1_1x_x = newp; Point(pth1_1x_x) = {r0, 0, tD/2-2*lG,lcDielectricHole};
pth2_1x_x = newp; Point(pth2_1x_x) = {0, r0, tD/2-2*lG,lcDielectricHole};
cth1_1x_x = 2200; Circle(cth1_1x_x) = {pth2_1x_x, pc1_1x_x, pth1_1x_x};

// Middle
pmh1_1x_x = newp; Point(pmh1_1x_x) = {r1, 0, 0-2*lG, lcDielectricHole};
pmh2_1x_x = newp; Point(pmh2_1x_x) = {0, r1, 0-2*lG, lcDielectricHole};
cmh1_1x_x = newc; Circle(cmh1_1x_x) = {pmh2_1x_x, pc5_1x_x, pmh1_1x_x};	

// Bottom
pbh1_1x_x = newp; Point(pbh1_1x_x) = {r0, 0, -1*tD/2-2*lG,lcDielectricHole};
pbh2_1x_x = newp; Point(pbh2_1x_x) = {0, r0, -1*tD/2-2*lG,lcDielectricHole};
cbh1_1x_x = newc; Circle(cbh1_1x_x) = {pbh2_1x_x, pc2_1x_x, pbh1_1x_x};

// *******************************
// Upper Etching
// *******************************

// Top
ptue1_1x_x = newp; Point(ptue1_1x_x) = {r0, 0, (2*tC+tD)/2-2*lG,lcEtchingHole};
ptue2_1x_x = newp; Point(ptue2_1x_x) = {0, r0, (2*tC+tD)/2-2*lG,lcEtchingHole};

// Circular boundary
ctue1_1x_x = newc; Circle(ctue1_1x_x) = {ptue2_1x_x, pc3_1x_x, ptue1_1x_x};

// *******************************
// Lower Etching
// *******************************

// Bottom
pble1_1x_x = newp; Point(pble1_1x_x) = {r0, 0, -1*(2*tC+tD)/2-2*lG,lcEtchingHole};
pble2_1x_x = newp; Point(pble2_1x_x) = {0, r0, -1*(2*tC+tD)/2-2*lG,lcEtchingHole};

// Circular boundaries
cble1_1x_x = newc; Circle(cble1_1x_x) = {pble2_1x_x, pc4_1x_x, pble1_1x_x};

// Lines connecting top, middle and bottom
lconn1_1x_x = newc; Line(lconn1_1x_x) = {pbh1_1x_x, pmh1_1x_x};
lconn2_1x_x = newc; Line(lconn2_1x_x) = {pbh2_1x_x, pmh2_1x_x};
lconn3_1x_x = newc; Line(lconn3_1x_x) = {pmh1_1x_x, pth1_1x_x};
lconn4_1x_x = newc; Line(lconn4_1x_x) = {pmh2_1x_x, pth2_1x_x};


// ------------------------------------------------------------
// Hole 2 (half hole)
// ------------------------------------------------------------

// *******************************
// Center
// *******************************
pc1_2x_x = newp; Point(pc1_2x_x) = {a/2, a, tD/2-2*lG,lcGEMHole};
pc2_2x_x = newp; Point(pc2_2x_x) = {a/2, a, -tD/2-2*lG,lcGEMHole};
pc3_2x_x = newp; Point(pc3_2x_x) = {a/2, a, (2*tC+tD)/2-2*lG,lcGEMHole};
pc4_2x_x = newp; Point(pc4_2x_x) = {a/2, a, -(2*tC+tD)/2-2*lG,lcGEMHole};
pc5_2x_x = newp; Point(pc5_2x_x) = {a/2, a, 0-2*lG, lcGEMHole};

// *******************************
// Dielectric hole
// *******************************
// Top
pth1_2x_x = newp; Point(pth1_2x_x) = {a/2-r0, a, tD/2-2*lG,lcDielectricHole};
pth2_2x_x = newp; Point(pth2_2x_x) = {a/2+r0, a, tD/2-2*lG,lcDielectricHole};
pth3_2x_x = newp; Point(pth3_2x_x) = {a/2, a-r0, tD/2-2*lG,lcDielectricHole};
cth1_2x_x = newc; Circle(cth1_2x_x) = {pth1_2x_x, pc1_2x_x, pth3_2x_x};
cth2_2x_x = newc; Circle(cth2_2x_x) = {pth3_2x_x, pc1_2x_x, pth2_2x_x};

// Middle
pmh1_2x_x = newp; Point(pmh1_2x_x) = {a/2-r1, a, 0-2*lG, lcDielectricHole};
pmh2_2x_x = newp; Point(pmh2_2x_x) = {a/2+r1, a, 0-2*lG, lcDielectricHole};
pmh3_2x_x = newp; Point(pmh3_2x_x) = {a/2, a-r1, 0-2*lG, lcDielectricHole};
cmh1_2x_x = newc; Circle(cmh1_2x_x) = {pmh1_2x_x, pc5_2x_x, pmh3_2x_x};
cmh2_2x_x = newc; Circle(cmh2_2x_x) = {pmh3_2x_x, pc5_2x_x, pmh2_2x_x};

// Bottom
pbh1_2x_x = newp; Point(pbh1_2x_x) = {a/2-r0, a, -tD/2-2*lG,lcDielectricHole};
pbh2_2x_x = newp; Point(pbh2_2x_x) = {a/2+r0, a, -tD/2-2*lG,lcDielectricHole};
pbh3_2x_x = newp; Point(pbh3_2x_x) = {a/2, a-r0, -tD/2-2*lG,lcDielectricHole};
cbh1_2x_x = newc; Circle(cbh1_2x_x) = {pbh1_2x_x, pc2_2x_x, pbh3_2x_x};
cbh2_2x_x = newc; Circle(cbh2_2x_x) = {pbh3_2x_x, pc2_2x_x, pbh2_2x_x};

// *******************************
// Upper Etching
// *******************************

// Top
ptue1_2x_x = newp; Point(ptue1_2x_x) = {a/2-r0, a, (2*tC+tD)/2-2*lG,lcEtchingHole};
ptue2_2x_x = newp; Point(ptue2_2x_x) = {a/2+r0, a, (2*tC+tD)/2-2*lG,lcEtchingHole};
ptue3_2x_x = newp; Point(ptue3_2x_x) = {a/2, a-r0, (2*tC+tD)/2-2*lG,lcEtchingHole};

// Circular boundary
ctue1_2x_x = newc; Circle(ctue1_2x_x) = {ptue1_2x_x, pc3_2x_x, ptue3_2x_x};
ctue2_2x_x = newc; Circle(ctue2_2x_x) = {ptue3_2x_x, pc3_2x_x, ptue2_2x_x};

lue1_2x_x = newc; Line(lue1_2x_x) = {ptue1_2x_x, pth1_2x_x};
lue2_2x_x = newc; Line(lue2_2x_x) = {ptue2_2x_x, pth2_2x_x};
lue3_2x_x = newc; Line(lue3_2x_x) = {ptue3_2x_x, pth3_2x_x};

// *******************************
// Lower Etching
// *******************************

// Bottom
pble1_2x_x = newp; Point(pble1_2x_x) = {a/2-r0, a, -(2*tC+tD)/2-2*lG,lcEtchingHole};
pble2_2x_x = newp; Point(pble2_2x_x) = {a/2+r0, a, -(2*tC+tD)/2-2*lG,lcEtchingHole};
pble3_2x_x = newp; Point(pble3_2x_x) = {a/2, a-r0, -(2*tC+tD)/2-2*lG,lcEtchingHole};

// Circular boundaries
cble1_2x_x = newc; Circle(cble1_2x_x) = {pble1_2x_x, pc4_2x_x, pble3_2x_x};
cble2_2x_x = newc; Circle(cble2_2x_x) = {pble3_2x_x, pc4_2x_x, pble2_2x_x};

lle1_2x_x = newc; Line(lle1_2x_x) = {pbh1_2x_x, pble1_2x_x};
lle2_2x_x = newc; Line(lle2_2x_x) = {pbh2_2x_x, pble2_2x_x};
lle3_2x_x = newc; Line(lle3_2x_x) = {pbh3_2x_x, pble3_2x_x};

// Lines connecting top, middle and bottom
lconn1_2x_x = newc; Line(lconn1_2x_x) = {pbh1_2x_x, pmh1_2x_x};
lconn2_2x_x = newc; Line(lconn2_2x_x) = {pbh2_2x_x, pmh2_2x_x};
lconn3_2x_x = newc; Line(lconn3_2x_x) = {pbh3_2x_x, pmh3_2x_x};
lconn4_2x_x = newc; Line(lconn4_2x_x) = {pmh1_2x_x, pth1_2x_x};
lconn5_2x_x = newc; Line(lconn5_2x_x) = {pmh2_2x_x, pth2_2x_x};
lconn6_2x_x = newc; Line(lconn6_2x_x) = {pmh3_2x_x, pth3_2x_x};


// ------------------------------------------------------------
// Hole 3 (quarter hole)
// ------------------------------------------------------------

// *******************************
// Center
// *******************************
pc1_3x_x = newp; Point(pc1_3x_x) = {a, 0, tD/2-2*lG,lcGEMHole};
pc2_3x_x = newp; Point(pc2_3x_x) = {a, 0, -1*tD/2-2*lG,lcGEMHole};
pc3_3x_x = newp; Point(pc3_3x_x) = {a, 0, (2*tC+tD)/2-2*lG,lcGEMHole};
pc4_3x_x = newp; Point(pc4_3x_x) = {a, 0, -1*(2*tC+tD)/2-2*lG,lcGEMHole};
pc5_3x_x = newp; Point(pc5_3x_x) = {a, 0, 0-2*lG,lcGEMHole};

// *******************************
// Dielectric hole
// *******************************
// Top
pth1_3x_x = newp; Point(pth1_3x_x) = {a-r0, 0, tD/2-2*lG,lcDielectricHole};
pth2_3x_x = newp; Point(pth2_3x_x) = {a, r0, tD/2-2*lG,lcDielectricHole};
cth1_3x_x = newc; Circle(cth1_3x_x) = {pth2_3x_x, pc1_3x_x, pth1_3x_x};

// Middle
pmh1_3x_x = newp; Point(pmh1_3x_x) = {a-r1, 0, 0-2*lG, lcDielectricHole};
pmh2_3x_x = newp; Point(pmh2_3x_x) = {a, r1, 0-2*lG, lcDielectricHole};
cmh1_3x_x = newc; Circle(cmh1_3x_x) = {pmh2_3x_x, pc5_3x_x, pmh1_3x_x};

// Bottom
pbh1_3x_x = newp; Point(pbh1_3x_x) = {a-r0, 0, -1*tD/2-2*lG,lcDielectricHole};
pbh2_3x_x = newp; Point(pbh2_3x_x) = {a, r0, -1*tD/2-2*lG,lcDielectricHole};
cbh1_3x_x = newc; Circle(cbh1_3x_x) = {pbh2_3x_x, pc2_3x_x, pbh1_3x_x};

// *******************************
// Upper Etching
// *******************************

// Top
ptue1_3x_x = newp; Point(ptue1_3x_x) = {a-r0, 0, (2*tC+tD)/2-2*lG,lcEtchingHole};
ptue2_3x_x = newp; Point(ptue2_3x_x) = {a, r0, (2*tC+tD)/2-2*lG,lcEtchingHole};

// Circular boundary
ctue1_3x_x = newc; Circle(ctue1_3x_x) = {ptue2_3x_x, pc3_3x_x, ptue1_3x_x};

// *******************************
// Lower Etching
// *******************************

// Bottom
pble1_3x_x = newp; Point(pble1_3x_x) = {a-r0, 0, -1*(2*tC+tD)/2-2*lG,lcEtchingHole};
pble2_3x_x = newp; Point(pble2_3x_x) = {a, r0, -1*(2*tC+tD)/2-2*lG,lcEtchingHole};

// Circular boundaries
cble1_3x_x = newc; Circle(cble1_3x_x) = {pble2_3x_x, pc4_3x_x, pble1_3x_x};

// Lines connecting top and bottom
lconn1_3x_x = newc; Line(lconn1_3x_x) = {pbh1_3x_x, pmh1_3x_x};
lconn2_3x_x = newc; Line(lconn2_3x_x) = {pbh2_3x_x, pmh2_3x_x};
lconn3_3x_x = newc; Line(lconn3_3x_x) = {pmh1_3x_x, pth1_3x_x};
lconn4_3x_x = newc; Line(lconn4_3x_x) = {pmh2_3x_x, pth2_3x_x};

// --------------------------------------------------------------------------


// *******************************************************
// Copper planes
// *******************************************************

// Points between two half holes on upper GEM
ptmcx_x = newp; Point(ptmcx_x) = {a/2, 0, (2*tC+tD)/2-2*lG, lcCopperPlateBdry};
ptmdx_x = newp; Point(ptmdx_x) = {a/2, 0, tD/2-2*lG, lcCopperPlateBdry};

// Top lower boundary
pcptl2x_x = newp; Point(pcptl2x_x) = {a, a, tD/2-2*lG,lcCopperPlateBdry};
pcptl3x_x = newp; Point(pcptl3x_x) = {0, a, tD/2-2*lG,lcCopperPlateBdry};

// Top upper boundary
pcptu2x_x = newp; Point(pcptu2x_x) = {a, a, (tD+2*tC)/2-2*lG,lcCopperPlateBdry};
pcptu3x_x = newp; Point(pcptu3x_x) = {0, a, (tD+2*tC)/2-2*lG,lcCopperPlateBdry};

// Border lines
// Upper boundary
lcpt1x_x = newc; Line(lcpt1x_x) = {ptue1_2x_x,pcptu3x_x};
lcpt2x_x = newc; Line(lcpt2x_x) = {pcptu3x_x,ptue2_1x_x};
lcpt3ax_x = newc; Line(lcpt3ax_x) = {ptue1_1x_x,ptmcx_x};
lcpt3bx_x = newc; Line(lcpt3bx_x) = {ptmcx_x,ptue1_3x_x};
lcpt4x_x = newc; Line(lcpt4x_x) = {ptue2_3x_x,pcptu2x_x};
lcpt5x_x = newc; Line(lcpt5x_x) = {pcptu2x_x,ptue2_2x_x};

// Lower boundary
lcpt6x_x = newc; Line(lcpt6x_x) = {pc1_1x_x,pth2_1x_x};  // starts at point 1 and goes CW holes 1,2,then 3 
lcpt8x_x = newc; Line(lcpt8x_x) = {pth2_1x_x,pcptl3x_x};
lcpt9x_x = newc; Line(lcpt9x_x) = {pcptl3x_x,pth1_2x_x};
lcpt11ax_x = newc; Line(lcpt11ax_x) = {pth1_2x_x,pc1_2x_x};
lcpt11bx_x = newc; Line(lcpt11bx_x) = {pc1_2x_x,pth2_2x_x};

lcpt13x_x = newc; Line(lcpt13x_x) = {pth2_2x_x,pcptl2x_x};
lcpt14x_x = newc; Line(lcpt14x_x) = {pcptl2x_x,pth2_3x_x};
lcpt16x_x = newc; Line(lcpt16x_x) = {pth2_3x_x,pc1_3x_x};
lcpt17x_x = newc; Line(lcpt17x_x) = {pc1_3x_x,pth1_3x_x};
lcpt19ax_x = newc; Line(lcpt19ax_x) = {pth1_3x_x,ptmdx_x};
lcpt19bx_x = newc; Line(lcpt19bx_x) = {ptmdx_x,pth1_1x_x};
lcpt21x_x = newc; Line(lcpt21x_x) = {pth1_1x_x,pc1_1x_x};

// Connect the upper and lower points with lines to form the plate
lcpt22x_x = newc; Line(lcpt22x_x) = {pcptu2x_x, pcptl2x_x}; 
lcpt23x_x = newc; Line(lcpt23x_x) = {pcptu3x_x, pcptl3x_x}; 
lcpt24x_x = newc; Line(lcpt24x_x) = {pc3_1x_x, pc1_1x_x}; 
lcpt25x_x = newc; Line(lcpt25x_x) = {pc3_3x_x, pc1_3x_x}; 
lcpt26x_x = newc; Line(lcpt26x_x) = {ptue2_3x_x, pth2_3x_x}; 
lcpt27x_x = newc; Line(lcpt27x_x) = {ptue1_3x_x, pth1_3x_x}; 
lcpt28x_x = newc; Line(lcpt28x_x) = {ptue1_1x_x, pth1_1x_x};
lcpt29x_x = newc; Line(lcpt29x_x) = {ptue2_1x_x, pth2_1x_x};

// ---------------------------------------------

// Points between two half holes on lower GEM
pbmdx_x = newp; Point(pbmdx_x) = {a/2, 0, -1*tD/2-2*lG, lcCopperPlateBdry};
pbmcx_x = newp; Point(pbmcx_x) = {a/2, 0, -1*(2*tC+tD)/2-2*lG, lcCopperPlateBdry};

// Bottom lower boundary
pcpbl2x_x = newp; Point(pcpbl2x_x) = {a, a, -1*(tD+2*tC)/2-2*lG,lcCopperPlateBdry};
pcpbl3x_x = newp; Point(pcpbl3x_x) = {0, a, -1*(tD+2*tC)/2-2*lG,lcCopperPlateBdry};

// Bottom upper boundary
pcpbu2x_x = newp; Point(pcpbu2x_x) = {a, a, -1*tD/2-2*lG,lcCopperPlateBdry};
pcpbu3x_x = newp; Point(pcpbu3x_x) = {0, a, -1*tD/2-2*lG,lcCopperPlateBdry};

// Border lines
// Upper boundary
lcpb1x_x = newc; Line(lcpb1x_x) = {pble1_2x_x,pcpbl3x_x};
lcpb2x_x = newc; Line(lcpb2x_x) = {pcpbl3x_x,pble2_1x_x};
lcpb3ax_x = newc; Line(lcpb3ax_x) = {pble1_1x_x,pbmcx_x};
lcpb3bx_x = newc; Line(lcpb3bx_x) = {pbmcx_x,pble1_3x_x};
lcpb4x_x = newc; Line(lcpb4x_x) = {pble2_3x_x,pcpbl2x_x};
lcpb5x_x = newc; Line(lcpb5x_x) = {pcpbl2x_x,pble2_2x_x};

// Lower boundary
lcpb6x_x = newc; Line(lcpb6x_x) = {pc2_1x_x,pbh2_1x_x};  // starts at point 1 and goes CW holes 1,2,then 3
lcpb8x_x = newc; Line(lcpb8x_x) = {pbh2_1x_x,pcpbu3x_x};
lcpb9x_x = newc; Line(lcpb9x_x) = {pcpbu3x_x,pbh1_2x_x};
lcpb11ax_x = newc; Line(lcpb11ax_x) = {pbh1_2x_x,pc2_2x_x};
lcpb11bx_x = newc; Line(lcpb11bx_x) = {pc2_2x_x,pbh2_2x_x};
lcpb13x_x = newc; Line(lcpb13x_x) = {pbh2_2x_x,pcpbu2x_x};
lcpb14x_x = newc; Line(lcpb14x_x) = {pcpbu2x_x,pbh2_3x_x};
lcpb16x_x = newc; Line(lcpb16x_x) = {pbh2_3x_x,pc2_3x_x};
lcpb17x_x = newc; Line(lcpb17x_x) = {pc2_3x_x,pbh1_3x_x};
lcpb19ax_x = newc; Line(lcpb19ax_x) = {pbh1_3x_x,pbmdx_x};
lcpb19bx_x = newc; Line(lcpb19bx_x) = {pbmdx_x,pbh1_1x_x};
lcpb21x_x = newc; Line(lcpb21x_x) = {pbh1_1x_x,pc2_1x_x};

// Connect the upper and lower points with lines to form the plate
lcpb22x_x = newc; Line(lcpb22x_x) = {pcpbu2x_x, pcpbl2x_x};
lcpb23x_x = newc; Line(lcpb23x_x) = {pcpbu3x_x, pcpbl3x_x};
lcpb24x_x = newc; Line(lcpb24x_x) = {pc2_1x_x, pc4_1x_x};
lcpb25x_x = newc; Line(lcpb25x_x) = {pc2_3x_x, pc4_3x_x};
lcpb26x_x = newc; Line(lcpb26x_x) = {pbh2_3x_x, pble2_3x_x};
lcpb27x_x = newc; Line(lcpb27x_x) = {pbh1_3x_x, pble1_3x_x};
lcpb28x_x = newc; Line(lcpb28x_x) = {pbh1_1x_x, pble1_1x_x};
lcpb29x_x = newc; Line(lcpb29x_x) = {pbh2_1x_x, pble2_1x_x};

lcpb30x_x = newc; Line(lcpb30x_x) = {pc1_1x_x, pc2_1x_x};
lcpb31x_x = newc; Line(lcpb31x_x) = {pcptl2x_x, pcpbu2x_x};
lcpb32x_x = newc; Line(lcpb32x_x) = {pcptl3x_x, pcpbu3x_x};
lcpb33x_x = newc; Line(lcpb33x_x) = {pc1_3x_x, pc2_3x_x};

// Lines splitting the GEM in half: half hole side
lshalf1x_x = newc; Line(lshalf1x_x) = {pc3_2x_x, pc1_2x_x};
lshalf2x_x = newc; Line(lshalf2x_x) = {pc1_2x_x, pc2_2x_x};
lshalf3x_x = newc; Line(lshalf3x_x) = {pc2_2x_x, pc4_2x_x};

// Lines splitting the GEM in half: quarter hole side
lsqt1x_x = newc; Line(lsqt1x_x) = {ptmcx_x, ptmdx_x};
lsqt2x_x = newc; Line(lsqt2x_x) = {ptmdx_x, pbmdx_x};
lsqt3x_x = newc; Line(lsqt3x_x) = {pbmdx_x, pbmcx_x};





// **********************************************
// External Electrodes
// **********************************************

// Top electrode
pexet1 = newp; Point(pexet1) = {a, a, (tD+2*tC)/2+lE,lcExtElectrodeBdry};
pexet2 = newp; Point(pexet2) = {a/2, a, (tD+2*tC)/2+lE,lcExtElectrodeBdry};
pexet3 = newp; Point(pexet3) = {0, a, (tD+2*tC)/2+lE,lcExtElectrodeBdry};
pexet4 = newp; Point(pexet4) = {0, 0, (tD+2*tC)/2+lE,lcExtElectrodeBdry};
pexet5 = newp; Point(pexet5) = {a/2, 0, (tD+2*tC)/2+lE,lcExtElectrodeBdry};
pexet6 = newp; Point(pexet6) = {a, 0, (tD+2*tC)/2+lE,lcExtElectrodeBdry};

// Top electrode lines
lexet1 = newc; Line(lexet1) = {pexet1, pexet2};
lexet2 = newc; Line(lexet2) = {pexet2, pexet3};
lexet3 = newc; Line(lexet3) = {pexet3, pexet4};
lexet4 = newc; Line(lexet4) = {pexet4, pexet5};
lexet5 = newc; Line(lexet5) = {pexet5, pexet6};
lexet6 = newc; Line(lexet6) = {pexet6, pexet1};

// Connect the top electrode to the GEM.
lexetc1 = newc; Line(lexetc1) = {pexet1, pcptu2};
lexetc2 = newc; Line(lexetc2) = {pexet2, pc3_2};
lexetc3 = newc; Line(lexetc3) = {pexet3, pcptu3};
lexetc4 = newc; Line(lexetc4) = {pexet4, pc3_1};
lexetc5 = newc; Line(lexetc5) = {pexet5, ptmc};
lexetc6 = newc; Line(lexetc6) = {pexet6, pc3_3};

// Bottom electrode
pexeb1 = newp; Point(pexeb1) = {a, a, -1*(tD+2*tC)/2-lP-2*lG,lcExtElectrodeBdry};
pexeb2 = newp; Point(pexeb2) = {a/2, a, -1*(tD+2*tC)/2-lP-2*lG,lcExtElectrodeBdry};
pexeb3 = newp; Point(pexeb3) = {0, a, -1*(tD+2*tC)/2-lP-2*lG,lcExtElectrodeBdry};
pexeb4 = newp; Point(pexeb4) = {0, 0, -1*(tD+2*tC)/2-lP-2*lG,lcExtElectrodeBdry};
pexeb5 = newp; Point(pexeb5) = {a/2, 0, -1*(tD+2*tC)/2-lP-2*lG,lcExtElectrodeBdry};
pexeb6 = newp; Point(pexeb6) = {a, 0, -1*(tD+2*tC)/2-lP-2*lG,lcExtElectrodeBdry};

// Bottom electrode lines
lexeb1 = newc; Line(lexeb1) = {pexeb1, pexeb2};
lexeb2 = newc; Line(lexeb2) = {pexeb2, pexeb3};
lexeb3 = newc; Line(lexeb3) = {pexeb3, pexeb4};
lexeb4 = newc; Line(lexeb4) = {pexeb4, pexeb5};
lexeb5 = newc; Line(lexeb5) = {pexeb5, pexeb6};
lexeb6 = newc; Line(lexeb6) = {pexeb6, pexeb1};

// Connect the bottom electrode to the GEM.
lexebc1 = newc; Line(lexebc1) = {pexeb1, pcpbl2x_x};
lexebc2 = newc; Line(lexebc2) = {pexeb2, pc4_2x_x};
lexebc3 = newc; Line(lexebc3) = {pexeb3, pcpbl3x_x};
lexebc4 = newc; Line(lexebc4) = {pexeb4, pc4_1x_x};
lexebc5 = newc; Line(lexebc5) = {pexeb5, pbmcx_x};
lexebc6 = newc; Line(lexebc6) = {pexeb6, pc4_3x_x};

// *************************************************
// Transfer region(s)
// *************************************************
// Top transfer region

ltreg1vx = newc; Line(ltreg1vx) = {pc4_1, pc3_1x};
ltreg2vx = newc; Line(ltreg2vx) = {pbmc, ptmcx};
ltreg3vx = newc; Line(ltreg3vx) = {pc4_3, pc3_3x};
ltreg4vx = newc; Line(ltreg4vx) = {pcpbl2, pcptu2x};
ltreg5vx = newc; Line(ltreg5vx) = {pc4_2, pc3_2x};
ltreg6vx = newc; Line(ltreg6vx) = {pcpbl3, pcptu3x};


// Bottom transfer region
ltreg1vx_x = newc; Line(ltreg1vx_x) = {pc4_1x, pc3_1x_x};
ltreg2vx_x = newc; Line(ltreg2vx_x) = {pbmcx, ptmcx_x};
ltreg3vx_x = newc; Line(ltreg3vx_x) = {pc4_3x, pc3_3x_x};
ltreg4vx_x = newc; Line(ltreg4vx_x) = {pcpbl2x, pcptu2x_x};
ltreg5vx_x = newc; Line(ltreg5vx_x) = {pc4_2x, pc3_2x_x};
ltreg6vx_x = newc; Line(ltreg6vx_x) = {pcpbl3x, pcptu3x_x};


// *************************************************
// Define surfaces
// *************************************************

//////////////// GEM 1 SURFACES

// Copper plate surfaces
llcp_up_rim1_2 = newreg; Line Loop(llcp_up_rim1_2) = {-lue1_2, -cth1_2, lue3_2, ctue1_2};
rscp_up_rim1_2 = newreg; Surface(rscp_up_rim1_2) = {llcp_up_rim1_2};
llcp_up_rim2_2 = newreg; Line Loop(llcp_up_rim2_2) = {lue2_2, -1*cth2_2, -1*lue3_2, ctue2_2};
rscp_up_rim2_2 = newreg; Surface(rscp_up_rim2_2) = {llcp_up_rim2_2};

llcp_up_rim_1 = newreg; Line Loop(llcp_up_rim_1) = {lcpt29, cth1_1, -lcpt28, -ctue1_1};
rscp_up_rim_1 = newreg; Surface(rscp_up_rim_1) = {llcp_up_rim_1};
llcp_up_rim_3 = newreg; Line Loop(llcp_up_rim_3) = {lcpt27, -cth1_3, -lcpt26, ctue1_3};
rscp_up_rim_3 = newreg; Surface(rscp_up_rim_3) = {llcp_up_rim_3};

llcp_up_border1 = newreg; Line Loop(llcp_up_border1) = {lcpt26, -lcpt14, -lcpt22, -lcpt4};
pscp_up_border1 = newreg; Plane Surface(pscp_up_border1) = {llcp_up_border1};
llcp_up_border2 = newreg; Line Loop(llcp_up_border2) = {lue1_2, -lcpt9, -lcpt23, -lcpt1};
pscp_up_border2 = newreg; Plane Surface(pscp_up_border2) = {llcp_up_border2};
llcp_up_border3 = newreg; Line Loop(llcp_up_border3) = {-lcpt2, -lcpt29, -lcpt8, lcpt23};
pscp_up_border3 = newreg; Plane Surface(pscp_up_border3) = {llcp_up_border3};
llcp_up_border4a = newreg; Line Loop(llcp_up_border4a) = {-lcpt3b, -lcpt27, -lcpt19a, lsqt1};
pscp_up_border4a = newreg; Plane Surface(pscp_up_border4a) = {llcp_up_border4a};
llcp_up_border4b = newreg; Line Loop(llcp_up_border4b) = {-lcpt3a, lcpt28, -lcpt19b, -lsqt1};
pscp_up_border4b = newreg; Plane Surface(pscp_up_border4b) = {llcp_up_border4b};
llcp_up_border5 = newreg; Line Loop(llcp_up_border5) = {-lcpt5, -lue2_2, -lcpt13, lcpt22};
pscp_up_border5 = newreg; Plane Surface(pscp_up_border5) = {llcp_up_border5};

llcp_low_rim1_2 = newreg; Line Loop(llcp_low_rim1_2) = {-lle1_2, cbh1_2, lle3_2, -cble1_2};
rscp_low_rim1_2 = newreg; Surface(rscp_low_rim1_2) = {llcp_low_rim1_2};
llcp_low_rim2_2 = newreg; Line Loop(llcp_low_rim2_2) = {lle2_2, cbh2_2, -lle3_2, -cble2_2};
rscp_low_rim2_2 = newreg; Surface(rscp_low_rim2_2) = {llcp_low_rim2_2};

llcp_low_rim_1 = newreg; Line Loop(llcp_low_rim_1) = {lcpb29, -cbh1_1, -lcpb28, cble1_1};
rscp_low_rim_1 = newreg; Surface(rscp_low_rim_1) = {llcp_low_rim_1};
llcp_low_rim_3 = newreg; Line Loop(llcp_low_rim_3) = {lcpb27, cbh1_3, -lcpb26, -cble1_3};
rscp_low_rim_3 = newreg; Surface(rscp_low_rim_3) = {llcp_low_rim_3};

llcp_low_border1 = newreg; Line Loop(llcp_low_border1) = {lcpb26, lcpb14, -lcpb22, lcpb4};
pscp_low_border1 = newreg; Plane Surface(pscp_low_border1) = {llcp_low_border1};
llcp_low_border2 = newreg; Line Loop(llcp_low_border2) = {lle1_2, lcpb9, -lcpb23, lcpb1};
pscp_low_border2 = newreg; Plane Surface(pscp_low_border2) = {llcp_low_border2};
llcp_low_border3 = newreg; Line Loop(llcp_low_border3) = {lcpb2, -lcpb29, lcpb8, lcpb23};
pscp_low_border3 = newreg; Plane Surface(pscp_low_border3) = {llcp_low_border3};
llcp_low_border4a = newreg; Line Loop(llcp_low_border4a) = {lcpb19a, lsqt3, lcpb3b, -lcpb27};
pscp_low_border4a = newreg; Plane Surface(pscp_low_border4a) = {llcp_low_border4a};
llcp_low_border4b = newreg; Line Loop(llcp_low_border4b) = {lcpb19b, lcpb28, lcpb3a, -lsqt3};
pscp_low_border4b = newreg; Plane Surface(pscp_low_border4b) = {llcp_low_border4b};
llcp_low_border5 = newreg; Line Loop(llcp_low_border5) = {lcpb5, -lle2_2, lcpb13, lcpb22};
pscp_low_border5 = newreg; Plane Surface(pscp_low_border5) = {llcp_low_border5};

llcp_face1 = newreg; Line Loop(llcp_face1) = {lcpt2, ctue1_1, lcpt3a, lcpt3b, -1*ctue1_3, lcpt4, lcpt5, -1*ctue2_2, -1*ctue1_2, lcpt1};
pscp_face1 = newreg; Plane Surface(pscp_face1) = {llcp_face1};
llcp_face2 = newreg; Line Loop(llcp_face2) = {-lcpb1, -lcpb2, -cble1_1, -lcpb3a, -lcpb3b, cble1_3, -lcpb4, -lcpb5, cble2_2, cble1_2};
pscp_face2 = newreg; Plane Surface(pscp_face2) = {llcp_face2};

// Dielectric surfaces
ll_up_dielectric_1 = newreg; Line Loop(ll_up_dielectric_1) = {lconn3_1, -cth1_1, -lconn4_1, cmh1_1};
ps_up_dielectric_1 = newreg; Surface(ps_up_dielectric_1) = {ll_up_dielectric_1};
ll_low_dielectric_1 = newreg; Line Loop(ll_low_dielectric_1) = {lconn1_1, -cmh1_1, -lconn2_1, cbh1_1};
ps_low_dielectric_1 = newreg; Surface(ps_low_dielectric_1) = {ll_low_dielectric_1};

ll_up_dielectric_2a = newreg; Line Loop(ll_up_dielectric_2a) = {lconn4_2, cth1_2, -lconn6_2,-cmh1_2};
ps_up_dielectric_2a = newreg; Surface(ps_up_dielectric_2a) = {ll_up_dielectric_2a};
ll_up_dielectric_2b = newreg; Line Loop(ll_up_dielectric_2b) = {cth2_2, -lconn5_2, -cmh2_2, lconn6_2};
ps_up_dielectric_2b = newreg; Surface(ps_up_dielectric_2b) = {ll_up_dielectric_2b};
ll_low_dielectric_2a = newreg; Line Loop(ll_low_dielectric_2a) = {lconn1_2, cmh1_2, -lconn3_2, -cbh1_2};
ps_low_dielectric_2a = newreg; Surface(ps_low_dielectric_2a) = {ll_low_dielectric_2a};
ll_low_dielectric_2b = newreg; Line Loop(ll_low_dielectric_2b) = {lconn3_2, cmh2_2, -lconn2_2, -cbh2_2};
ps_low_dielectric_2b = newreg; Surface(ps_low_dielectric_2b) = {ll_low_dielectric_2b};

ll_up_dielectric_3 = newreg; Line Loop(ll_up_dielectric_3) = {lconn3_3, -cth1_3, -lconn4_3, cmh1_3};
ps_up_dielectric_3 = newreg; Surface(ps_up_dielectric_3) = {ll_up_dielectric_3};
ll_low_dielectric_3 = newreg; Line Loop(ll_low_dielectric_3) = {lconn1_3, -cmh1_3, -lconn2_3, cbh1_3};
ps_low_dielectric_3 = newreg; Surface(ps_low_dielectric_3) = {ll_low_dielectric_3};

ll_side_dielectric1a = newreg; Line Loop(ll_side_dielectric1a) = {lcpt19b, -lconn3_1, -lconn1_1, -lcpb19b, -lsqt2};
ps_side_dielectric1a = newreg; Plane Surface(ps_side_dielectric1a) = {ll_side_dielectric1a};
ll_side_dielectric1c = newreg; Line Loop(ll_side_dielectric1c) = {lcpt19a, lsqt2, -lcpb19a, lconn1_3, lconn3_3};
ps_side_dielectric1c = newreg; Plane Surface(ps_side_dielectric1c) = {ll_side_dielectric1c};
ll_side_dielectric2a = newreg; Line Loop(ll_side_dielectric2a) = {lcpt14, -lconn4_3, -lconn2_3, -lcpb14, -lcpb31};
ps_side_dielectric2a = newreg; Plane Surface(ps_side_dielectric2a) = {ll_side_dielectric2a};

ll_side_dielectric3a = newreg; Line Loop(ll_side_dielectric3a) = {lcpt13, lcpb31, -lcpb13, lconn2_2, lconn5_2};
ps_side_dielectric3a = newreg; Plane Surface(ps_side_dielectric3a) = {ll_side_dielectric3a};
ll_side_dielectric4a = newreg; Line Loop(ll_side_dielectric4a) = {lcpt9, -lconn4_2, -lconn1_2, -lcpb9, -lcpb32};
ps_side_dielectric4a = newreg; Plane Surface(ps_side_dielectric4a) = {ll_side_dielectric4a};
ll_side_dielectric5a = newreg; Line Loop(ll_side_dielectric5a) = {lcpt8, lcpb32, -lcpb8, lconn2_1, lconn4_1};
ps_side_dielectric5a = newreg; Plane Surface(ps_side_dielectric5a) = {ll_side_dielectric5a};

ll_top_dielectric = newreg; Line Loop(ll_top_dielectric) = {lcpt9, cth1_2, cth2_2, lcpt13, lcpt14, cth1_3, lcpt19a, lcpt19b, -cth1_1, lcpt8};
ps_top_dielectric = newreg; Plane Surface(ps_top_dielectric) = {ll_top_dielectric};
ll_bottom_dielectric = newreg; Line Loop(ll_bottom_dielectric) = {-lcpb19a, -lcpb19b, cbh1_1, -lcpb8, -lcpb9, -cbh1_2, -cbh2_2, -lcpb13, -lcpb14, -cbh1_3};
ps_bottom_dielectric = newreg; Plane Surface(ps_bottom_dielectric) = {ll_bottom_dielectric};


//////////////// GEM 2 SURFACES

// Copper plate surfaces
llcp_up_rim1_2x = newreg; Line Loop(llcp_up_rim1_2x) = {-lue1_2x, -cth1_2x, lue3_2x, ctue1_2x};
rscp_up_rim1_2x = newreg; Surface(rscp_up_rim1_2x) = {llcp_up_rim1_2x};
llcp_up_rim2_2x = newreg; Line Loop(llcp_up_rim2_2x) = {lue2_2x, -1*cth2_2x, -1*lue3_2x, ctue2_2x};
rscp_up_rim2_2x = newreg; Surface(rscp_up_rim2_2x) = {llcp_up_rim2_2x};

llcp_up_rim_1x = newreg; Line Loop(llcp_up_rim_1x) = {lcpt29x, cth1_1x, -lcpt28x, -ctue1_1x};
rscp_up_rim_1x = newreg; Surface(rscp_up_rim_1x) = {llcp_up_rim_1x};
llcp_up_rim_3x = newreg; Line Loop(llcp_up_rim_3x) = {lcpt27x, -cth1_3x, -lcpt26x, ctue1_3x};
rscp_up_rim_3x = newreg; Surface(rscp_up_rim_3x) = {llcp_up_rim_3x};

llcp_up_border1x = newreg; Line Loop(llcp_up_border1x) = {lcpt26x, -lcpt14x, -lcpt22x, -lcpt4x};
pscp_up_border1x = newreg; Plane Surface(pscp_up_border1x) = {llcp_up_border1x};
llcp_up_border2x = newreg; Line Loop(llcp_up_border2x) = {lue1_2x, -lcpt9x, -lcpt23x, -lcpt1x};
pscp_up_border2x = newreg; Plane Surface(pscp_up_border2x) = {llcp_up_border2x};
llcp_up_border3x = newreg; Line Loop(llcp_up_border3x) = {-lcpt2x, -lcpt29x, -lcpt8x, lcpt23x};
pscp_up_border3x = newreg; Plane Surface(pscp_up_border3x) = {llcp_up_border3x};
llcp_up_border4ax = newreg; Line Loop(llcp_up_border4ax) = {-lcpt3bx, -lcpt27x, -lcpt19ax, lsqt1x};
pscp_up_border4ax = newreg; Plane Surface(pscp_up_border4ax) = {llcp_up_border4ax};
llcp_up_border4bx = newreg; Line Loop(llcp_up_border4bx) = {-lcpt3ax, lcpt28x, -lcpt19bx, -lsqt1x};
pscp_up_border4bx = newreg; Plane Surface(pscp_up_border4bx) = {llcp_up_border4bx};
llcp_up_border5x = newreg; Line Loop(llcp_up_border5x) = {-lcpt5x, -lue2_2x, -lcpt13x, lcpt22x};
pscp_up_border5x = newreg; Plane Surface(pscp_up_border5x) = {llcp_up_border5x};

llcp_low_rim1_2x = newreg; Line Loop(llcp_low_rim1_2x) = {-lle1_2x, cbh1_2x, lle3_2x, -cble1_2x};
rscp_low_rim1_2x = newreg; Surface(rscp_low_rim1_2x) = {llcp_low_rim1_2x};
llcp_low_rim2_2x = newreg; Line Loop(llcp_low_rim2_2x) = {lle2_2x, cbh2_2x, -lle3_2x, -cble2_2x};
rscp_low_rim2_2x = newreg; Surface(rscp_low_rim2_2x) = {llcp_low_rim2_2x};

llcp_low_rim_1x = newreg; Line Loop(llcp_low_rim_1x) = {lcpb29x, -cbh1_1x, -lcpb28x, cble1_1x};
rscp_low_rim_1x = newreg; Surface(rscp_low_rim_1x) = {llcp_low_rim_1x};
llcp_low_rim_3x = newreg; Line Loop(llcp_low_rim_3x) = {lcpb27x, cbh1_3x, -lcpb26x, -cble1_3x};
rscp_low_rim_3x = newreg; Surface(rscp_low_rim_3x) = {llcp_low_rim_3x};

llcp_low_border1x = newreg; Line Loop(llcp_low_border1x) = {lcpb26x, lcpb14x, -lcpb22x, lcpb4x};
pscp_low_border1x = newreg; Plane Surface(pscp_low_border1x) = {llcp_low_border1x};
llcp_low_border2x = newreg; Line Loop(llcp_low_border2x) = {lle1_2x, lcpb9x, -lcpb23x, lcpb1x};
pscp_low_border2x = newreg; Plane Surface(pscp_low_border2x) = {llcp_low_border2x};
llcp_low_border3x = newreg; Line Loop(llcp_low_border3x) = {lcpb2x, -lcpb29x, lcpb8x, lcpb23x};
pscp_low_border3x = newreg; Plane Surface(pscp_low_border3x) = {llcp_low_border3x};
llcp_low_border4ax = newreg; Line Loop(llcp_low_border4ax) = {lcpb19ax, lsqt3x, lcpb3bx, -lcpb27x};
pscp_low_border4ax = newreg; Plane Surface(pscp_low_border4ax) = {llcp_low_border4ax};
llcp_low_border4bx = newreg; Line Loop(llcp_low_border4bx) = {lcpb19bx, lcpb28x, lcpb3ax, -lsqt3x};
pscp_low_border4bx = newreg; Plane Surface(pscp_low_border4bx) = {llcp_low_border4bx};
llcp_low_border5x = newreg; Line Loop(llcp_low_border5x) = {lcpb5x, -lle2_2x, lcpb13x, lcpb22x};
pscp_low_border5x = newreg; Plane Surface(pscp_low_border5x) = {llcp_low_border5x};

llcp_face1x = newreg; Line Loop(llcp_face1x) = {lcpt2x, ctue1_1x, lcpt3ax, lcpt3bx, -1*ctue1_3x, lcpt4x, lcpt5x, -1*ctue2_2x, -1*ctue1_2x, lcpt1x};
pscp_face1x = newreg; Plane Surface(pscp_face1x) = {llcp_face1x};
llcp_face2x = newreg; Line Loop(llcp_face2x) = {-lcpb1x, -lcpb2x, -cble1_1x, -lcpb3ax, -lcpb3bx, cble1_3x, -lcpb4x, -lcpb5x, cble2_2x, cble1_2x};
pscp_face2x = newreg; Plane Surface(pscp_face2x) = {llcp_face2x};

// Dielectric surfaces
ll_up_dielectric_1x = newreg; Line Loop(ll_up_dielectric_1x) = {lconn3_1x, -cth1_1x, -lconn4_1x, cmh1_1x};
ps_up_dielectric_1x = newreg; Surface(ps_up_dielectric_1x) = {ll_up_dielectric_1x};
ll_low_dielectric_1x = newreg; Line Loop(ll_low_dielectric_1x) = {lconn1_1x, -cmh1_1x, -lconn2_1x, cbh1_1x};
ps_low_dielectric_1x = newreg; Surface(ps_low_dielectric_1x) = {ll_low_dielectric_1x};

ll_up_dielectric_2ax = newreg; Line Loop(ll_up_dielectric_2ax) = {lconn4_2x, cth1_2x, -lconn6_2x,-cmh1_2x};
ps_up_dielectric_2ax = newreg; Surface(ps_up_dielectric_2ax) = {ll_up_dielectric_2ax};
ll_up_dielectric_2bx = newreg; Line Loop(ll_up_dielectric_2bx) = {cth2_2x, -lconn5_2x, -cmh2_2x, lconn6_2x};
ps_up_dielectric_2bx = newreg; Surface(ps_up_dielectric_2bx) = {ll_up_dielectric_2bx};
ll_low_dielectric_2ax = newreg; Line Loop(ll_low_dielectric_2ax) = {lconn1_2x, cmh1_2x, -lconn3_2x, -cbh1_2x};
ps_low_dielectric_2ax = newreg; Surface(ps_low_dielectric_2ax) = {ll_low_dielectric_2ax};
ll_low_dielectric_2bx = newreg; Line Loop(ll_low_dielectric_2bx) = {lconn3_2x, cmh2_2x, -lconn2_2x, -cbh2_2x};
ps_low_dielectric_2bx = newreg; Surface(ps_low_dielectric_2bx) = {ll_low_dielectric_2bx};

ll_up_dielectric_3x = newreg; Line Loop(ll_up_dielectric_3x) = {lconn3_3x, -cth1_3x, -lconn4_3x, cmh1_3x};
ps_up_dielectric_3x = newreg; Surface(ps_up_dielectric_3x) = {ll_up_dielectric_3x};
ll_low_dielectric_3x = newreg; Line Loop(ll_low_dielectric_3x) = {lconn1_3x, -cmh1_3x, -lconn2_3x, cbh1_3x};
ps_low_dielectric_3x = newreg; Surface(ps_low_dielectric_3x) = {ll_low_dielectric_3x};

ll_side_dielectric1ax = newreg; Line Loop(ll_side_dielectric1ax) = {lcpt19bx, -lconn3_1x, -lconn1_1x, -lcpb19bx, -lsqt2x};
ps_side_dielectric1ax = newreg; Plane Surface(ps_side_dielectric1ax) = {ll_side_dielectric1ax};
ll_side_dielectric1cx = newreg; Line Loop(ll_side_dielectric1cx) = {lcpt19ax, lsqt2x, -lcpb19ax, lconn1_3x, lconn3_3x};
ps_side_dielectric1cx = newreg; Plane Surface(ps_side_dielectric1cx) = {ll_side_dielectric1cx};
ll_side_dielectric2ax = newreg; Line Loop(ll_side_dielectric2ax) = {lcpt14x, -lconn4_3x, -lconn2_3x, -lcpb14x, -lcpb31x};
ps_side_dielectric2ax = newreg; Plane Surface(ps_side_dielectric2ax) = {ll_side_dielectric2ax};

ll_side_dielectric3ax = newreg; Line Loop(ll_side_dielectric3ax) = {lcpt13x, lcpb31x, -lcpb13x, lconn2_2x, lconn5_2x};
ps_side_dielectric3ax = newreg; Plane Surface(ps_side_dielectric3ax) = {ll_side_dielectric3ax};
ll_side_dielectric4ax = newreg; Line Loop(ll_side_dielectric4ax) = {lcpt9x, -lconn4_2x, -lconn1_2x, -lcpb9x, -lcpb32x};
ps_side_dielectric4ax = newreg; Plane Surface(ps_side_dielectric4ax) = {ll_side_dielectric4ax};
ll_side_dielectric5ax = newreg; Line Loop(ll_side_dielectric5ax) = {lcpt8x, lcpb32x, -lcpb8x, lconn2_1x, lconn4_1x};
ps_side_dielectric5ax = newreg; Plane Surface(ps_side_dielectric5ax) = {ll_side_dielectric5ax};

ll_top_dielectricx = newreg; Line Loop(ll_top_dielectricx) = {lcpt9x, cth1_2x, cth2_2x, lcpt13x, lcpt14x, cth1_3x, lcpt19ax, lcpt19bx, -cth1_1x, lcpt8x};
ps_top_dielectricx = newreg; Plane Surface(ps_top_dielectricx) = {ll_top_dielectricx};
ll_bottom_dielectricx = newreg; Line Loop(ll_bottom_dielectricx) = {-lcpb19ax, -lcpb19bx, cbh1_1x, -lcpb8x, -lcpb9x, -cbh1_2x, -cbh2_2x, -lcpb13x, -lcpb14x, -cbh1_3x};
ps_bottom_dielectricx = newreg; Plane Surface(ps_bottom_dielectricx) = {ll_bottom_dielectricx};


//////////////// GEM 3 SURFACES

// Copper plate surfaces
llcp_up_rim1_2x_x = newreg; Line Loop(llcp_up_rim1_2x_x) = {-lue1_2x_x, -cth1_2x_x, lue3_2x_x, ctue1_2x_x};
rscp_up_rim1_2x_x = newreg; Surface(rscp_up_rim1_2x_x) = {llcp_up_rim1_2x_x};
llcp_up_rim2_2x_x = newreg; Line Loop(llcp_up_rim2_2x_x) = {lue2_2x_x, -1*cth2_2x_x, -1*lue3_2x_x, ctue2_2x_x};
rscp_up_rim2_2x_x = newreg; Surface(rscp_up_rim2_2x_x) = {llcp_up_rim2_2x_x};

llcp_up_rim_1x_x = newreg; Line Loop(llcp_up_rim_1x_x) = {lcpt29x_x, cth1_1x_x, -lcpt28x_x, -ctue1_1x_x};
rscp_up_rim_1x_x = newreg; Surface(rscp_up_rim_1x_x) = {llcp_up_rim_1x_x};
llcp_up_rim_3x_x = newreg; Line Loop(llcp_up_rim_3x_x) = {lcpt27x_x, -cth1_3x_x, -lcpt26x_x, ctue1_3x_x};
rscp_up_rim_3x_x = newreg; Surface(rscp_up_rim_3x_x) = {llcp_up_rim_3x_x};

llcp_up_border1x_x = newreg; Line Loop(llcp_up_border1x_x) = {lcpt26x_x, -lcpt14x_x, -lcpt22x_x, -lcpt4x_x};
pscp_up_border1x_x = newreg; Plane Surface(pscp_up_border1x_x) = {llcp_up_border1x_x};
llcp_up_border2x_x = newreg; Line Loop(llcp_up_border2x_x) = {lue1_2x_x, -lcpt9x_x, -lcpt23x_x, -lcpt1x_x};
pscp_up_border2x_x = newreg; Plane Surface(pscp_up_border2x_x) = {llcp_up_border2x_x};
llcp_up_border3x_x = newreg; Line Loop(llcp_up_border3x_x) = {-lcpt2x_x, -lcpt29x_x, -lcpt8x_x, lcpt23x_x};
pscp_up_border3x_x = newreg; Plane Surface(pscp_up_border3x_x) = {llcp_up_border3x_x};
llcp_up_border4ax_x = newreg; Line Loop(llcp_up_border4ax_x) = {-lcpt3bx_x, -lcpt27x_x, -lcpt19ax_x, lsqt1x_x};
pscp_up_border4ax_x = newreg; Plane Surface(pscp_up_border4ax_x) = {llcp_up_border4ax_x};
llcp_up_border4bx_x = newreg; Line Loop(llcp_up_border4bx_x) = {-lcpt3ax_x, lcpt28x_x, -lcpt19bx_x, -lsqt1x_x};
pscp_up_border4bx_x = newreg; Plane Surface(pscp_up_border4bx_x) = {llcp_up_border4bx_x};
llcp_up_border5x_x = newreg; Line Loop(llcp_up_border5x_x) = {-lcpt5x_x, -lue2_2x_x, -lcpt13x_x, lcpt22x_x};
pscp_up_border5x_x = newreg; Plane Surface(pscp_up_border5x_x) = {llcp_up_border5x_x};

llcp_low_rim1_2x_x = newreg; Line Loop(llcp_low_rim1_2x_x) = {-lle1_2x_x, cbh1_2x_x, lle3_2x_x, -cble1_2x_x};
rscp_low_rim1_2x_x = newreg; Surface(rscp_low_rim1_2x_x) = {llcp_low_rim1_2x_x};
llcp_low_rim2_2x_x = newreg; Line Loop(llcp_low_rim2_2x_x) = {lle2_2x_x, cbh2_2x_x, -lle3_2x_x, -cble2_2x_x};
rscp_low_rim2_2x_x = newreg; Surface(rscp_low_rim2_2x_x) = {llcp_low_rim2_2x_x};

llcp_low_rim_1x_x = newreg; Line Loop(llcp_low_rim_1x_x) = {lcpb29x_x, -cbh1_1x_x, -lcpb28x_x, cble1_1x_x};
rscp_low_rim_1x_x = newreg; Surface(rscp_low_rim_1x_x) = {llcp_low_rim_1x_x};
llcp_low_rim_3x_x = newreg; Line Loop(llcp_low_rim_3x_x) = {lcpb27x_x, cbh1_3x_x, -lcpb26x_x, -cble1_3x_x};
rscp_low_rim_3x_x = newreg; Surface(rscp_low_rim_3x_x) = {llcp_low_rim_3x_x};

llcp_low_border1x_x = newreg; Line Loop(llcp_low_border1x_x) = {lcpb26x_x, lcpb14x_x, -lcpb22x_x, lcpb4x_x};
pscp_low_border1x_x = newreg; Plane Surface(pscp_low_border1x_x) = {llcp_low_border1x_x};
llcp_low_border2x_x = newreg; Line Loop(llcp_low_border2x_x) = {lle1_2x_x, lcpb9x_x, -lcpb23x_x, lcpb1x_x};
pscp_low_border2x_x = newreg; Plane Surface(pscp_low_border2x_x) = {llcp_low_border2x_x};
llcp_low_border3x_x = newreg; Line Loop(llcp_low_border3x_x) = {lcpb2x_x, -lcpb29x_x, lcpb8x_x, lcpb23x_x};
pscp_low_border3x_x = newreg; Plane Surface(pscp_low_border3x_x) = {llcp_low_border3x_x};
llcp_low_border4ax_x = newreg; Line Loop(llcp_low_border4ax_x) = {lcpb19ax_x, lsqt3x_x, lcpb3bx_x, -lcpb27x_x};
pscp_low_border4ax_x = newreg; Plane Surface(pscp_low_border4ax_x) = {llcp_low_border4ax_x};
llcp_low_border4bx_x = newreg; Line Loop(llcp_low_border4bx_x) = {lcpb19bx_x, lcpb28x_x, lcpb3ax_x, -lsqt3x_x};
pscp_low_border4bx_x = newreg; Plane Surface(pscp_low_border4bx_x) = {llcp_low_border4bx_x};
llcp_low_border5x_x = newreg; Line Loop(llcp_low_border5x_x) = {lcpb5x_x, -lle2_2x_x, lcpb13x_x, lcpb22x_x};
pscp_low_border5x_x = newreg; Plane Surface(pscp_low_border5x_x) = {llcp_low_border5x_x};

llcp_face1x_x = newreg; Line Loop(llcp_face1x_x) = {lcpt2x_x, ctue1_1x_x, lcpt3ax_x, lcpt3bx_x, -1*ctue1_3x_x, lcpt4x_x, lcpt5x_x, -1*ctue2_2x_x, -1*ctue1_2x_x, lcpt1x_x};
pscp_face1x_x = newreg; Plane Surface(pscp_face1x_x) = {llcp_face1x_x};
llcp_face2x_x = newreg; Line Loop(llcp_face2x_x) = {-lcpb1x_x, -lcpb2x_x, -cble1_1x_x, -lcpb3ax_x, -lcpb3bx_x, cble1_3x_x, -lcpb4x_x, -lcpb5x_x, cble2_2x_x, cble1_2x_x};
pscp_face2x_x = newreg; Plane Surface(pscp_face2x_x) = {llcp_face2x_x};

// Dielectric surfaces
ll_up_dielectric_1x_x = newreg; Line Loop(ll_up_dielectric_1x_x) = {lconn3_1x_x, -cth1_1x_x, -lconn4_1x_x, cmh1_1x_x};
ps_up_dielectric_1x_x = newreg; Surface(ps_up_dielectric_1x_x) = {ll_up_dielectric_1x_x};
ll_low_dielectric_1x_x = newreg; Line Loop(ll_low_dielectric_1x_x) = {lconn1_1x_x, -cmh1_1x_x, -lconn2_1x_x, cbh1_1x_x};
ps_low_dielectric_1x_x = newreg; Surface(ps_low_dielectric_1x_x) = {ll_low_dielectric_1x_x};

ll_up_dielectric_2ax_x = newreg; Line Loop(ll_up_dielectric_2ax_x) = {lconn4_2x_x, cth1_2x_x, -lconn6_2x_x,-cmh1_2x_x};
ps_up_dielectric_2ax_x = newreg; Surface(ps_up_dielectric_2ax_x) = {ll_up_dielectric_2ax_x};
ll_up_dielectric_2bx_x = newreg; Line Loop(ll_up_dielectric_2bx_x) = {cth2_2x_x, -lconn5_2x_x, -cmh2_2x_x, lconn6_2x_x};
ps_up_dielectric_2bx_x = newreg; Surface(ps_up_dielectric_2bx_x) = {ll_up_dielectric_2bx_x};
ll_low_dielectric_2ax_x = newreg; Line Loop(ll_low_dielectric_2ax_x) = {lconn1_2x_x, cmh1_2x_x, -lconn3_2x_x, -cbh1_2x_x};
ps_low_dielectric_2ax_x = newreg; Surface(ps_low_dielectric_2ax_x) = {ll_low_dielectric_2ax_x};
ll_low_dielectric_2bx_x = newreg; Line Loop(ll_low_dielectric_2bx_x) = {lconn3_2x_x, cmh2_2x_x, -lconn2_2x_x, -cbh2_2x_x};
ps_low_dielectric_2bx_x = newreg; Surface(ps_low_dielectric_2bx_x) = {ll_low_dielectric_2bx_x};

ll_up_dielectric_3x_x = newreg; Line Loop(ll_up_dielectric_3x_x) = {lconn3_3x_x, -cth1_3x_x, -lconn4_3x_x, cmh1_3x_x};
ps_up_dielectric_3x_x = newreg; Surface(ps_up_dielectric_3x_x) = {ll_up_dielectric_3x_x};
ll_low_dielectric_3x_x = newreg; Line Loop(ll_low_dielectric_3x_x) = {lconn1_3x_x, -cmh1_3x_x, -lconn2_3x_x, cbh1_3x_x};
ps_low_dielectric_3x_x = newreg; Surface(ps_low_dielectric_3x_x) = {ll_low_dielectric_3x_x};

ll_side_dielectric1ax_x = newreg; Line Loop(ll_side_dielectric1ax_x) = {lcpt19bx_x, -lconn3_1x_x, -lconn1_1x_x, -lcpb19bx_x, -lsqt2x_x};
ps_side_dielectric1ax_x = newreg; Plane Surface(ps_side_dielectric1ax_x) = {ll_side_dielectric1ax_x};
ll_side_dielectric1cx_x = newreg; Line Loop(ll_side_dielectric1cx_x) = {lcpt19ax_x, lsqt2x_x, -lcpb19ax_x, lconn1_3x_x, lconn3_3x_x};
ps_side_dielectric1cx_x = newreg; Plane Surface(ps_side_dielectric1cx_x) = {ll_side_dielectric1cx_x};
ll_side_dielectric2ax_x = newreg; Line Loop(ll_side_dielectric2ax_x) = {lcpt14x_x, -lconn4_3x_x, -lconn2_3x_x, -lcpb14x_x, -lcpb31x_x};
ps_side_dielectric2ax_x = newreg; Plane Surface(ps_side_dielectric2ax_x) = {ll_side_dielectric2ax_x};

ll_side_dielectric3ax_x = newreg; Line Loop(ll_side_dielectric3ax_x) = {lcpt13x_x, lcpb31x_x, -lcpb13x_x, lconn2_2x_x, lconn5_2x_x};
ps_side_dielectric3ax_x = newreg; Plane Surface(ps_side_dielectric3ax_x) = {ll_side_dielectric3ax_x};
ll_side_dielectric4ax_x = newreg; Line Loop(ll_side_dielectric4ax_x) = {lcpt9x_x, -lconn4_2x_x, -lconn1_2x_x, -lcpb9x_x, -lcpb32x_x};
ps_side_dielectric4ax_x = newreg; Plane Surface(ps_side_dielectric4ax_x) = {ll_side_dielectric4ax_x};
ll_side_dielectric5ax_x = newreg; Line Loop(ll_side_dielectric5ax_x) = {lcpt8x_x, lcpb32x_x, -lcpb8x_x, lconn2_1x_x, lconn4_1x_x};
ps_side_dielectric5ax_x = newreg; Plane Surface(ps_side_dielectric5ax_x) = {ll_side_dielectric5ax_x};

ll_top_dielectricx_x = newreg; Line Loop(ll_top_dielectricx_x) = {lcpt9x_x, cth1_2x_x, cth2_2x_x, lcpt13x_x, lcpt14x_x, cth1_3x_x, lcpt19ax_x, lcpt19bx_x, -cth1_1x_x, lcpt8x_x};
ps_top_dielectricx_x = newreg; Plane Surface(ps_top_dielectricx_x) = {ll_top_dielectricx_x};
ll_bottom_dielectricx_x = newreg; Line Loop(ll_bottom_dielectricx_x) = {-lcpb19ax_x, -lcpb19bx_x, cbh1_1x_x, -lcpb8x_x, -lcpb9x_x, -cbh1_2x_x, -cbh2_2x_x, -lcpb13x_x, -lcpb14x_x, -cbh1_3x_x};
ps_bottom_dielectricx_x = newreg; Plane Surface(ps_bottom_dielectricx_x) = {ll_bottom_dielectricx_x};



// Bounding surfaces
ll_bsurf1 = newreg; Line Loop(ll_bsurf1) = {lcpt17, -lconn3_3, -lconn1_3, -lcpb17, -lcpb33};
ps_bsurf1 = newreg; Plane Surface(ps_bsurf1) = {ll_bsurf1}; 
ll_bsurf2 = newreg; Line Loop(ll_bsurf2) = {lcpb33, -lcpb16, lconn2_3, lconn4_3, lcpt16};
ps_bsurf2 = newreg; Plane Surface(ps_bsurf2) = {ll_bsurf2};
ll_bsurf3a = newreg; Line Loop(ll_bsurf3a) = {lconn4_2, lcpt11a, lshalf2, -lcpb11a, lconn1_2};
ps_bsurf3a = newreg; Plane Surface(ps_bsurf3a) = {ll_bsurf3a};
ll_bsurf3b = newreg; Line Loop(ll_bsurf3b) = {lcpt11b, -lconn5_2, -lconn2_2, -lcpb11b, -lshalf2};
ps_bsurf3b = newreg; Plane Surface(ps_bsurf3b) = {ll_bsurf3b};
ll_bsurf4 = newreg; Line Loop(ll_bsurf4) = {lcpt6, -lconn4_1, -lconn2_1, -lcpb6, -lcpb30};
ps_bsurf4 = newreg; Plane Surface(ps_bsurf4) = {ll_bsurf4};
ll_bsurf5 = newreg; Line Loop(ll_bsurf5) = {lcpt21, lcpb30, -lcpb21, lconn1_1, lconn3_1};
ps_bsurf5 = newreg; Plane Surface(ps_bsurf5) = {ll_bsurf5};
ll_bsurf6a = newreg; Line Loop(ll_bsurf6a) = {-lexet1, -lexetc2, -lshalf1, -lcpt11b, lue2_2, lcpt5, lexetc1};
ps_bsurf6a = newreg; Plane Surface(ps_bsurf6a) = {ll_bsurf6a};
ll_bsurf6b = newreg; Line Loop(ll_bsurf6b) = {-lexet2, -lexetc3, lcpt1, -lue1_2, -lcpt11a, lshalf1, lexetc2};
ps_bsurf6b = newreg; Plane Surface(ps_bsurf6b) = {ll_bsurf6b};
ll_bsurf7a = newreg; Line Loop(ll_bsurf7a) = {-lexet5, -lexetc6, -lcpt25, -lcpt17, lcpt27, lcpt3b, lexetc5};
ps_bsurf7a = newreg; Plane Surface(ps_bsurf7a) = {ll_bsurf7a};
ll_bsurf7b = newreg; Line Loop(ll_bsurf7b) = {-lexet4, lexetc4, lcpt24, -lcpt21, -lcpt28, lcpt3a, -lexetc5};
ps_bsurf7b = newreg; Plane Surface(ps_bsurf7b) = {ll_bsurf7b};
ll_bsurf8 = newreg; Line Loop(ll_bsurf8) = {-lexetc4, -lcpt24, -lcpt6, lcpt29, lcpt2, lexetc3, -lexet3};
ps_bsurf8 = newreg; Plane Surface(ps_bsurf8) = {ll_bsurf8};
ll_bsurf9 = newreg; Line Loop(ll_bsurf9) = {lexet1, lexet2, lexet3, lexet4, lexet5, lexet6};
ps_bsurf9 = newreg; Plane Surface(ps_bsurf9) = {ll_bsurf9};

ll_bsurf10x = newreg; Line Loop(ll_bsurf10x) = {-lexebc6, lcpb25x_x, lcpb16x_x, -lcpb26x_x, -lcpb4x_x, lexebc1, lexeb6};
ps_bsurf10x = newreg; Plane Surface(ps_bsurf10x) = {ll_bsurf10x}; 
ll_bsurf11ax = newreg; Line Loop(ll_bsurf11ax) = {-lexebc5, -lcpb3bx_x, lcpb27x_x, lcpb17x_x, -lcpb25x_x, lexebc6, lexeb5};
ps_bsurf11ax = newreg; Plane Surface(ps_bsurf11ax) = {ll_bsurf11ax};
ll_bsurf11bx = newreg; Line Loop(ll_bsurf11bx) = {lexebc5, -lcpb3ax_x, -lcpb28x_x, lcpb21x_x, lcpb24x_x, -lexebc4, lexeb4};
ps_bsurf11bx = newreg; Plane Surface(ps_bsurf11bx) = {ll_bsurf11bx};
ll_bsurf12x = newreg; Line Loop(ll_bsurf12x) = {-lexebc3, -lcpb2x_x, lcpb29x_x, lcpb6x_x, -lcpb24x_x, lexebc4, lexeb3};
ps_bsurf12x = newreg; Plane Surface(ps_bsurf12x) = {ll_bsurf12x};
ll_bsurf13ax = newreg; Line Loop(ll_bsurf13ax) = {lexeb1, lexebc2, -lshalf3x_x, lcpb11bx_x, lle2_2x_x, -lcpb5x_x, -lexebc1};
ps_bsurf13ax = newreg; Plane Surface(ps_bsurf13ax) = {ll_bsurf13ax};
ll_bsurf13bx = newreg; Line Loop(ll_bsurf13bx) = {lexeb2, lexebc3, -lcpb1x_x, -lle1_2x_x, lcpb11ax_x, lshalf3x_x, -lexebc2};
ps_bsurf13bx = newreg; Plane Surface(ps_bsurf13bx) = {ll_bsurf13bx};
ll_bsurf14x = newreg; Line Loop(ll_bsurf14x) = {-lexeb1, -lexeb2, -lexeb3, -lexeb4, -lexeb5, -lexeb6};
ps_bsurf14x = newreg; Plane Surface(ps_bsurf14x) = {ll_bsurf14x};

ll_bsurf15 = newreg; Line Loop(ll_bsurf15) = {lexetc6, lcpt25, -lcpt16, -lcpt26, lcpt4, -lexetc1, -lexet6};
ps_bsurf15 = newreg; Plane Surface(ps_bsurf15) = {ll_bsurf15};


// NEWLY DEFINED BOUNDARY SURFACES FOR THE DOUBLE GEM
ll_bsurf1x = newreg; Line Loop(ll_bsurf1x) = {lcpt17x, -lconn3_3x, -lconn1_3x, -lcpb17x, -lcpb33x};
ps_bsurf1x = newreg; Plane Surface(ps_bsurf1x) = {ll_bsurf1x}; 
ll_bsurf2x = newreg; Line Loop(ll_bsurf2x) = {lcpb33x, -lcpb16x, lconn2_3x, lconn4_3x, lcpt16x};
ps_bsurf2x = newreg; Plane Surface(ps_bsurf2x) = {ll_bsurf2x};
ll_bsurf3ax = newreg; Line Loop(ll_bsurf3ax) = {lconn4_2x, lcpt11ax, lshalf2x, -lcpb11ax, lconn1_2x};
ps_bsurf3ax = newreg; Plane Surface(ps_bsurf3ax) = {ll_bsurf3ax};
ll_bsurf3bx = newreg; Line Loop(ll_bsurf3bx) = {lcpt11bx, -lconn5_2x, -lconn2_2x, -lcpb11bx, -lshalf2x};
ps_bsurf3bx = newreg; Plane Surface(ps_bsurf3bx) = {ll_bsurf3bx};
ll_bsurf4x = newreg; Line Loop(ll_bsurf4x) = {lcpt6x, -lconn4_1x, -lconn2_1x, -lcpb6x, -lcpb30x};
ps_bsurf4x = newreg; Plane Surface(ps_bsurf4x) = {ll_bsurf4x};
ll_bsurf5x = newreg; Line Loop(ll_bsurf5x) = {lcpt21x, lcpb30x, -lcpb21x, lconn1_1x, lconn3_1x};
ps_bsurf5x = newreg; Plane Surface(ps_bsurf5x) = {ll_bsurf5x};

ll_bsurf15x = newreg; Line Loop(ll_bsurf15x) = {-lcpb3a, -lcpb28, lcpb21, lcpb24, ltreg1vx, lcpt24x, -lcpt21x, -lcpt28x, lcpt3ax, -ltreg2vx};
ps_bsurf15x = newreg; Plane Surface(ps_bsurf15x) = {ll_bsurf15x};
ll_bsurf16x = newreg; Line Loop(ll_bsurf16x) = {-lcpb25, lcpb17, lcpb27, -lcpb3b, ltreg2vx, lcpt3bx, lcpt27x, -lcpt17x, -lcpt25x, -ltreg3vx};
ps_bsurf16x = newreg; Plane Surface(ps_bsurf16x) = {ll_bsurf16x};
ll_bsurf17x = newreg; Line Loop(ll_bsurf17x) = {lcpt25x, -lcpt16x, -lcpt26x, lcpt4x, -ltreg4vx, -lcpb4, -lcpb26, lcpb16, lcpb25, ltreg3vx};
ps_bsurf17x = newreg; Plane Surface(ps_bsurf17x) = {ll_bsurf17x};
ll_bsurf18x = newreg; Line Loop(ll_bsurf18x) = {lcpt5x, lue2_2x, -lcpt11bx, -lshalf1x, -ltreg5vx, -lshalf3, lcpb11b, lle2_2, -lcpb5, ltreg4vx};
ps_bsurf18x = newreg; Plane Surface(ps_bsurf18x) = {ll_bsurf18x};
ll_bsurf19x = newreg; Line Loop(ll_bsurf19x) = {lshalf1x, -lcpt11ax, -lue1_2x, lcpt1x, -ltreg6vx, -lcpb1, -lle1_2, lcpb11a, lshalf3, ltreg5vx};
ps_bsurf19x = newreg; Plane Surface(ps_bsurf19x) = {ll_bsurf19x};
ll_bsurf20x = newreg; Line Loop(ll_bsurf20x) = {-lcpt6x, -lcpt24x, -ltreg1vx, -lcpb24, lcpb6, lcpb29, -lcpb2, ltreg6vx, lcpt2x, lcpt29x};
ps_bsurf20x = newreg; Plane Surface(ps_bsurf20x) = {ll_bsurf20x};


// NEWLY DEFINED BOUNDARY SURFACES FOR THE TRIPLE GEM
ll_bsurf1x_x = newreg; Line Loop(ll_bsurf1x_x) = {lcpt17x_x, -lconn3_3x_x, -lconn1_3x_x, -lcpb17x_x, -lcpb33x_x};
ps_bsurf1x_x = newreg; Plane Surface(ps_bsurf1x_x) = {ll_bsurf1x_x}; 
ll_bsurf2x_x = newreg; Line Loop(ll_bsurf2x_x) = {lcpb33x_x, -lcpb16x_x, lconn2_3x_x, lconn4_3x_x, lcpt16x_x};
ps_bsurf2x_x = newreg; Plane Surface(ps_bsurf2x_x) = {ll_bsurf2x_x};
ll_bsurf3ax_x = newreg; Line Loop(ll_bsurf3ax_x) = {lconn4_2x_x, lcpt11ax_x, lshalf2x_x, -lcpb11ax_x, lconn1_2x_x};
ps_bsurf3ax_x = newreg; Plane Surface(ps_bsurf3ax_x) = {ll_bsurf3ax_x};
ll_bsurf3bx_x = newreg; Line Loop(ll_bsurf3bx_x) = {lcpt11bx_x, -lconn5_2x_x, -lconn2_2x_x, -lcpb11bx_x, -lshalf2x_x};
ps_bsurf3bx_x = newreg; Plane Surface(ps_bsurf3bx_x) = {ll_bsurf3bx_x};
ll_bsurf4x_x = newreg; Line Loop(ll_bsurf4x_x) = {lcpt6x_x, -lconn4_1x_x, -lconn2_1x_x, -lcpb6x_x, -lcpb30x_x};
ps_bsurf4x_x = newreg; Plane Surface(ps_bsurf4x_x) = {ll_bsurf4x_x};
ll_bsurf5x_x = newreg; Line Loop(ll_bsurf5x_x) = {lcpt21x_x, lcpb30x_x, -lcpb21x_x, lconn1_1x_x, lconn3_1x_x};
ps_bsurf5x_x = newreg; Plane Surface(ps_bsurf5x_x) = {ll_bsurf5x_x};

ll_bsurf15x_x = newreg; Line Loop(ll_bsurf15x_x) = {-lcpb3ax, -lcpb28x, lcpb21x, lcpb24x, ltreg1vx_x, lcpt24x_x, -lcpt21x_x, -lcpt28x_x, lcpt3ax_x, -ltreg2vx_x};
ps_bsurf15x_x = newreg; Plane Surface(ps_bsurf15x_x) = {ll_bsurf15x_x};
ll_bsurf16x_x = newreg; Line Loop(ll_bsurf16x_x) = {-lcpb25x, lcpb17x, lcpb27x, -lcpb3bx, ltreg2vx_x, lcpt3bx_x, lcpt27x_x, -lcpt17x_x, -lcpt25x_x, -ltreg3vx_x};
ps_bsurf16x_x = newreg; Plane Surface(ps_bsurf16x_x) = {ll_bsurf16x_x};
ll_bsurf17x_x = newreg; Line Loop(ll_bsurf17x_x) = {lcpt25x_x, -lcpt16x_x, -lcpt26x_x, lcpt4x_x, -ltreg4vx_x, -lcpb4x, -lcpb26x, lcpb16x, lcpb25x, ltreg3vx_x};
ps_bsurf17x_x = newreg; Plane Surface(ps_bsurf17x_x) = {ll_bsurf17x_x};
ll_bsurf18x_x = newreg; Line Loop(ll_bsurf18x_x) = {lcpt5x_x, lue2_2x_x, -lcpt11bx_x, -lshalf1x_x, -ltreg5vx_x, -lshalf3x, lcpb11bx, lle2_2x, -lcpb5x, ltreg4vx_x};
ps_bsurf18x_x = newreg; Plane Surface(ps_bsurf18x_x) = {ll_bsurf18x_x};
ll_bsurf19x_x = newreg; Line Loop(ll_bsurf19x_x) = {lshalf1x_x, -lcpt11ax_x, -lue1_2x_x, lcpt1x_x, -ltreg6vx_x, -lcpb1x, -lle1_2x, lcpb11ax, lshalf3x, ltreg5vx_x};
ps_bsurf19x_x = newreg; Plane Surface(ps_bsurf19x_x) = {ll_bsurf19x_x};
ll_bsurf20x_x = newreg; Line Loop(ll_bsurf20x_x) = {-lcpt6x_x, -lcpt24x_x, -ltreg1vx_x, -lcpb24x, lcpb6x, lcpb29x, -lcpb2x, ltreg6vx_x, lcpt2x_x, lcpt29x_x};
ps_bsurf20x_x = newreg; Plane Surface(ps_bsurf20x_x) = {ll_bsurf20x_x};


// Volumes 
// 1st GEM
sl_dielectric = newreg; Surface Loop(sl_dielectric) = {ps_top_dielectric, ps_bottom_dielectric, ps_side_dielectric1a, ps_side_dielectric1c, ps_up_dielectric_1, ps_up_dielectric_3, ps_low_dielectric_1, ps_low_dielectric_3, ps_side_dielectric2a, ps_side_dielectric3a, ps_side_dielectric4a, ps_side_dielectric5a, ps_up_dielectric_2a, ps_up_dielectric_2b, ps_low_dielectric_2a, ps_low_dielectric_2b};
vol_dielectric = newreg; Volume(vol_dielectric) = {sl_dielectric};

sl_upper_cp = newreg; Surface Loop(sl_upper_cp) = {pscp_face1, rscp_up_rim_1, rscp_up_rim_3, rscp_up_rim2_2, rscp_up_rim1_2, ps_top_dielectric, pscp_up_border4a, pscp_up_border4b, pscp_up_border3, pscp_up_border2, pscp_up_border5, pscp_up_border1}; vol_upper_cp = newreg; Volume(vol_upper_cp) = {sl_upper_cp}; 

sl_lower_cp = newreg; Surface Loop(sl_lower_cp) = {pscp_face2, ps_bottom_dielectric, rscp_low_rim_1, rscp_low_rim_3, rscp_low_rim2_2, rscp_low_rim1_2, pscp_low_border3, pscp_low_border2, pscp_low_border4a, pscp_low_border4b, pscp_low_border1, pscp_low_border5}; vol_lower_cp = newreg; Volume(vol_lower_cp) = {sl_lower_cp};


// 2nd GEM
sl_dielectricx = newreg; Surface Loop(sl_dielectricx) = {ps_top_dielectricx, ps_bottom_dielectricx, ps_side_dielectric1ax, ps_side_dielectric1cx, ps_up_dielectric_1x, ps_up_dielectric_3x, ps_low_dielectric_1x, ps_low_dielectric_3x, ps_side_dielectric2ax, ps_side_dielectric3ax, ps_side_dielectric4ax, ps_side_dielectric5ax, ps_up_dielectric_2ax, ps_up_dielectric_2bx, ps_low_dielectric_2ax, ps_low_dielectric_2bx};
vol_dielectricx = newreg; Volume(vol_dielectricx) = {sl_dielectricx};

sl_upper_cpx = newreg; Surface Loop(sl_upper_cpx) = {pscp_face1x, rscp_up_rim_1x, rscp_up_rim_3x, rscp_up_rim2_2x, rscp_up_rim1_2x, ps_top_dielectricx, pscp_up_border4ax, pscp_up_border4bx, pscp_up_border3x, pscp_up_border2x, pscp_up_border5x, pscp_up_border1x}; 
vol_upper_cpx = newreg; Volume(vol_upper_cpx) = {sl_upper_cpx}; 

sl_lower_cpx = newreg; Surface Loop(sl_lower_cpx) = {pscp_face2x, ps_bottom_dielectricx, rscp_low_rim_1x, rscp_low_rim_3x, rscp_low_rim2_2x, rscp_low_rim1_2x, pscp_low_border3x, pscp_low_border2x, pscp_low_border4ax, pscp_low_border4bx, pscp_low_border1x, pscp_low_border5x}; 
vol_lower_cpx = newreg; Volume(vol_lower_cpx) = {sl_lower_cpx};


// 3rd GEM
sl_dielectricx_x = newreg; Surface Loop(sl_dielectricx_x) = {ps_top_dielectricx_x, ps_bottom_dielectricx_x, ps_side_dielectric1ax_x, ps_side_dielectric1cx_x, ps_up_dielectric_1x_x, ps_up_dielectric_3x_x, ps_low_dielectric_1x_x, ps_low_dielectric_3x_x, ps_side_dielectric2ax_x, ps_side_dielectric3ax_x, ps_side_dielectric4ax_x, ps_side_dielectric5ax_x, ps_up_dielectric_2ax_x, ps_up_dielectric_2bx_x, ps_low_dielectric_2ax_x, ps_low_dielectric_2bx_x};
vol_dielectricx_x = newreg; Volume(vol_dielectricx_x) = {sl_dielectricx_x};

sl_upper_cpx_x = newreg; Surface Loop(sl_upper_cpx_x) = {pscp_face1x_x, rscp_up_rim_1x_x, rscp_up_rim_3x_x, rscp_up_rim2_2x_x, rscp_up_rim1_2x_x, ps_top_dielectricx_x, pscp_up_border4ax_x, pscp_up_border4bx_x, pscp_up_border3x_x, pscp_up_border2x_x, pscp_up_border5x_x, pscp_up_border1x_x}; 
vol_upper_cpx_x = newreg; Volume(vol_upper_cpx_x) = {sl_upper_cpx_x}; 

sl_lower_cpx_x = newreg; Surface Loop(sl_lower_cpx_x) = {pscp_face2x_x, ps_bottom_dielectricx_x, rscp_low_rim_1x_x, rscp_low_rim_3x_x, rscp_low_rim2_2x_x, rscp_low_rim1_2x_x, pscp_low_border3x_x, pscp_low_border2x_x, pscp_low_border4ax_x, pscp_low_border4bx_x, pscp_low_border1x_x, pscp_low_border5x_x}; 
vol_lower_cpx_x = newreg; Volume(vol_lower_cpx_x) = {sl_lower_cpx_x};

sl_gas = newreg; Surface Loop(sl_gas) = {ps_bsurf9, ps_bsurf6a, ps_bsurf6b, ps_bsurf15, ps_bsurf7a, ps_bsurf7b, ps_bsurf8, ps_bsurf4, ps_bsurf12x, ps_bsurf14x, ps_bsurf11ax, ps_bsurf11bx, ps_bsurf5, ps_bsurf1, ps_bsurf2, ps_bsurf10x, ps_bsurf13ax, ps_bsurf13bx, ps_bsurf3a, ps_bsurf3b, ps_bsurf1x, ps_bsurf2x, ps_bsurf3ax, ps_bsurf3bx, ps_bsurf4x, ps_bsurf5x, ps_bsurf15x, ps_bsurf16x, ps_bsurf17x, ps_bsurf18x, ps_bsurf19x, ps_bsurf20x, ps_bsurf1x_x, ps_bsurf2x_x, ps_bsurf3ax_x, ps_bsurf3bx_x, ps_bsurf4x_x, ps_bsurf5x_x, ps_bsurf15x_x, ps_bsurf16x_x, ps_bsurf17x_x, ps_bsurf18x_x, ps_bsurf19x_x, ps_bsurf20x_x, -rscp_low_rim2_2, -rscp_low_rim_1, -rscp_low_rim_3, -rscp_low_rim1_2, -rscp_up_rim2_2, -rscp_up_rim1_2, -pscp_face1, -pscp_face2, -rscp_up_rim_1, -ps_up_dielectric_3, -ps_low_dielectric_3, -rscp_up_rim_3, -ps_up_dielectric_1, -ps_low_dielectric_1, ps_up_dielectric_2a, ps_up_dielectric_2b, ps_low_dielectric_2a, ps_low_dielectric_2b, -rscp_low_rim2_2x, -rscp_low_rim_1x, -rscp_low_rim_3x, -rscp_low_rim1_2x, -rscp_up_rim2_2x, -rscp_up_rim1_2x, -pscp_face1x, -pscp_face2x, -rscp_up_rim_1x, -ps_up_dielectric_3x, -ps_low_dielectric_3x, -rscp_up_rim_3x, -ps_up_dielectric_1x, -ps_low_dielectric_1x, ps_up_dielectric_2ax, ps_up_dielectric_2bx, ps_low_dielectric_2ax, ps_low_dielectric_2bx, -rscp_low_rim2_2x_x, -rscp_low_rim_1x_x, -rscp_low_rim_3x_x, -rscp_low_rim1_2x_x, -rscp_up_rim2_2x_x, -rscp_up_rim1_2x_x, -pscp_face1x_x, -pscp_face2x_x, -rscp_up_rim_1x_x, -ps_up_dielectric_3x_x, -ps_low_dielectric_3x_x, -rscp_up_rim_3x_x, -ps_up_dielectric_1x_x, -ps_low_dielectric_1x_x, ps_up_dielectric_2ax_x, ps_up_dielectric_2bx_x, ps_low_dielectric_2ax_x, ps_low_dielectric_2bx_x}; 
vol_gas = newreg; Volume(vol_gas) = {sl_gas}; 


// Physical surfaces

// Surfaces to which voltages will be applied
// 1st GEM
physsurf_upper_cp = newreg; Physical Surface(physsurf_upper_cp) = {pscp_face1, rscp_up_rim_1, rscp_up_rim_3, rscp_up_rim2_2, rscp_up_rim1_2, ps_top_dielectric, pscp_up_border4a, pscp_up_border4b, pscp_up_border3, pscp_up_border2, pscp_up_border5, pscp_up_border1};
physsurf_lower_cp = newreg; Physical Surface(physsurf_lower_cp) = {pscp_face2, ps_bottom_dielectric, rscp_low_rim_1, rscp_low_rim_3, rscp_low_rim2_2, rscp_low_rim1_2, pscp_low_border3, pscp_low_border2, pscp_low_border4a, pscp_low_border4b, pscp_low_border1, pscp_low_border5};

// THE OTHER STUFF
physsurf_upper_el = newreg; Physical Surface(physsurf_upper_el) = {ps_bsurf9};
physsurf_lower_el = newreg; Physical Surface(physsurf_lower_el) = {ps_bsurf14x};

// Surfaces for periodic boundary conditions
physsurf_bd1h1 = newreg; Physical Surface(physsurf_bd1h1) = {ps_bsurf5, ps_bsurf7b, ps_side_dielectric1a, ps_bsurf11bx, ps_bsurf15x, ps_bsurf5x, ps_side_dielectric1ax, ps_bsurf15x_x, ps_bsurf5x_x, ps_side_dielectric1ax_x};
physsurf_bd1h2 = newreg; Physical Surface(physsurf_bd1h2) = {ps_side_dielectric3a, ps_bsurf6a, ps_bsurf13ax, ps_bsurf3b, ps_side_dielectric3ax, ps_bsurf3bx, ps_bsurf18x, ps_side_dielectric3ax_x, ps_bsurf3bx_x, ps_bsurf18x_x};

physsurf_bd2h3 = newreg; Physical Surface(physsurf_bd2h3) = {ps_bsurf1, ps_bsurf7a, ps_side_dielectric1c, ps_bsurf11ax, ps_side_dielectric1cx, ps_bsurf1x, ps_bsurf16x, ps_side_dielectric1cx_x, ps_bsurf1x_x, ps_bsurf16x_x};
physsurf_bd2h2 = newreg; Physical Surface(physsurf_bd2h2) = {ps_side_dielectric4a, ps_bsurf6b, ps_bsurf13bx, ps_bsurf3a, ps_side_dielectric4ax, ps_bsurf3ax, ps_bsurf19x, ps_side_dielectric4ax_x, ps_bsurf3ax_x, ps_bsurf19x_x};

physsurf_bd3h1 = newreg; Physical Surface(physsurf_bd3h1) = {ps_bsurf8, ps_side_dielectric5a, ps_bsurf4, ps_bsurf12x, ps_side_dielectric5ax, ps_bsurf4x, ps_bsurf20x, ps_side_dielectric5ax_x, ps_bsurf4x_x, ps_bsurf20x_x};
physsurf_bd3h3 = newreg; Physical Surface(physsurf_bd3h3) = {ps_bsurf15, ps_side_dielectric2a, ps_bsurf2, ps_bsurf10x, ps_side_dielectric2ax, ps_bsurf2x, ps_bsurf17x, ps_side_dielectric2ax_x, ps_bsurf2x_x, ps_bsurf17x_x};

// SURFACES OF THE 2ND GEM TO WHICH VOLTAGES WILL BE APPLIED
physsurf_upper_cpx = newreg; Physical Surface(physsurf_upper_cpx) = {pscp_face1x, rscp_up_rim_1x, rscp_up_rim_3x, rscp_up_rim2_2x, rscp_up_rim1_2x, ps_top_dielectricx, pscp_up_border4ax, pscp_up_border4bx, pscp_up_border3x, pscp_up_border2x, pscp_up_border5x, pscp_up_border1x};
physsurf_lower_cpx = newreg; Physical Surface(physsurf_lower_cpx) = {pscp_face2x, ps_bottom_dielectricx, rscp_low_rim_1x, rscp_low_rim_3x, rscp_low_rim2_2x, rscp_low_rim1_2x, pscp_low_border3x, pscp_low_border2x, pscp_low_border4ax, pscp_low_border4bx, pscp_low_border1x, pscp_low_border5x};

// SURFACES OF THE 3RD GEM TO WHICH VOLTAGES WILL BE APPLIED
physsurf_upper_cpx_x = newreg; Physical Surface(physsurf_upper_cpx_x) = {pscp_face1x_x, rscp_up_rim_1x_x, rscp_up_rim_3x_x, rscp_up_rim2_2x_x, rscp_up_rim1_2x_x, ps_top_dielectricx_x, pscp_up_border4ax_x, pscp_up_border4bx_x, pscp_up_border3x_x, pscp_up_border2x_x, pscp_up_border5x_x, pscp_up_border1x_x};
physsurf_lower_cpx_x = newreg; Physical Surface(physsurf_lower_cpx_x) = {pscp_face2x_x, ps_bottom_dielectricx_x, rscp_low_rim_1x_x, rscp_low_rim_3x_x, rscp_low_rim2_2x_x, rscp_low_rim1_2x_x, pscp_low_border3x_x, pscp_low_border2x_x, pscp_low_border4ax_x, pscp_low_border4bx_x, pscp_low_border1x_x, pscp_low_border5x_x};

// Physical volumes
physvol_gas = newreg; Physical Volume(physvol_gas) = {vol_gas};
physvol_dielectric = newreg; Physical Volume(physvol_dielectric) = {vol_dielectric};
physvol_upper_cp = newreg; Physical Volume(physvol_upper_cp) = {vol_upper_cp};
physvol_lower_cp = newreg; Physical Volume(physvol_lower_cp) = {vol_lower_cp};
physvol_dielectricx = newreg; Physical Volume(physvol_dielectricx) = {vol_dielectricx};
physvol_upper_cpx = newreg; Physical Volume(physvol_upper_cpx) = {vol_upper_cpx};
physvol_lower_cpx = newreg; Physical Volume(physvol_lower_cpx) = {vol_lower_cpx};
physvol_dielectricx_x = newreg; Physical Volume(physvol_dielectricx_x) = {vol_dielectricx_x};
physvol_upper_cpx_x = newreg; Physical Volume(physvol_upper_cpx_x) = {vol_upper_cpx_x};
physvol_lower_cpx_x = newreg; Physical Volume(physvol_lower_cpx_x) = {vol_lower_cpx_x};
