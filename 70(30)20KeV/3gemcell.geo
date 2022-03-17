// *********************************************************************
// 3gemcell.geo
//
// Description:
// Geometry file for a TRIPLE GEM cell.
// This file use as template the gemcell example found in http://garfieldpp.web.cern.ch/garfieldpp/
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
// *********************************************************************

// Parameters
r0 = 0.0035;     // the hole radius
r1 = 0.0003;     // the etching amount (etch radius = r0 + r1)
r11 = 0.0025;
tC = 0.0005;     // copper thickness
tD = 0.005;     // dielectric thickness
lE = 0.3;   // distance from GEM plates to upper exterior electrode
lG = 0.2;    // distance between GEM's
lP = 0.2;     // distance from lower LEM plate to pad (readout) plane
a = 0.014;     // the "pitch", or distance between GEM holes

// Characteristic lengths
lcDielectricHole = 0.00025;
lcEtchingHole = 0.00025;
lcCopperPlateBdry = 0.0005;
lcExtElectrodeBdry = 0.003;
lcGEMHole = 0.0005;

// ------------------------------------------------------------
// Hole 1 (quarter hole)
// ------------------------------------------------------------

// *******************************
// Center
// *******************************
pc1_1 = newp; Point(pc1_1) = {0, 0, tD/2,lcGEMHole};
pc1_12 = newp; Point(pc1_12) = {0, 0, 0,lcGEMHole};
pc2_1 = newp; Point(pc2_1) = {0, 0, -1*tD/2,lcGEMHole};
pc3_1 = newp; Point(pc3_1) = {0, 0, (2*tC+tD)/2,lcGEMHole};
pc4_1 = newp; Point(pc4_1) = {0, 0, -1*(2*tC+tD)/2,lcGEMHole};


// *******************************
// Dielectric hole
// *******************************
// Top
pth1_1 = newp; Point(pth1_1) = {r0, 0, tD/2,lcDielectricHole};
pth2_1 = newp; Point(pth2_1) = {0, r0, tD/2,lcDielectricHole};
cth1_1 = 200; Circle(cth1_1) = {pth2_1, pc1_1, pth1_1};

// Center
pch1_1 = newp; Point(pch1_1) = {r11, 0, 0,lcDielectricHole};
pch2_1 = newp; Point(pch2_1) = {0, r11, 0,lcDielectricHole};
cch1_1 = newc; Circle(cch1_1) = {pch2_1, pc1_12, pch1_1};

// Bottom
pbh1_1 = newp; Point(pbh1_1) = {r0, 0, -1*tD/2,lcDielectricHole};
pbh2_1 = newp; Point(pbh2_1) = {0, r0, -1*tD/2,lcDielectricHole};
cbh1_1 = newc; Circle(cbh1_1) = {pbh2_1, pc2_1, pbh1_1};


// *******************************
// Upper Etching
// *******************************

// Top
ptue1_1 = newp; Point(ptue1_1) = {(r0+r1), 0, (2*tC+tD)/2,lcEtchingHole};
ptue2_1 = newp; Point(ptue2_1) = {0, (r0+r1), (2*tC+tD)/2,lcEtchingHole};

// Bottom
pbue1_1 = newp; Point(pbue1_1) = {(r0+r1), 0, tD/2,lcEtchingHole};
pbue2_1 = newp; Point(pbue2_1) = {0,(r0+r1), tD/2,lcEtchingHole};

// Circular boundary
ctue1_1 = newc; Circle(ctue1_1) = {ptue2_1, pc3_1, ptue1_1};
cbue1_1 = newc; Circle(cbue1_1) = {pbue2_1, pc1_1, pbue1_1};

// *******************************
// Lower Etching
// *******************************

// Top
ptle1_1 = newp; Point(ptle1_1) = {(r0+r1), 0, -1*tD/2,lcEtchingHole};
ptle2_1 = newp; Point(ptle2_1) = {0, (r0+r1), -1*tD/2,lcEtchingHole};

// Bottom
pble1_1 = newp; Point(pble1_1) = {(r0+r1), 0, -1*(2*tC+tD)/2,lcEtchingHole};
pble2_1 = newp; Point(pble2_1) = {0, (r0+r1), -1*(2*tC+tD)/2,lcEtchingHole};

// Circular boundaries
ctle1_1 = newc; Circle(ctle1_1) = {ptle2_1, pc2_1, ptle1_1};
cble1_1 = newc; Circle(cble1_1) = {pble2_1, pc4_1, pble1_1};

// Lines connecting top and bottom
lconn1_1 = newc; Line(lconn1_1) = {pbh1_1, pch1_1};
lconn2_1 = newc; Line(lconn2_1) = {pbh2_1, pch2_1};
lconn3_1 = newc; Line(lconn3_1) = {pth1_1, pch1_1};
lconn4_1 = newc; Line(lconn4_1) = {pth2_1, pch2_1};
lconn5_1 = newc; Line(lconn5_1) = {pbue2_1, ptle2_1};
lconn6_1 = newc; Line(lconn6_1) = {pbue1_1, ptle1_1};


// ------------------------------------------------------------
// Hole 2 (half hole)
// ------------------------------------------------------------

// *******************************
// Center
// *******************************
pc1_2 = newp; Point(pc1_2) = {a/2, a*Sqrt(3)/2, tD/2,lcGEMHole};
pc1_22 = newp; Point(pc1_22) = {a/2, a*Sqrt(3)/2, 0,lcGEMHole};
pc2_2 = newp; Point(pc2_2) = {a/2, a*Sqrt(3)/2, -1*tD/2,lcGEMHole};
pc3_2 = newp; Point(pc3_2) = {a/2, a*Sqrt(3)/2, (2*tC+tD)/2,lcGEMHole};
pc4_2 = newp; Point(pc4_2) = {a/2, a*Sqrt(3)/2, -1*(2*tC+tD)/2,lcGEMHole};


// *******************************
// Dielectric hole
// *******************************
// Top
pth1_2 = newp; Point(pth1_2) = {a/2-1*r0, a*Sqrt(3)/2, tD/2,lcDielectricHole};
pth2_2 = newp; Point(pth2_2) = {a/2+r0, a*Sqrt(3)/2, tD/2,lcDielectricHole};
pth3_2 = newp; Point(pth3_2) = {a/2, a*Sqrt(3)/2-1*r0, tD/2,lcDielectricHole};
cth1_2 = newc; Circle(cth1_2) = {pth1_2, pc1_2, pth3_2};
cth2_2 = newc; Circle(cth2_2) = {pth3_2, pc1_2, pth2_2};

// Center
pch1_2 = newp; Point(pch1_2) = {a/2-1*r11, a*Sqrt(3)/2, 0,lcDielectricHole};
pch2_2 = newp; Point(pch2_2) = {a/2+r11, a*Sqrt(3)/2, 0,lcDielectricHole};
pch3_2 = newp; Point(pch3_2) = {a/2, a*Sqrt(3)/2-1*r11, 0,lcDielectricHole};
cch1_2 = newc; Circle(cch1_2) = {pch1_2, pc1_22, pch3_2};
cch2_2 = newc; Circle(cch2_2) = {pch3_2, pc1_22, pch2_2};


// Bottom
pbh1_2 = newp; Point(pbh1_2) = {a/2-1*r0, a*Sqrt(3)/2, -1*tD/2,lcDielectricHole};
pbh2_2 = newp; Point(pbh2_2) = {a/2+r0, a*Sqrt(3)/2, -1*tD/2,lcDielectricHole};
pbh3_2 = newp; Point(pbh3_2) = {a/2, a*Sqrt(3)/2-1*r0, -1*tD/2,lcDielectricHole};
cbh1_2 = newc; Circle(cbh1_2) = {pbh1_2, pc2_2, pbh3_2};
cbh2_2 = newc; Circle(cbh2_2) = {pbh3_2, pc2_2, pbh2_2};

// *******************************
// Upper Etching
// *******************************

// Top
ptue1_2 = newp; Point(ptue1_2) = {a/2-1*(r0+r1), a*Sqrt(3)/2, (2*tC+tD)/2,lcEtchingHole};
ptue2_2 = newp; Point(ptue2_2) = {a/2+(r0+r1), a*Sqrt(3)/2, (2*tC+tD)/2,lcEtchingHole};
ptue3_2 = newp; Point(ptue3_2) = {a/2, a*Sqrt(3)/2-1*(r0+r1), (2*tC+tD)/2,lcEtchingHole};

// Bottom
pbue1_2 = newp; Point(pbue1_2) = {a/2-1*(r0+r1), a*Sqrt(3)/2, tD/2,lcEtchingHole};
pbue2_2 = newp; Point(pbue2_2) = {a/2+(r0+r1), a*Sqrt(3)/2, tD/2,lcEtchingHole};
pbue3_2 = newp; Point(pbue3_2) = {a/2,a*Sqrt(3)/2-1*(r0+r1), tD/2,lcEtchingHole};

// Circular boundary
ctue1_2 = newc; Circle(ctue1_2) = {ptue1_2, pc3_2, ptue3_2};
ctue2_2 = newc; Circle(ctue2_2) = {ptue3_2, pc3_2, ptue2_2};
cbue1_2 = newc; Circle(cbue1_2) = {pbue1_2, pc1_2, pbue3_2};
cbue2_2 = newc; Circle(cbue2_2) = {pbue3_2, pc1_2, pbue2_2};

lue1_2 = newc; Line(lue1_2) = {ptue1_2, pbue1_2};
lue2_2 = newc; Line(lue2_2) = {ptue2_2, pbue2_2};
lue3_2 = newc; Line(lue3_2) = {ptue3_2, pbue3_2};


// *******************************
// Lower Etching
// *******************************

// Top
ptle1_2 = newp; Point(ptle1_2) = {a/2-1*(r0+r1), a*Sqrt(3)/2, -1*tD/2,lcEtchingHole};
ptle2_2 = newp; Point(ptle2_2) = {a/2+(r0+r1), a*Sqrt(3)/2, -1*tD/2,lcEtchingHole};
ptle3_2 = newp; Point(ptle3_2) = {a/2, a*Sqrt(3)/2-1*(r0+r1), -1*tD/2,lcEtchingHole};

// Bottom
pble1_2 = newp; Point(pble1_2) = {a/2-1*(r0+r1), a*Sqrt(3)/2, -1*(2*tC+tD)/2,lcEtchingHole};
pble2_2 = newp; Point(pble2_2) = {a/2+(r0+r1), a*Sqrt(3)/2, -1*(2*tC+tD)/2,lcEtchingHole};
pble3_2 = newp; Point(pble3_2) = {a/2, a*Sqrt(3)/2-1*(r0+r1), -1*(2*tC+tD)/2,lcEtchingHole};

// Circular boundaries
ctle1_2 = newc; Circle(ctle1_2) = {ptle1_2, pc2_2, ptle3_2};
ctle2_2 = newc; Circle(ctle2_2) = {ptle3_2, pc2_2, ptle2_2};
cble1_2 = newc; Circle(cble1_2) = {pble1_2, pc4_2, pble3_2};
cble2_2 = newc; Circle(cble2_2) = {pble3_2, pc4_2, pble2_2};

lle1_2 = newc; Line(lle1_2) = {ptle1_2, pble1_2};
lle2_2 = newc; Line(lle2_2) = {ptle2_2, pble2_2};
lle3_2 = newc; Line(lle3_2) = {ptle3_2, pble3_2};

// Lines connecting top and bottom
lconn1_2 = newc; Line(lconn1_2) = {pbh1_2, pch1_2};
lconn2_2 = newc; Line(lconn2_2) = {pbh2_2, pch2_2};
lconn3_2 = newc; Line(lconn3_2) = {pbh3_2, pch3_2};
lconn4_2 = newc; Line(lconn4_2) = {pth1_2, pch1_2};
lconn5_2 = newc; Line(lconn5_2) = {pth2_2, pch2_2};
lconn6_2 = newc; Line(lconn6_2) = {pth3_2, pch3_2};
lconn7_2 = newc; Line(lconn7_2) = {ptle1_2, pbue1_2};
lconn8_2 = newc; Line(lconn8_2) = {ptle2_2, pbue2_2};
lconn9_2 = newc; Line(lconn9_2) = {pbue3_2, ptle3_2};

// ------------------------------------------------------------
// Hole 3 (quarter hole)
// ------------------------------------------------------------

// *******************************
// Center
// *******************************
pc1_3 = newp; Point(pc1_3) = {a, 0, tD/2,lcGEMHole};
pc1_32 = newp; Point(pc1_32) = {a, 0, 0,lcGEMHole};
pc2_3 = newp; Point(pc2_3) = {a, 0, -1*tD/2,lcGEMHole};
pc3_3 = newp; Point(pc3_3) = {a, 0, (2*tC+tD)/2,lcGEMHole};
pc4_3 = newp; Point(pc4_3) = {a, 0, -1*(2*tC+tD)/2,lcGEMHole};


// *******************************
// Dielectric hole
// *******************************
// Top
pth1_3 = newp; Point(pth1_3) = {a-r0, 0, tD/2,lcDielectricHole};
pth2_3 = newp; Point(pth2_3) = {a, r0, tD/2,lcDielectricHole};
cth1_3 = newc; Circle(cth1_3) = {pth2_3, pc1_3, pth1_3};


// Center
pch1_3 = newp; Point(pch1_3) = {a-r11, 0, 0,lcDielectricHole};
pch2_3 = newp; Point(pch2_3) = {a, r11, 0,lcDielectricHole};
cch1_3 = newc; Circle(cch1_3) = {pch2_3, pc1_32, pch1_3};


// Bottom
pbh1_3 = newp; Point(pbh1_3) = {a-r0, 0, -1*tD/2,lcDielectricHole};
pbh2_3 = newp; Point(pbh2_3) = {a, r0, -1*tD/2,lcDielectricHole};
cbh1_3 = newc; Circle(cbh1_3) = {pbh2_3, pc2_3, pbh1_3};

// *******************************
// Upper Etching
// *******************************

// Top
ptue1_3 = newp; Point(ptue1_3) = {a-(r0+r1), 0, (2*tC+tD)/2,lcEtchingHole};
ptue2_3 = newp; Point(ptue2_3) = {a, (r0+r1), (2*tC+tD)/2,lcEtchingHole};

// Bottom
pbue1_3 = newp; Point(pbue1_3) = {a-(r0+r1), 0, tD/2,lcEtchingHole};
pbue2_3 = newp; Point(pbue2_3) = {a,(r0+r1), tD/2,lcEtchingHole};

// Circular boundary
ctue1_3 = newc; Circle(ctue1_3) = {ptue2_3, pc3_3, ptue1_3};
cbue1_3 = newc; Circle(cbue1_3) = {pbue2_3, pc1_3, pbue1_3};

// *******************************
// Lower Etching
// *******************************

// Top
ptle1_3 = newp; Point(ptle1_3) = {a-(r0+r1), 0, -1*tD/2,lcEtchingHole};
ptle2_3 = newp; Point(ptle2_3) = {a, (r0+r1), -1*tD/2,lcEtchingHole};

// Bottom
pble1_3 = newp; Point(pble1_3) = {a-(r0+r1), 0, -1*(2*tC+tD)/2,lcEtchingHole};
pble2_3 = newp; Point(pble2_3) = {a, (r0+r1), -1*(2*tC+tD)/2,lcEtchingHole};

// Circular boundaries
ctle1_3 = newc; Circle(ctle1_3) = {ptle2_3, pc2_3, ptle1_3};
cble1_3 = newc; Circle(cble1_3) = {pble2_3, pc4_3, pble1_3};

// Lines connecting top and bottom
lconn1_3 = newc; Line(lconn1_3) = {pbh1_3, pch1_3};
lconn2_3 = newc; Line(lconn2_3) = {pbh2_3, pch2_3};
lconn3_3 = newc; Line(lconn3_3) = {pth1_3, pch1_3};
lconn4_3 = newc; Line(lconn4_3) = {pth2_3, pch2_3};
lconn5_3 = newc; Line(lconn5_3) = {pbue1_3, ptle1_3};
lconn6_3 = newc; Line(lconn6_3) = {pbue2_3, ptle2_3};

// --------------------------------------------------------------------------


// *******************************************************
// Copper planes
// *******************************************************

// Points between two half holes on upper LEM
ptmc = newp; Point(ptmc) = {a/2, 0, (2*tC+tD)/2, lcCopperPlateBdry};
ptmd = newp; Point(ptmd) = {a/2, 0, tD/2, lcCopperPlateBdry};

// Top lower boundary
pcptl1 = newp; Point(pcptl1) = {0, 0, tD/2,lcCopperPlateBdry};
pcptl2 = newp; Point(pcptl2) = {a, a*Sqrt(3)/2, tD/2,lcCopperPlateBdry};
pcptl3 = newp; Point(pcptl3) = {0, a*Sqrt(3)/2, tD/2,lcCopperPlateBdry};

// Top upper boundary
pcptu2 = newp; Point(pcptu2) = {a, a*Sqrt(3)/2, (tD+2*tC)/2,lcCopperPlateBdry};
pcptu3 = newp; Point(pcptu3) = {0, a*Sqrt(3)/2, (tD+2*tC)/2,lcCopperPlateBdry};

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
lcpt7 = newc; Line(lcpt7) = {pth2_1,pbue2_1};
lcpt8 = newc; Line(lcpt8) = {pbue2_1,pcptl3};
lcpt9 = newc; Line(lcpt9) = {pcptl3,pbue1_2};
lcpt10 = newc; Line(lcpt10) = {pbue1_2,pth1_2};
lcpt11a = newc; Line(lcpt11a) = {pth1_2,pc1_2};
lcpt11b = newc; Line(lcpt11b) = {pc1_2,pth2_2};
lcpt12 = newc; Line(lcpt12) = {pth2_2,pbue2_2};
lcpt13 = newc; Line(lcpt13) = {pbue2_2,pcptl2};
lcpt14 = newc; Line(lcpt14) = {pcptl2,pbue2_3};
lcpt15 = newc; Line(lcpt15) = {pbue2_3,pth2_3};
lcpt16 = newc; Line(lcpt16) = {pth2_3,pc1_3};
lcpt17 = newc; Line(lcpt17) = {pc1_3,pth1_3};
lcpt18 = newc; Line(lcpt18) = {pth1_3,pbue1_3};
lcpt19a = newc; Line(lcpt19a) = {pbue1_3,ptmd};
lcpt19b = newc; Line(lcpt19b) = {ptmd,pbue1_1};
lcpt20 = newc; Line(lcpt20) = {pbue1_1,pth1_1};
lcpt21 = newc; Line(lcpt21) = {pth1_1,pc1_1};

// Connect the upper and lower points with lines to form the plate
lcpt22 = newc; Line(lcpt22) = {pcptu2, pcptl2};
lcpt23 = newc; Line(lcpt23) = {pcptu3, pcptl3};
lcpt24 = newc; Line(lcpt24) = {pc3_1, pc1_1};
lcpt25 = newc; Line(lcpt25) = {pc3_3, pc1_3};
lcpt26 = newc; Line(lcpt26) = {ptue2_3, pbue2_3};
lcpt27 = newc; Line(lcpt27) = {ptue1_3, pbue1_3};
lcpt28 = newc; Line(lcpt28) = {ptue1_1, pbue1_1};
lcpt29 = newc; Line(lcpt29) = {ptue2_1, pbue2_1};

// ---------------------------------------------

// Points between two half holes on lower LEM
pbmd = newp; Point(pbmd) = {a/2, 0, -1*tD/2, lcCopperPlateBdry};
pbmc = newp; Point(pbmc) = {a/2, 0, -1*(2*tC+tD)/2, lcCopperPlateBdry};

// Bottom lower boundary
pcpbl2 = newp; Point(pcpbl2) = {a, a*Sqrt(3)/2, -1*(tD+2*tC)/2,lcCopperPlateBdry};
pcpbl3 = newp; Point(pcpbl3) = {0, a*Sqrt(3)/2, -1*(tD+2*tC)/2,lcCopperPlateBdry};

// Bottom upper boundary
pcpbu2 = newp; Point(pcpbu2) = {a, a*Sqrt(3)/2, -1*tD/2,lcCopperPlateBdry};
pcpbu3 = newp; Point(pcpbu3) = {0, a*Sqrt(3)/2, -1*tD/2,lcCopperPlateBdry};

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
lcpb7 = newc; Line(lcpb7) = {pbh2_1,ptle2_1};
lcpb8 = newc; Line(lcpb8) = {ptle2_1,pcpbu3};
lcpb9 = newc; Line(lcpb9) = {pcpbu3,ptle1_2};
lcpb10 = newc; Line(lcpb10) = {ptle1_2,pbh1_2};
lcpb11a = newc; Line(lcpb11a) = {pbh1_2,pc2_2};
lcpb11b = newc; Line(lcpb11b) = {pc2_2,pbh2_2};
lcpb12 = newc; Line(lcpb12) = {pbh2_2,ptle2_2};
lcpb13 = newc; Line(lcpb13) = {ptle2_2,pcpbu2};
lcpb14 = newc; Line(lcpb14) = {pcpbu2,ptle2_3};
lcpb15 = newc; Line(lcpb15) = {ptle2_3,pbh2_3};
lcpb16 = newc; Line(lcpb16) = {pbh2_3,pc2_3};
lcpb17 = newc; Line(lcpb17) = {pc2_3,pbh1_3};
lcpb18 = newc; Line(lcpb18) = {pbh1_3,ptle1_3};
lcpb19a = newc; Line(lcpb19a) = {ptle1_3,pbmd};
lcpb19b = newc; Line(lcpb19b) = {pbmd,ptle1_1};
lcpb20 = newc; Line(lcpb20) = {ptle1_1,pbh1_1};
lcpb21 = newc; Line(lcpb21) = {pbh1_1,pc2_1};

// Connect the upper and lower points with lines to form the plate
lcpb22 = newc; Line(lcpb22) = {pcpbu2, pcpbl2};
lcpb23 = newc; Line(lcpb23) = {pcpbu3, pcpbl3};
lcpb24 = newc; Line(lcpb24) = {pc2_1, pc4_1};
lcpb25 = newc; Line(lcpb25) = {pc2_3, pc4_3};
lcpb26 = newc; Line(lcpb26) = {ptle2_3, pble2_3};
lcpb27 = newc; Line(lcpb27) = {ptle1_3, pble1_3};
lcpb28 = newc; Line(lcpb28) = {ptle1_1, pble1_1};
lcpb29 = newc; Line(lcpb29) = {ptle2_1, pble2_1};

lcpb30 = newc; Line(lcpb30) = {pc1_1, pc2_1};
lcpb31 = newc; Line(lcpb31) = {pcptl2, pcpbu2};
lcpb32 = newc; Line(lcpb32) = {pcptl3, pcpbu3};
lcpb33 = newc; Line(lcpb33) = {pc1_3, pc2_3};

// Lines splitting the LEM in half: half hole side
lshalf1 = newc; Line(lshalf1) = {pc3_2, pc1_2};
lshalf2 = newc; Line(lshalf2) = {pc1_2, pc2_2};
lshalf3 = newc; Line(lshalf3) = {pc2_2, pc4_2};

// Lines splitting the LEM in half: quarter hole side
lsqt1 = newc; Line(lsqt1) = {ptmc, ptmd};
lsqt2 = newc; Line(lsqt2) = {ptmd, pbmd};
lsqt3 = newc; Line(lsqt3) = {pbmd, pbmc};





// **********************************************
// Second Gem
// **********************************************

// ------------------------------------------------------------
// Hole 1 (quarter hole)
// ------------------------------------------------------------

// *******************************
// Center
// *******************************
pc12_1 = newp; Point(pc12_1) = {0, 0, tD/2-lG,lcGEMHole};
pc12_12 = newp; Point(pc12_12) = {0, 0, -lG,lcGEMHole};
pc22_1 = newp; Point(pc22_1) = {0, 0, -1*tD/2-lG,lcGEMHole};
pc32_1 = newp; Point(pc32_1) = {0, 0, (2*tC+tD)/2-lG,lcGEMHole};
pc42_1 = newp; Point(pc42_1) = {0, 0, -1*(2*tC+tD)/2-lG,lcGEMHole};


// *******************************
// Dielectric hole
// *******************************
// Top
pth12_1 = newp; Point(pth12_1) = {r0, 0, tD/2-lG,lcDielectricHole};
pth22_1 = newp; Point(pth22_1) = {0, r0, tD/2-lG,lcDielectricHole};
cth12_1 = newc; Circle(cth12_1) = {pth22_1, pc12_1, pth12_1};

// Center
pch12_1 = newp; Point(pch12_1) = {r11, 0, -lG,lcDielectricHole};
pch22_1 = newp; Point(pch22_1) = {0, r11, -lG,lcDielectricHole};
cch12_1 = newc; Circle(cch12_1) = {pch22_1, pc12_12, pch12_1};

// Bottom
pbh12_1 = newp; Point(pbh12_1) = {r0, 0, -1*tD/2-lG,lcDielectricHole};
pbh22_1 = newp; Point(pbh22_1) = {0, r0, -1*tD/2-lG,lcDielectricHole};
cbh12_1 = newc; Circle(cbh12_1) = {pbh22_1, pc22_1, pbh12_1};

// *******************************
// Upper Etching
// *******************************

// Top
ptue12_1 = newp; Point(ptue12_1) = {(r0+r1), 0, (2*tC+tD)/2-lG,lcEtchingHole};
ptue22_1 = newp; Point(ptue22_1) = {0, (r0+r1), (2*tC+tD)/2-lG,lcEtchingHole};

// Bottom
pbue12_1 = newp; Point(pbue12_1) = {(r0+r1), 0, tD/2-lG,lcEtchingHole};
pbue22_1 = newp; Point(pbue22_1) = {0,(r0+r1), tD/2-lG,lcEtchingHole};

// Circular boundary
ctue12_1 = newc; Circle(ctue12_1) = {ptue22_1, pc32_1, ptue12_1};
cbue12_1 = newc; Circle(cbue12_1) = {pbue22_1, pc12_1, pbue12_1};

// *******************************
// Lower Etching
// *******************************

// Top
ptle12_1 = newp; Point(ptle12_1) = {(r0+r1), 0, -1*tD/2-lG,lcEtchingHole};
ptle22_1 = newp; Point(ptle22_1) = {0, (r0+r1), -1*tD/2-lG,lcEtchingHole};

// Bottom
pble12_1 = newp; Point(pble12_1) = {(r0+r1), 0, -1*(2*tC+tD)/2-lG,lcEtchingHole};
pble22_1 = newp; Point(pble22_1) = {0, (r0+r1), -1*(2*tC+tD)/2-lG,lcEtchingHole};

// Circular boundaries
ctle12_1 = newc; Circle(ctle12_1) = {ptle22_1, pc22_1, ptle12_1};
cble12_1 = newc; Circle(cble12_1) = {pble22_1, pc42_1, pble12_1};

// Lines connecting top and bottom
lconn12_1 = newc; Line(lconn12_1) = {pbh12_1, pch12_1};
lconn22_1 = newc; Line(lconn22_1) = {pbh22_1, pch22_1};
lconn32_1 = newc; Line(lconn32_1) = {pth12_1, pch12_1};
lconn42_1 = newc; Line(lconn42_1) = {pth22_1, pch22_1};
lconn52_1 = newc; Line(lconn52_1) = {pbue22_1, ptle22_1};
lconn62_1 = newc; Line(lconn62_1) = {pbue12_1, ptle12_1};


// ------------------------------------------------------------
// Hole 2 (half hole)
// ------------------------------------------------------------

// *******************************
// Center
// *******************************
pc12_2 = newp; Point(pc12_2) = {a/2, a*Sqrt(3)/2, tD/2-lG,lcGEMHole};
pc12_22 = newp; Point(pc12_22) = {a/2, a*Sqrt(3)/2, -lG,lcGEMHole};
pc22_2 = newp; Point(pc22_2) = {a/2, a*Sqrt(3)/2, -1*tD/2-lG,lcGEMHole};
pc32_2 = newp; Point(pc32_2) = {a/2, a*Sqrt(3)/2, (2*tC+tD)/2-lG,lcGEMHole};
pc42_2 = newp; Point(pc42_2) = {a/2, a*Sqrt(3)/2, -1*(2*tC+tD)/2-lG,lcGEMHole};


// *******************************
// Dielectric hole
// *******************************
// Top
pth12_2 = newp; Point(pth12_2) = {a/2-1*r0, a*Sqrt(3)/2, tD/2-lG,lcDielectricHole};
pth22_2 = newp; Point(pth22_2) = {a/2+r0, a*Sqrt(3)/2, tD/2-lG,lcDielectricHole};
pth32_2 = newp; Point(pth32_2) = {a/2, a*Sqrt(3)/2-1*r0, tD/2-lG,lcDielectricHole};
cth12_2 = newc; Circle(cth12_2) = {pth12_2, pc12_2, pth32_2};
cth22_2 = newc; Circle(cth22_2) = {pth32_2, pc12_2, pth22_2};

// Center
pch12_2 = newp; Point(pch12_2) = {a/2-1*r11, a*Sqrt(3)/2, -lG,lcDielectricHole};
pch22_2 = newp; Point(pch22_2) = {a/2+r11, a*Sqrt(3)/2, -lG,lcDielectricHole};
pch32_2 = newp; Point(pch32_2) = {a/2, a*Sqrt(3)/2-1*r11, -lG,lcDielectricHole};
cch12_2 = newc; Circle(cch12_2) = {pch12_2, pc12_22, pch32_2};
cch22_2 = newc; Circle(cch22_2) = {pch32_2, pc12_22, pch22_2};


// Bottom
pbh12_2 = newp; Point(pbh12_2) = {a/2-1*r0, a*Sqrt(3)/2, -1*tD/2-lG,lcDielectricHole};
pbh22_2 = newp; Point(pbh22_2) = {a/2+r0, a*Sqrt(3)/2, -1*tD/2-lG,lcDielectricHole};
pbh32_2 = newp; Point(pbh32_2) = {a/2, a*Sqrt(3)/2-1*r0, -1*tD/2-lG,lcDielectricHole};
cbh12_2 = newc; Circle(cbh12_2) = {pbh12_2, pc22_2, pbh32_2};
cbh22_2 = newc; Circle(cbh22_2) = {pbh32_2, pc22_2, pbh22_2};

// *******************************
// Upper Etching
// *******************************

// Top
ptue12_2 = newp; Point(ptue12_2) = {a/2-1*(r0+r1), a*Sqrt(3)/2, (2*tC+tD)/2-lG,lcEtchingHole};
ptue22_2 = newp; Point(ptue22_2) = {a/2+(r0+r1), a*Sqrt(3)/2, (2*tC+tD)/2-lG,lcEtchingHole};
ptue32_2 = newp; Point(ptue32_2) = {a/2, a*Sqrt(3)/2-1*(r0+r1), (2*tC+tD)/2-lG,lcEtchingHole};

// Bottom
pbue12_2 = newp; Point(pbue12_2) = {a/2-1*(r0+r1), a*Sqrt(3)/2, tD/2-lG,lcEtchingHole};
pbue22_2 = newp; Point(pbue22_2) = {a/2+(r0+r1), a*Sqrt(3)/2, tD/2-lG,lcEtchingHole};
pbue32_2 = newp; Point(pbue32_2) = {a/2,a*Sqrt(3)/2-1*(r0+r1), tD/2-lG,lcEtchingHole};

// Circular boundary
ctue12_2 = newc; Circle(ctue12_2) = {ptue12_2, pc32_2, ptue32_2};
ctue22_2 = newc; Circle(ctue22_2) = {ptue32_2, pc32_2, ptue22_2};
cbue12_2 = newc; Circle(cbue12_2) = {pbue12_2, pc12_2, pbue32_2};
cbue22_2 = newc; Circle(cbue22_2) = {pbue32_2, pc12_2, pbue22_2};

lue12_2 = newc; Line(lue12_2) = {ptue12_2, pbue12_2};
lue22_2 = newc; Line(lue22_2) = {ptue22_2, pbue22_2};
lue32_2 = newc; Line(lue32_2) = {ptue32_2, pbue32_2};


// *******************************
// Lower Etching
// *******************************

// Top
ptle12_2 = newp; Point(ptle12_2) = {a/2-1*(r0+r1), a*Sqrt(3)/2, -1*tD/2-lG,lcEtchingHole};
ptle22_2 = newp; Point(ptle22_2) = {a/2+(r0+r1), a*Sqrt(3)/2, -1*tD/2-lG,lcEtchingHole};
ptle32_2 = newp; Point(ptle32_2) = {a/2, a*Sqrt(3)/2-1*(r0+r1), -1*tD/2-lG,lcEtchingHole};

// Bottom
pble12_2 = newp; Point(pble12_2) = {a/2-1*(r0+r1), a*Sqrt(3)/2, -1*(2*tC+tD)/2-lG,lcEtchingHole};
pble22_2 = newp; Point(pble22_2) = {a/2+(r0+r1), a*Sqrt(3)/2, -1*(2*tC+tD)/2-lG,lcEtchingHole};
pble32_2 = newp; Point(pble32_2) = {a/2, a*Sqrt(3)/2-1*(r0+r1), -1*(2*tC+tD)/2-lG,lcEtchingHole};

// Circular boundaries
ctle12_2 = newc; Circle(ctle12_2) = {ptle12_2, pc22_2, ptle32_2};
ctle22_2 = newc; Circle(ctle22_2) = {ptle32_2, pc22_2, ptle22_2};
cble12_2 = newc; Circle(cble12_2) = {pble12_2, pc42_2, pble32_2};
cble22_2 = newc; Circle(cble22_2) = {pble32_2, pc42_2, pble22_2};

lle12_2 = newc; Line(lle12_2) = {ptle12_2, pble12_2};
lle22_2 = newc; Line(lle22_2) = {ptle22_2, pble22_2};
lle32_2 = newc; Line(lle32_2) = {ptle32_2, pble32_2};

// Lines connecting top and bottom
lconn12_2 = newc; Line(lconn12_2) = {pbh12_2, pch12_2};
lconn22_2 = newc; Line(lconn22_2) = {pbh22_2, pch22_2};
lconn32_2 = newc; Line(lconn32_2) = {pbh32_2, pch32_2};
lconn42_2 = newc; Line(lconn42_2) = {pth12_2, pch12_2};
lconn52_2 = newc; Line(lconn52_2) = {pth22_2, pch22_2};
lconn62_2 = newc; Line(lconn62_2) = {pth32_2, pch32_2};
lconn72_2 = newc; Line(lconn72_2) = {ptle12_2, pbue12_2};
lconn82_2 = newc; Line(lconn82_2) = {ptle22_2, pbue22_2};
lconn92_2 = newc; Line(lconn92_2) = {pbue32_2, ptle32_2};

// ------------------------------------------------------------
// Hole 3 (quarter hole)
// ------------------------------------------------------------

// *******************************
// Center
// *******************************
pc12_3 = newp; Point(pc12_3) = {a, 0, tD/2-lG,lcGEMHole};
pc12_32 = newp; Point(pc12_32) = {a, 0, -lG,lcGEMHole};
pc22_3 = newp; Point(pc22_3) = {a, 0, -1*tD/2-lG,lcGEMHole};
pc32_3 = newp; Point(pc32_3) = {a, 0, (2*tC+tD)/2-lG,lcGEMHole};
pc42_3 = newp; Point(pc42_3) = {a, 0, -1*(2*tC+tD)/2-lG,lcGEMHole};


// *******************************
// Dielectric hole
// *******************************
// Top
pth12_3 = newp; Point(pth12_3) = {a-r0, 0, tD/2-lG,lcDielectricHole};
pth22_3 = newp; Point(pth22_3) = {a, r0, tD/2-lG,lcDielectricHole};
cth12_3 = newc; Circle(cth12_3) = {pth22_3, pc12_3, pth12_3};


// Center
pch12_3 = newp; Point(pch12_3) = {a-r11, 0, -lG,lcDielectricHole};
pch22_3 = newp; Point(pch22_3) = {a, r11, -lG,lcDielectricHole};
cch12_3 = newc; Circle(cch12_3) = {pch22_3, pc12_32, pch12_3};


// Bottom
pbh12_3 = newp; Point(pbh12_3) = {a-r0, 0, -1*tD/2-lG,lcDielectricHole};
pbh22_3 = newp; Point(pbh22_3) = {a, r0, -1*tD/2-lG,lcDielectricHole};
cbh12_3 = newc; Circle(cbh12_3) = {pbh22_3, pc22_3, pbh12_3};

// *******************************
// Upper Etching
// *******************************

// Top
ptue12_3 = newp; Point(ptue12_3) = {a-(r0+r1), 0, (2*tC+tD)/2-lG,lcEtchingHole};
ptue22_3 = newp; Point(ptue22_3) = {a, (r0+r1), (2*tC+tD)/2-lG,lcEtchingHole};

// Bottom
pbue12_3 = newp; Point(pbue12_3) = {a-(r0+r1), 0, tD/2-lG,lcEtchingHole};
pbue22_3 = newp; Point(pbue22_3) = {a,(r0+r1), tD/2-lG,lcEtchingHole};

// Circular boundary
ctue12_3 = newc; Circle(ctue12_3) = {ptue22_3, pc32_3, ptue12_3};
cbue12_3 = newc; Circle(cbue12_3) = {pbue22_3, pc12_3, pbue12_3};

// *******************************
// Lower Etching
// *******************************

// Top
ptle12_3 = newp; Point(ptle12_3) = {a-(r0+r1), 0, -1*tD/2-lG,lcEtchingHole};
ptle22_3 = newp; Point(ptle22_3) = {a, (r0+r1), -1*tD/2-lG,lcEtchingHole};

// Bottom
pble12_3 = newp; Point(pble12_3) = {a-(r0+r1), 0, -1*(2*tC+tD)/2-lG,lcEtchingHole};
pble22_3 = newp; Point(pble22_3) = {a, (r0+r1), -1*(2*tC+tD)/2-lG,lcEtchingHole};

// Circular boundaries
ctle12_3 = newc; Circle(ctle12_3) = {ptle22_3, pc22_3, ptle12_3};
cble12_3 = newc; Circle(cble12_3) = {pble22_3, pc42_3, pble12_3};

// Lines connecting top and bottom
lconn12_3 = newc; Line(lconn12_3) = {pbh12_3, pch12_3};
lconn22_3 = newc; Line(lconn22_3) = {pbh22_3, pch22_3};
lconn32_3 = newc; Line(lconn32_3) = {pth12_3, pch12_3};
lconn42_3 = newc; Line(lconn42_3) = {pth22_3, pch22_3};
lconn52_3 = newc; Line(lconn52_3) = {pbue12_3, ptle12_3};
lconn62_3 = newc; Line(lconn62_3) = {pbue22_3, ptle22_3};

// --------------------------------------------------------------------------


// *******************************************************
// Copper planes
// *******************************************************

// Points between two half holes on upper LEM
ptmc2 = newp; Point(ptmc2) = {a/2, 0, (2*tC+tD)/2-lG, lcCopperPlateBdry};
ptmd2 = newp; Point(ptmd2) = {a/2, 0, tD/2-lG, lcCopperPlateBdry};

// Top lower boundary
pcptl1_2 = newp; Point(pcptl1_2) = {0, 0, tD/2-lG,lcCopperPlateBdry};
pcptl2_2 = newp; Point(pcptl2_2) = {a, a*Sqrt(3)/2, tD/2-lG,lcCopperPlateBdry};
pcptl3_2 = newp; Point(pcptl3_2) = {0, a*Sqrt(3)/2, tD/2-lG,lcCopperPlateBdry};

// Top upper boundary
pcptu2_2 = newp; Point(pcptu2_2) = {a, a*Sqrt(3)/2, (tD+2*tC)/2-lG,lcCopperPlateBdry};
pcptu3_2 = newp; Point(pcptu3_2) = {0, a*Sqrt(3)/2, (tD+2*tC)/2-lG,lcCopperPlateBdry};

// Border lines
// Upper boundary
lcpt1_2 = newc; Line(lcpt1_2) = {ptue12_2,pcptu3_2};
lcpt2_2 = newc; Line(lcpt2_2) = {pcptu3_2,ptue22_1};
lcpt3_2a = newc; Line(lcpt3_2a) = {ptue12_1,ptmc2};
lcpt3_2b = newc; Line(lcpt3_2b) = {ptmc2,ptue12_3};
lcpt4_2 = newc; Line(lcpt4_2) = {ptue22_3,pcptu2_2};
lcpt5_2 = newc; Line(lcpt5_2) = {pcptu2_2,ptue22_2};

// Lower boundary
lcpt6_2 = newc; Line(lcpt6_2) = {pc12_1,pth22_1};  // starts at point 1 and goes CW holes 1,2,then 3
lcpt7_2 = newc; Line(lcpt7_2) = {pth22_1,pbue22_1};
lcpt8_2 = newc; Line(lcpt8_2) = {pbue22_1,pcptl3_2};
lcpt9_2 = newc; Line(lcpt9_2) = {pcptl3_2,pbue12_2};
lcpt10_2 = newc; Line(lcpt10_2) = {pbue12_2,pth12_2};
lcpt11_2a = newc; Line(lcpt11_2a) = {pth12_2,pc12_2};
lcpt11_2b = newc; Line(lcpt11_2b) = {pc12_2,pth22_2};
lcpt12_2 = newc; Line(lcpt12_2) = {pth22_2,pbue22_2};
lcpt13_2 = newc; Line(lcpt13_2) = {pbue22_2,pcptl2_2};
lcpt14_2 = newc; Line(lcpt14_2) = {pcptl2_2,pbue22_3};
lcpt15_2 = newc; Line(lcpt15_2) = {pbue22_3,pth22_3};
lcpt16_2 = newc; Line(lcpt16_2) = {pth22_3,pc12_3};
lcpt17_2 = newc; Line(lcpt17_2) = {pc12_3,pth12_3};
lcpt18_2 = newc; Line(lcpt18_2) = {pth12_3,pbue12_3};
lcpt19_2a = newc; Line(lcpt19_2a) = {pbue12_3,ptmd2};
lcpt19_2b = newc; Line(lcpt19_2b) = {ptmd2,pbue12_1};
lcpt20_2 = newc; Line(lcpt20_2) = {pbue12_1,pth12_1};
lcpt21_2 = newc; Line(lcpt21_2) = {pth12_1,pc12_1};

// Connect the upper and lower points with lines to form the plate
lcpt22_2 = newc; Line(lcpt22_2) = {pcptu2_2, pcptl2_2};
lcpt23_2 = newc; Line(lcpt23_2) = {pcptu3_2, pcptl3_2};
lcpt24_2 = newc; Line(lcpt24_2) = {pc32_1, pc12_1};
lcpt25_2 = newc; Line(lcpt25_2) = {pc32_3, pc12_3};
lcpt26_2 = newc; Line(lcpt26_2) = {ptue22_3, pbue22_3};
lcpt27_2 = newc; Line(lcpt27_2) = {ptue12_3, pbue12_3};
lcpt28_2 = newc; Line(lcpt28_2) = {ptue12_1, pbue12_1};
lcpt29_2 = newc; Line(lcpt29_2) = {ptue22_1, pbue22_1};

// ---------------------------------------------

// Points between two half holes on lower LEM
pbmd2 = newp; Point(pbmd2) = {a/2, 0, -1*tD/2-lG, lcCopperPlateBdry};
pbmc2 = newp; Point(pbmc2) = {a/2, 0, -1*(2*tC+tD)/2-lG, lcCopperPlateBdry};

// Bottom lower boundary
pcpbl2_2 = newp; Point(pcpbl2_2) = {a, a*Sqrt(3)/2, -1*(tD+2*tC)/2-lG,lcCopperPlateBdry};
pcpbl2_3 = newp; Point(pcpbl2_3) = {0, a*Sqrt(3)/2, -1*(tD+2*tC)/2-lG,lcCopperPlateBdry};

// Bottom upper boundary
pcpbu2_2 = newp; Point(pcpbu2_2) = {a, a*Sqrt(3)/2, -1*tD/2-lG,lcCopperPlateBdry};
pcpbu2_3 = newp; Point(pcpbu2_3) = {0, a*Sqrt(3)/2, -1*tD/2-lG,lcCopperPlateBdry};


// Border lines
// Upper boundary
lcpb1_2 = newc; Line(lcpb1_2) = {pble12_2,pcpbl2_3};
lcpb2_2 = newc; Line(lcpb2_2) = {pcpbl2_3,pble22_1};
lcpb3_2a = newc; Line(lcpb3_2a) = {pble12_1,pbmc2};
lcpb3_2b = newc; Line(lcpb3_2b) = {pbmc2,pble12_3};
lcpb4_2 = newc; Line(lcpb4_2) = {pble22_3,pcpbl2_2};
lcpb5_2 = newc; Line(lcpb5_2) = {pcpbl2_2,pble22_2};

// Lower boundary
lcpb6_2 = newc; Line(lcpb6_2) = {pc22_1,pbh22_1};  // starts at point 1 and goes CW holes 1,2,then 3
lcpb7_2 = newc; Line(lcpb7_2) = {pbh22_1,ptle22_1};
lcpb8_2 = newc; Line(lcpb8_2) = {ptle22_1,pcpbu2_3};
lcpb9_2 = newc; Line(lcpb9_2) = {pcpbu2_3,ptle12_2};
lcpb10_2 = newc; Line(lcpb10_2) = {ptle12_2,pbh12_2};
lcpb11_2a = newc; Line(lcpb11_2a) = {pbh12_2,pc22_2};
lcpb11_2b = newc; Line(lcpb11_2b) = {pc22_2,pbh22_2};
lcpb12_2 = newc; Line(lcpb12_2) = {pbh22_2,ptle22_2};
lcpb13_2 = newc; Line(lcpb13_2) = {ptle22_2,pcpbu2_2};
lcpb14_2 = newc; Line(lcpb14_2) = {pcpbu2_2,ptle22_3};
lcpb15_2 = newc; Line(lcpb15_2) = {ptle22_3,pbh22_3};
lcpb16_2 = newc; Line(lcpb16_2) = {pbh22_3,pc22_3};
lcpb17_2 = newc; Line(lcpb17_2) = {pc22_3,pbh12_3};
lcpb18_2 = newc; Line(lcpb18_2) = {pbh12_3,ptle12_3};
lcpb19_2a = newc; Line(lcpb19_2a) = {ptle12_3,pbmd2};
lcpb19_2b = newc; Line(lcpb19_2b) = {pbmd2,ptle12_1};
lcpb20_2 = newc; Line(lcpb20_2) = {ptle12_1,pbh12_1};
lcpb21_2 = newc; Line(lcpb21_2) = {pbh12_1,pc22_1};

// Connect the upper and lower points with lines to form the plate
lcpb22_2 = newc; Line(lcpb22_2) = {pcpbu2_2, pcpbl2_2};
lcpb23_2 = newc; Line(lcpb23_2) = {pcpbu2_3, pcpbl2_3};
lcpb24_2 = newc; Line(lcpb24_2) = {pc22_1, pc42_1};
lcpb25_2 = newc; Line(lcpb25_2) = {pc22_3, pc42_3};
lcpb26_2 = newc; Line(lcpb26_2) = {ptle22_3, pble22_3};
lcpb27_2 = newc; Line(lcpb27_2) = {ptle12_3, pble12_3};
lcpb28_2 = newc; Line(lcpb28_2) = {ptle12_1, pble12_1};
lcpb29_2 = newc; Line(lcpb29_2) = {ptle22_1, pble22_1};

lcpb30_2 = newc; Line(lcpb30_2) = {pc12_1, pc22_1};
lcpb31_2 = newc; Line(lcpb31_2) = {pcptl2_2, pcpbu2_2};
lcpb32_2 = newc; Line(lcpb32_2) = {pcptl3_2, pcpbu2_3};
lcpb33_2 = newc; Line(lcpb33_2) = {pc12_3, pc22_3};

// Lines splitting the LEM in half: half hole side
lshalf12 = newc; Line(lshalf12) = {pc32_2, pc12_2};
lshalf22 = newc; Line(lshalf22) = {pc12_2, pc22_2};
lshalf32 = newc; Line(lshalf32) = {pc22_2, pc42_2};

// Lines splitting the LEM in half: quarter hole side
lsqt12 = newc; Line(lsqt12) = {ptmc2, ptmd2};
lsqt22 = newc; Line(lsqt22) = {ptmd2, pbmd2};
lsqt32 = newc; Line(lsqt32) = {pbmd2, pbmc2};


// **********************************************
// Third gem
// **********************************************

// ------------------------------------------------------------
// Hole 1 (quarter hole)
// ------------------------------------------------------------

// *******************************
// Center
// *******************************
pc13_1 = newp; Point(pc13_1) = {0, 0, tD/2+lG,lcGEMHole};
pc13_12 = newp; Point(pc13_12) = {0, 0, lG,lcGEMHole};
pc23_1 = newp; Point(pc23_1) = {0, 0, -1*tD/2+lG,lcGEMHole};
pc33_1 = newp; Point(pc33_1) = {0, 0, (2*tC+tD)/2+lG,lcGEMHole};
pc43_1 = newp; Point(pc43_1) = {0, 0, -1*(2*tC+tD)/2+lG,lcGEMHole};


// *******************************
// Dielectric hole
// *******************************
// Top
pth13_1 = newp; Point(pth13_1) = {r0, 0, tD/2+lG,lcDielectricHole};
pth23_1 = newp; Point(pth23_1) = {0, r0, tD/2+lG,lcDielectricHole};
cth13_1 = newc; Circle(cth13_1) = {pth23_1, pc13_1, pth13_1};

// Center
pch13_1 = newp; Point(pch13_1) = {r11, 0, lG,lcDielectricHole};
pch23_1 = newp; Point(pch23_1) = {0, r11, lG,lcDielectricHole};
cch13_1 = newc; Circle(cch13_1) = {pch23_1, pc13_12, pch13_1};

// Bottom
pbh13_1 = newp; Point(pbh13_1) = {r0, 0, -1*tD/2+lG,lcDielectricHole};
pbh23_1 = newp; Point(pbh23_1) = {0, r0, -1*tD/2+lG,lcDielectricHole};
cbh13_1 = newc; Circle(cbh13_1) = {pbh23_1, pc23_1, pbh13_1};

// *******************************
// Upper Etching
// *******************************

// Top
ptue13_1 = newp; Point(ptue13_1) = {(r0+r1), 0, (2*tC+tD)/2+lG,lcEtchingHole};
ptue23_1 = newp; Point(ptue23_1) = {0, (r0+r1), (2*tC+tD)/2+lG,lcEtchingHole};

// Bottom
pbue13_1 = newp; Point(pbue13_1) = {(r0+r1), 0, tD/2+lG,lcEtchingHole};
pbue23_1 = newp; Point(pbue23_1) = {0,(r0+r1), tD/2+lG,lcEtchingHole};

// Circular boundary
ctue13_1 = newc; Circle(ctue13_1) = {ptue23_1, pc33_1, ptue13_1};
cbue13_1 = newc; Circle(cbue13_1) = {pbue23_1, pc13_1, pbue13_1};

// *******************************
// Lower Etching
// *******************************

// Top
ptle13_1 = newp; Point(ptle13_1) = {(r0+r1), 0, -1*tD/2+lG,lcEtchingHole};
ptle23_1 = newp; Point(ptle23_1) = {0, (r0+r1), -1*tD/2+lG,lcEtchingHole};

// Bottom
pble13_1 = newp; Point(pble13_1) = {(r0+r1), 0, -1*(2*tC+tD)/2+lG,lcEtchingHole};
pble23_1 = newp; Point(pble23_1) = {0, (r0+r1), -1*(2*tC+tD)/2+lG,lcEtchingHole};

// Circular boundaries
ctle13_1 = newc; Circle(ctle13_1) = {ptle23_1, pc23_1, ptle13_1};
cble13_1 = newc; Circle(cble13_1) = {pble23_1, pc43_1, pble13_1};

// Lines connecting top and bottom
lconn13_1 = newc; Line(lconn13_1) = {pbh13_1, pch13_1};
lconn23_1 = newc; Line(lconn23_1) = {pbh23_1, pch23_1};
lconn33_1 = newc; Line(lconn33_1) = {pth13_1, pch13_1};
lconn43_1 = newc; Line(lconn43_1) = {pth23_1, pch23_1};
lconn53_1 = newc; Line(lconn53_1) = {pbue23_1, ptle23_1};
lconn63_1 = newc; Line(lconn63_1) = {pbue13_1, ptle13_1};


// ------------------------------------------------------------
// Hole 2 (half hole)
// ------------------------------------------------------------

// *******************************
// Center
// *******************************
pc13_2 = newp; Point(pc13_2) = {a/2, a*Sqrt(3)/2, tD/2+lG,lcGEMHole};
pc13_22 = newp; Point(pc13_22) = {a/2, a*Sqrt(3)/2, lG,lcGEMHole};
pc23_2 = newp; Point(pc23_2) = {a/2, a*Sqrt(3)/2, -1*tD/2+lG,lcGEMHole};
pc33_2 = newp; Point(pc33_2) = {a/2, a*Sqrt(3)/2, (2*tC+tD)/2+lG,lcGEMHole};
pc43_2 = newp; Point(pc43_2) = {a/2, a*Sqrt(3)/2, -1*(2*tC+tD)/2+lG,lcGEMHole};


// *******************************
// Dielectric hole
// *******************************
// Top
pth13_2 = newp; Point(pth13_2) = {a/2-1*r0, a*Sqrt(3)/2, tD/2+lG,lcDielectricHole};
pth23_2 = newp; Point(pth23_2) = {a/2+r0, a*Sqrt(3)/2, tD/2+lG,lcDielectricHole};
pth33_2 = newp; Point(pth33_2) = {a/2, a*Sqrt(3)/2-1*r0, tD/2+lG,lcDielectricHole};
cth13_2 = newc; Circle(cth13_2) = {pth13_2, pc13_2, pth33_2};
cth23_2 = newc; Circle(cth23_2) = {pth33_2, pc13_2, pth23_2};

// Center
pch13_2 = newp; Point(pch13_2) = {a/2-1*r11, a*Sqrt(3)/2, lG,lcDielectricHole};
pch23_2 = newp; Point(pch23_2) = {a/2+r11, a*Sqrt(3)/2, lG,lcDielectricHole};
pch33_2 = newp; Point(pch33_2) = {a/2, a*Sqrt(3)/2-1*r11, lG,lcDielectricHole};
cch13_2 = newc; Circle(cch13_2) = {pch13_2, pc13_22, pch33_2};
cch23_2 = newc; Circle(cch23_2) = {pch33_2, pc13_22, pch23_2};


// Bottom
pbh13_2 = newp; Point(pbh13_2) = {a/2-1*r0, a*Sqrt(3)/2, -1*tD/2+lG,lcDielectricHole};
pbh23_2 = newp; Point(pbh23_2) = {a/2+r0, a*Sqrt(3)/2, -1*tD/2+lG,lcDielectricHole};
pbh33_2 = newp; Point(pbh33_2) = {a/2, a*Sqrt(3)/2-1*r0, -1*tD/2+lG,lcDielectricHole};
cbh13_2 = newc; Circle(cbh13_2) = {pbh13_2, pc23_2, pbh33_2};
cbh23_2 = newc; Circle(cbh23_2) = {pbh33_2, pc23_2, pbh23_2};

// *******************************
// Upper Etching
// *******************************

// Top
ptue13_2 = newp; Point(ptue13_2) = {a/2-1*(r0+r1), a*Sqrt(3)/2, (2*tC+tD)/2+lG,lcEtchingHole};
ptue23_2 = newp; Point(ptue23_2) = {a/2+(r0+r1), a*Sqrt(3)/2, (2*tC+tD)/2+lG,lcEtchingHole};
ptue33_2 = newp; Point(ptue33_2) = {a/2, a*Sqrt(3)/2-1*(r0+r1), (2*tC+tD)/2+lG,lcEtchingHole};

// Bottom
pbue13_2 = newp; Point(pbue13_2) = {a/2-1*(r0+r1), a*Sqrt(3)/2, tD/2+lG,lcEtchingHole};
pbue23_2 = newp; Point(pbue23_2) = {a/2+(r0+r1), a*Sqrt(3)/2, tD/2+lG,lcEtchingHole};
pbue33_2 = newp; Point(pbue33_2) = {a/2,a*Sqrt(3)/2-1*(r0+r1), tD/2+lG,lcEtchingHole};

// Circular boundary
ctue13_2 = newc; Circle(ctue13_2) = {ptue13_2, pc33_2, ptue33_2};
ctue23_2 = newc; Circle(ctue23_2) = {ptue33_2, pc33_2, ptue23_2};
cbue13_2 = newc; Circle(cbue13_2) = {pbue13_2, pc13_2, pbue33_2};
cbue23_2 = newc; Circle(cbue23_2) = {pbue33_2, pc13_2, pbue23_2};

lue13_2 = newc; Line(lue13_2) = {ptue13_2, pbue13_2};
lue23_2 = newc; Line(lue23_2) = {ptue23_2, pbue23_2};
lue33_2 = newc; Line(lue33_2) = {ptue33_2, pbue33_2};


// *******************************
// Lower Etching
// *******************************

// Top
ptle13_2 = newp; Point(ptle13_2) = {a/2-1*(r0+r1), a*Sqrt(3)/2, -1*tD/2+lG,lcEtchingHole};
ptle23_2 = newp; Point(ptle23_2) = {a/2+(r0+r1), a*Sqrt(3)/2, -1*tD/2+lG,lcEtchingHole};
ptle33_2 = newp; Point(ptle33_2) = {a/2, a*Sqrt(3)/2-1*(r0+r1), -1*tD/2+lG,lcEtchingHole};

// Bottom
pble13_2 = newp; Point(pble13_2) = {a/2-1*(r0+r1), a*Sqrt(3)/2, -1*(2*tC+tD)/2+lG,lcEtchingHole};
pble23_2 = newp; Point(pble23_2) = {a/2+(r0+r1), a*Sqrt(3)/2, -1*(2*tC+tD)/2+lG,lcEtchingHole};
pble33_2 = newp; Point(pble33_2) = {a/2, a*Sqrt(3)/2-1*(r0+r1), -1*(2*tC+tD)/2+lG,lcEtchingHole};

// Circular boundaries
ctle13_2 = newc; Circle(ctle13_2) = {ptle13_2, pc23_2, ptle33_2};
ctle23_2 = newc; Circle(ctle23_2) = {ptle33_2, pc23_2, ptle23_2};
cble13_2 = newc; Circle(cble13_2) = {pble13_2, pc43_2, pble33_2};
cble23_2 = newc; Circle(cble23_2) = {pble33_2, pc43_2, pble23_2};

lle13_2 = newc; Line(lle13_2) = {ptle13_2, pble13_2};
lle23_2 = newc; Line(lle23_2) = {ptle23_2, pble23_2};
lle33_2 = newc; Line(lle33_2) = {ptle33_2, pble33_2};

// Lines connecting top and bottom
lconn13_2 = newc; Line(lconn13_2) = {pbh13_2, pch13_2};
lconn23_2 = newc; Line(lconn23_2) = {pbh23_2, pch23_2};
lconn33_2 = newc; Line(lconn33_2) = {pbh33_2, pch33_2};
lconn43_2 = newc; Line(lconn43_2) = {pth13_2, pch13_2};
lconn53_2 = newc; Line(lconn53_2) = {pth23_2, pch23_2};
lconn63_2 = newc; Line(lconn63_2) = {pth33_2, pch33_2};
lconn73_2 = newc; Line(lconn73_2) = {ptle13_2, pbue13_2};
lconn83_2 = newc; Line(lconn83_2) = {ptle23_2, pbue23_2};
lconn93_2 = newc; Line(lconn93_2) = {pbue33_2, ptle33_2};

// ------------------------------------------------------------
// Hole 3 (quarter hole)
// ------------------------------------------------------------

// *******************************
// Center
// *******************************
pc13_3 = newp; Point(pc13_3) = {a, 0, tD/2+lG,lcGEMHole};
pc13_32 = newp; Point(pc13_32) = {a, 0, lG,lcGEMHole};
pc23_3 = newp; Point(pc23_3) = {a, 0, -1*tD/2+lG,lcGEMHole};
pc33_3 = newp; Point(pc33_3) = {a, 0, (2*tC+tD)/2+lG,lcGEMHole};
pc43_3 = newp; Point(pc43_3) = {a, 0, -1*(2*tC+tD)/2+lG,lcGEMHole};


// *******************************
// Dielectric hole
// *******************************
// Top
pth13_3 = newp; Point(pth13_3) = {a-r0, 0, tD/2+lG,lcDielectricHole};
pth23_3 = newp; Point(pth23_3) = {a, r0, tD/2+lG,lcDielectricHole};
cth13_3 = newc; Circle(cth13_3) = {pth23_3, pc13_3, pth13_3};


// Center
pch13_3 = newp; Point(pch13_3) = {a-r11, 0, lG,lcDielectricHole};
pch23_3 = newp; Point(pch23_3) = {a, r11, lG,lcDielectricHole};
cch13_3 = newc; Circle(cch13_3) = {pch23_3, pc13_32, pch13_3};


// Bottom
pbh13_3 = newp; Point(pbh13_3) = {a-r0, 0, -1*tD/2+lG,lcDielectricHole};
pbh23_3 = newp; Point(pbh23_3) = {a, r0, -1*tD/2+lG,lcDielectricHole};
cbh13_3 = newc; Circle(cbh13_3) = {pbh23_3, pc23_3, pbh13_3};

// *******************************
// Upper Etching
// *******************************

// Top
ptue13_3 = newp; Point(ptue13_3) = {a-(r0+r1), 0, (2*tC+tD)/2+lG,lcEtchingHole};
ptue23_3 = newp; Point(ptue23_3) = {a, (r0+r1), (2*tC+tD)/2+lG,lcEtchingHole};

// Bottom
pbue13_3 = newp; Point(pbue13_3) = {a-(r0+r1), 0, tD/2+lG,lcEtchingHole};
pbue23_3 = newp; Point(pbue23_3) = {a,(r0+r1), tD/2+lG,lcEtchingHole};

// Circular boundary
ctue13_3 = newc; Circle(ctue13_3) = {ptue23_3, pc33_3, ptue13_3};
cbue13_3 = newc; Circle(cbue13_3) = {pbue23_3, pc13_3, pbue13_3};

// *******************************
// Lower Etching
// *******************************

// Top
ptle13_3 = newp; Point(ptle13_3) = {a-(r0+r1), 0, -1*tD/2+lG,lcEtchingHole};
ptle23_3 = newp; Point(ptle23_3) = {a, (r0+r1), -1*tD/2+lG,lcEtchingHole};

// Bottom
pble13_3 = newp; Point(pble13_3) = {a-(r0+r1), 0, -1*(2*tC+tD)/2+lG,lcEtchingHole};
pble23_3 = newp; Point(pble23_3) = {a, (r0+r1), -1*(2*tC+tD)/2+lG,lcEtchingHole};

// Circular boundaries
ctle13_3 = newc; Circle(ctle13_3) = {ptle23_3, pc23_3, ptle13_3};
cble13_3 = newc; Circle(cble13_3) = {pble23_3, pc43_3, pble13_3};

// Lines connecting top and bottom
lconn13_3 = newc; Line(lconn13_3) = {pbh13_3, pch13_3};
lconn23_3 = newc; Line(lconn23_3) = {pbh23_3, pch23_3};
lconn33_3 = newc; Line(lconn33_3) = {pth13_3, pch13_3};
lconn43_3 = newc; Line(lconn43_3) = {pth23_3, pch23_3};
lconn53_3 = newc; Line(lconn53_3) = {pbue13_3, ptle13_3};
lconn63_3 = newc; Line(lconn63_3) = {pbue23_3, ptle23_3};

// --------------------------------------------------------------------------


// *******************************************************
// Copper planes
// *******************************************************

// Points between two half holes on upper LEM
ptmc3 = newp; Point(ptmc3) = {a/2, 0, (2*tC+tD)/2+lG, lcCopperPlateBdry};
ptmd3 = newp; Point(ptmd3) = {a/2, 0, tD/2+lG, lcCopperPlateBdry};

// Top lower boundary
pcptl1_3 = newp; Point(pcptl1_3) = {0, 0, tD/2+lG,lcCopperPlateBdry};
pcptl2_3 = newp; Point(pcptl2_3) = {a, a*Sqrt(3)/2, tD/2+lG,lcCopperPlateBdry};
pcptl3_3 = newp; Point(pcptl3_3) = {0, a*Sqrt(3)/2, tD/2+lG,lcCopperPlateBdry};

// Top upper boundary
pcptu2_3 = newp; Point(pcptu2_3) = {a, a*Sqrt(3)/2, (tD+2*tC)/2+lG,lcCopperPlateBdry};
pcptu3_3 = newp; Point(pcptu3_3) = {0, a*Sqrt(3)/2, (tD+2*tC)/2+lG,lcCopperPlateBdry};

// Border lines
// Upper boundary
lcpt1_3 = newc; Line(lcpt1_3) = {ptue13_2,pcptu3_3};
lcpt2_3 = newc; Line(lcpt2_3) = {pcptu3_3,ptue23_1};
lcpt3_3a = newc; Line(lcpt3_3a) = {ptue13_1,ptmc3};
lcpt3_3b = newc; Line(lcpt3_3b) = {ptmc3,ptue13_3};
lcpt4_3 = newc; Line(lcpt4_3) = {ptue23_3,pcptu2_3};
lcpt5_3 = newc; Line(lcpt5_3) = {pcptu2_3,ptue23_2};

// Lower boundary
lcpt6_3 = newc; Line(lcpt6_3) = {pc13_1,pth23_1};  // starts at point 1 and goes CW holes 1,2,then 3
lcpt7_3 = newc; Line(lcpt7_3) = {pth23_1,pbue23_1};
lcpt8_3 = newc; Line(lcpt8_3) = {pbue23_1,pcptl3_3};
lcpt9_3 = newc; Line(lcpt9_3) = {pcptl3_3,pbue13_2};
lcpt10_3 = newc; Line(lcpt10_3) = {pbue13_2,pth13_2};
lcpt11_3a = newc; Line(lcpt11_3a) = {pth13_2,pc13_2};
lcpt11_3b = newc; Line(lcpt11_3b) = {pc13_2,pth23_2};
lcpt12_3 = newc; Line(lcpt12_3) = {pth23_2,pbue23_2};
lcpt13_3 = newc; Line(lcpt13_3) = {pbue23_2,pcptl2_3};
lcpt14_3 = newc; Line(lcpt14_3) = {pcptl2_3,pbue23_3};
lcpt15_3 = newc; Line(lcpt15_3) = {pbue23_3,pth23_3};
lcpt16_3 = newc; Line(lcpt16_3) = {pth23_3,pc13_3};
lcpt17_3 = newc; Line(lcpt17_3) = {pc13_3,pth13_3};
lcpt18_3 = newc; Line(lcpt18_3) = {pth13_3,pbue13_3};
lcpt19_3a = newc; Line(lcpt19_3a) = {pbue13_3,ptmd3};
lcpt19_3b = newc; Line(lcpt19_3b) = {ptmd3,pbue13_1};
lcpt20_3 = newc; Line(lcpt20_3) = {pbue13_1,pth13_1};
lcpt21_3 = newc; Line(lcpt21_3) = {pth13_1,pc13_1};

// Connect the upper and lower points with lines to form th plate
lcpt22_3 = newc; Line(lcpt22_3) = {pcptu2_3, pcptl2_3};
lcpt23_3 = newc; Line(lcpt23_3) = {pcptu3_3, pcptl3_3};
lcpt24_3 = newc; Line(lcpt24_3) = {pc33_1, pc13_1};
lcpt25_3 = newc; Line(lcpt25_3) = {pc33_3, pc13_3};
lcpt26_3 = newc; Line(lcpt26_3) = {ptue23_3, pbue23_3};
lcpt27_3 = newc; Line(lcpt27_3) = {ptue13_3, pbue13_3};
lcpt28_3 = newc; Line(lcpt28_3) = {ptue13_1, pbue13_1};
lcpt29_3 = newc; Line(lcpt29_3) = {ptue23_1, pbue23_1};

// ---------------------------------------------

// Points between two half holes on lower LEM
pbmd3 = newp; Point(pbmd3) = {a/2, 0, -1*tD/2+lG, lcCopperPlateBdry};
pbmc3 = newp; Point(pbmc3) = {a/2, 0, -1*(2*tC+tD)/2+lG, lcCopperPlateBdry};

// Bottom lower boundary
pcpbl3_2 = newp; Point(pcpbl3_2) = {a, a*Sqrt(3)/2, -1*(tD+2*tC)/2+lG,lcCopperPlateBdry};
pcpbl3_3 = newp; Point(pcpbl3_3) = {0, a*Sqrt(3)/2, -1*(tD+2*tC)/2+lG,lcCopperPlateBdry};

// Bottom upper boundary
pcpbu3_2 = newp; Point(pcpbu3_2) = {a, a*Sqrt(3)/2, -1*tD/2+lG,lcCopperPlateBdry};
pcpbu3_3 = newp; Point(pcpbu3_3) = {0, a*Sqrt(3)/2, -1*tD/2+lG,lcCopperPlateBdry};


// Border lines
// Upper boundary
lcpb1_3 = newc; Line(lcpb1_3) = {pble13_2,pcpbl3_3};
lcpb2_3 = newc; Line(lcpb2_3) = {pcpbl3_3,pble23_1};
lcpb3_3a = newc; Line(lcpb3_3a) = {pble13_1,pbmc3};
lcpb3_3b = newc; Line(lcpb3_3b) = {pbmc3,pble13_3};
lcpb4_3 = newc; Line(lcpb4_3) = {pble23_3,pcpbl3_2};
lcpb5_3 = newc; Line(lcpb5_3) = {pcpbl3_2,pble23_2};

// Lower boundary
lcpb6_3 = newc; Line(lcpb6_3) = {pc23_1,pbh23_1};  // starts at point 1 and goes CW holes 1,2,then 3
lcpb7_3 = newc; Line(lcpb7_3) = {pbh23_1,ptle23_1};
lcpb8_3 = newc; Line(lcpb8_3) = {ptle23_1,pcpbu3_3};
lcpb9_3 = newc; Line(lcpb9_3) = {pcpbu3_3,ptle13_2};
lcpb10_3 = newc; Line(lcpb10_3) = {ptle13_2,pbh13_2};
lcpb11_3a = newc; Line(lcpb11_3a) = {pbh13_2,pc23_2};
lcpb11_3b = newc; Line(lcpb11_3b) = {pc23_2,pbh23_2};
lcpb12_3 = newc; Line(lcpb12_3) = {pbh23_2,ptle23_2};
lcpb13_3 = newc; Line(lcpb13_3) = {ptle23_2,pcpbu3_2};
lcpb14_3 = newc; Line(lcpb14_3) = {pcpbu3_2,ptle23_3};
lcpb15_3 = newc; Line(lcpb15_3) = {ptle23_3,pbh23_3};
lcpb16_3 = newc; Line(lcpb16_3) = {pbh23_3,pc23_3};
lcpb17_3 = newc; Line(lcpb17_3) = {pc23_3,pbh13_3};
lcpb18_3 = newc; Line(lcpb18_3) = {pbh13_3,ptle13_3};
lcpb19_3a = newc; Line(lcpb19_3a) = {ptle13_3,pbmd3};
lcpb19_3b = newc; Line(lcpb19_3b) = {pbmd3,ptle13_1};
lcpb20_3 = newc; Line(lcpb20_3) = {ptle13_1,pbh13_1};
lcpb21_3 = newc; Line(lcpb21_3) = {pbh13_1,pc23_1};

// Connect the upper and lower points with lines to form the plate
lcpb22_3 = newc; Line(lcpb22_3) = {pcpbu3_2, pcpbl3_2};
lcpb23_3 = newc; Line(lcpb23_3) = {pcpbu3_3, pcpbl3_3};
lcpb24_3 = newc; Line(lcpb24_3) = {pc23_1, pc43_1};
lcpb25_3 = newc; Line(lcpb25_3) = {pc23_3, pc43_3};
lcpb26_3 = newc; Line(lcpb26_3) = {ptle23_3, pble23_3};
lcpb27_3 = newc; Line(lcpb27_3) = {ptle13_3, pble13_3};
lcpb28_3 = newc; Line(lcpb28_3) = {ptle13_1, pble13_1};
lcpb29_3 = newc; Line(lcpb29_3) = {ptle23_1, pble23_1};

lcpb30_3 = newc; Line(lcpb30_3) = {pc13_1, pc23_1};
lcpb31_3 = newc; Line(lcpb31_3) = {pcptl2_3, pcpbu3_2};
lcpb32_3 = newc; Line(lcpb32_3) = {pcptl3_3, pcpbu3_3};
lcpb33_3 = newc; Line(lcpb33_3) = {pc13_3, pc23_3};

// Lines splitting the LEM in half: half hole side
lshalf13 = newc; Line(lshalf13) = {pc33_2, pc13_2};
lshalf23 = newc; Line(lshalf23) = {pc13_2, pc23_2};
lshalf33 = newc; Line(lshalf33) = {pc23_2, pc43_2};

// Lines splitting the LEM in half: quarter hole side
lsqt13 = newc; Line(lsqt13) = {ptmc3, ptmd3};
lsqt23 = newc; Line(lsqt23) = {ptmd3, pbmd3};
lsqt33 = newc; Line(lsqt33) = {pbmd3, pbmc3};

// ****************************************************










// **********************************************
// External Electrodes
// **********************************************

// Top electrode
pexet1 = newp; Point(pexet1) = {a, a*Sqrt(3)/2, (2*tC+tD)/2+lG+lE,lcExtElectrodeBdry};
pexet2 = newp; Point(pexet2) = {a/2, a*Sqrt(3)/2, (2*tC+tD)/2+lG+lE,lcExtElectrodeBdry};
pexet3 = newp; Point(pexet3) = {0, a*Sqrt(3)/2, (2*tC+tD)/2+lG+lE,lcExtElectrodeBdry};
pexet4 = newp; Point(pexet4) = {0, 0, (2*tC+tD)/2+lG+lE,lcExtElectrodeBdry};
pexet5 = newp; Point(pexet5) = {a/2, 0, (2*tC+tD)/2+lG+lE,lcExtElectrodeBdry};
pexet6 = newp; Point(pexet6) = {a, 0, (2*tC+tD)/2+lG+lE,lcExtElectrodeBdry};

// Top electrode lines
lexet1 = newc; Line(lexet1) = {pexet1, pexet2};
lexet2 = newc; Line(lexet2) = {pexet2, pexet3};
lexet3 = newc; Line(lexet3) = {pexet3, pexet4};
lexet4 = newc; Line(lexet4) = {pexet4, pexet5};
lexet5 = newc; Line(lexet5) = {pexet5, pexet6};
lexet6 = newc; Line(lexet6) = {pexet6, pexet1};

// Connect the top electrode to the LEM.
//lexetc1 = newc; Line(lexetc1) = {pexet1, pcptu2_3};
//lexetc2 = newc; Line(lexetc2) = {pexet2, pc33_2};
//lexetc3 = newc; Line(lexetc3) = {pexet3, pcptu3_3};
//lexetc4 = newc; Line(lexetc4) = {pexet4, pc33_1};
//lexetc5 = newc; Line(lexetc5) = {pexet5, ptmc3};
//lexetc6 = newc; Line(lexetc6) = {pexet6, pc33_3};

// Bottom electrode
pexeb1 = newp; Point(pexeb1) = {a, a*Sqrt(3)/2, -(2*tC+tD)/2-lG-lP,lcExtElectrodeBdry};
pexeb2 = newp; Point(pexeb2) = {a/2, a*Sqrt(3)/2, -(2*tC+tD)/2-lG-lP,lcExtElectrodeBdry};
pexeb3 = newp; Point(pexeb3) = {0, a*Sqrt(3)/2, -(2*tC+tD)/2-lG-lP,lcExtElectrodeBdry};
pexeb4 = newp; Point(pexeb4) = {0, 0, -(2*tC+tD)/2-lG-lP,lcExtElectrodeBdry};
pexeb5 = newp; Point(pexeb5) = {a/2, 0, -(2*tC+tD)/2-lG-lP,lcExtElectrodeBdry};
pexeb6 = newp; Point(pexeb6) = {a, 0, -(2*tC+tD)/2-lG-lP,lcExtElectrodeBdry};

// Bottom electrode lines
lexeb1 = newc; Line(lexeb1) = {pexeb1, pexeb2};
lexeb2 = newc; Line(lexeb2) = {pexeb2, pexeb3};
lexeb3 = newc; Line(lexeb3) = {pexeb3, pexeb4};
lexeb4 = newc; Line(lexeb4) = {pexeb4, pexeb5};
lexeb5 = newc; Line(lexeb5) = {pexeb5, pexeb6};
lexeb6 = newc; Line(lexeb6) = {pexeb6, pexeb1};

// Connect the bottom electrode to the LEM.
//lexebc1 = newc; Line(lexebc1) = {pexeb1, pcpbl2_2};
//lexebc2 = newc; Line(lexebc2) = {pexeb2, pc42_2};
//lexebc3 = newc; Line(lexebc3) = {pexeb3, pcpbl2_3};
//lexebc4 = newc; Line(lexebc4) = {pexeb4, pc42_1};
//lexebc5 = newc; Line(lexebc5) = {pexeb5, pbmc2};
//lexebc6 = newc; Line(lexebc6) = {pexeb6, pc42_3};


// *************************************************
// Define surfaces
// *************************************************


// *************************************************
// 1 Gem
// *************************************************

// Copper plate surfaces
llcp_up_rim1_2 = newreg; Line Loop(llcp_up_rim1_2) = {-lue1_2, -cbue1_2, lue3_2, ctue1_2};
rscp_up_rim1_2 = newreg; Ruled Surface(rscp_up_rim1_2) = {llcp_up_rim1_2};
llcp_up_rim2_2 = newreg; Line Loop(llcp_up_rim2_2) = {lue2_2, -1*cbue2_2, -1*lue3_2, ctue2_2};
rscp_up_rim2_2 = newreg; Ruled Surface(rscp_up_rim2_2) = {llcp_up_rim2_2};


llcp_up_rim_1 = newreg; Line Loop(llcp_up_rim_1) = {lcpt29, cbue1_1, -lcpt28, -ctue1_1};
rscp_up_rim_1 = newreg; Ruled Surface(rscp_up_rim_1) = {llcp_up_rim_1};
llcp_up_rim_3 = newreg; Line Loop(llcp_up_rim_3) = {lcpt27, -cbue1_3, -lcpt26, ctue1_3};
rscp_up_rim_3 = newreg; Ruled Surface(rscp_up_rim_3) = {llcp_up_rim_3};




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

llcp_low_rim1_2 = newreg; Line Loop(llcp_low_rim1_2) = {-lle1_2, ctle1_2, lle3_2, -cble1_2};
rscp_low_rim1_2 = newreg; Ruled Surface(rscp_low_rim1_2) = {llcp_low_rim1_2};
llcp_low_rim2_2 = newreg; Line Loop(llcp_low_rim2_2) = {lle2_2, ctle2_2, -lle3_2, -cble2_2};
rscp_low_rim2_2 = newreg; Ruled Surface(rscp_low_rim2_2) = {llcp_low_rim2_2};

llcp_low_rim_1 = newreg; Line Loop(llcp_low_rim_1) = {lcpb29, -ctle1_1, -lcpb28, cble1_1};
rscp_low_rim_1 = newreg; Ruled Surface(rscp_low_rim_1) = {llcp_low_rim_1};
llcp_low_rim_3 = newreg; Line Loop(llcp_low_rim_3) = {lcpb27, ctle1_3, -lcpb26, -cble1_3};
rscp_low_rim_3 = newreg; Ruled Surface(rscp_low_rim_3) = {llcp_low_rim_3};

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

ll_up_dielectric_1 = newreg; Line Loop(ll_up_dielectric_1) = {-lcpt7, -cbue1_1, -lcpt20, cth1_1};
ps_up_dielectric_1 = newreg; Plane Surface(ps_up_dielectric_1) = {ll_up_dielectric_1};
ll_low_dielectric_1 = newreg; Line Loop(ll_low_dielectric_1) = {lcpb7, ctle1_1, lcpb20, -cbh1_1};
ps_low_dielectric_1 = newreg; Plane Surface(ps_low_dielectric_1) = {ll_low_dielectric_1};

ll_up_dielectric_2 = newreg; Line Loop(ll_up_dielectric_2) = {-lcpt12, cbue2_2, cbue1_2, -lcpt10, -cth1_2, -cth2_2};
ps_up_dielectric_2 = newreg; Plane Surface(ps_up_dielectric_2) = {ll_up_dielectric_2};
ll_low_dielectric_2 = newreg; Line Loop(ll_low_dielectric_2) = {lcpb12, -ctle2_2, -ctle1_2, lcpb10, cbh1_2, cbh2_2};
ps_low_dielectric_2 = newreg; Plane Surface(ps_low_dielectric_2) = {ll_low_dielectric_2};

ll_up_dielectric_3 = newreg; Line Loop(ll_up_dielectric_3) = {-lcpt15, -cth1_3, -lcpt18, cbue1_3};
ps_up_dielectric_3 = newreg; Plane Surface(ps_up_dielectric_3) = {ll_up_dielectric_3};
ll_low_dielectric_3 = newreg; Line Loop(ll_low_dielectric_3) = {lcpb15, cbh1_3, lcpb18, -ctle1_3};
ps_low_dielectric_3 = newreg; Plane Surface(ps_low_dielectric_3) = {ll_low_dielectric_3};

//Cylinders


ll_cyl_dielectric1_21 = newreg; Line Loop(ll_cyl_dielectric1_21) = {lconn1_2, cch1_2, -lconn3_2, -cbh1_2};
rs_cyl_dielectric1_21 = newreg; Ruled Surface(rs_cyl_dielectric1_21) = {ll_cyl_dielectric1_21};
ll_cyl_dielectric1_22 = newreg; Line Loop(ll_cyl_dielectric1_22) = {lconn3_2, cch2_2, -lconn2_2, -cbh2_2};
rs_cyl_dielectric1_22 = newreg; Ruled Surface(rs_cyl_dielectric1_22) = {ll_cyl_dielectric1_22};


ll_cyl_dielectric2_21 = newreg; Line Loop(ll_cyl_dielectric2_21) = {cth1_2, -lconn4_2, -cch1_2, lconn6_2};
rs_cyl_dielectric2_21 = newreg; Ruled Surface(rs_cyl_dielectric2_21) = {ll_cyl_dielectric2_21};

ll_cyl_dielectric2_22 = newreg; Line Loop(ll_cyl_dielectric2_22) = {cth2_2, -lconn6_2, -cch2_2, lconn5_2};
rs_cyl_dielectric2_22 = newreg; Ruled Surface(rs_cyl_dielectric2_22) = {ll_cyl_dielectric2_22};

ll_cyl_dielectric3_1 = newreg; Line Loop(ll_cyl_dielectric3_1) = {lconn1_3, cbh1_3, -lconn2_3, -cch1_3};
rs_cyl_dielectric3_1 = newreg; Ruled Surface(rs_cyl_dielectric3_1) = {ll_cyl_dielectric3_1};
ll_cyl_dielectric3_2 = newreg; Line Loop(ll_cyl_dielectric3_2) = {lconn3_3, cth1_3, -lconn4_3, -cch1_3};
rs_cyl_dielectric3_2 = newreg; Ruled Surface(rs_cyl_dielectric3_2) = {ll_cyl_dielectric3_2};


ll_cyl_dielectric1_1 = newreg; Line Loop(ll_cyl_dielectric1_1) = {lconn1_1, -cch1_1, -lconn2_1, cbh1_1};
rs_cyl_dielectric1_1 = newreg; Ruled Surface(rs_cyl_dielectric1_1) = {ll_cyl_dielectric1_1};

ll_cyl_dielectric1_2 = newreg; Line Loop(ll_cyl_dielectric1_2) = {lconn3_1, -cch1_1, -lconn4_1, cth1_1};
rs_cyl_dielectric1_2 = newreg; Ruled Surface(rs_cyl_dielectric1_2) = {ll_cyl_dielectric1_2};

//Sides

ll_side_dielectric1a = newreg; Line Loop(ll_side_dielectric1a) = {lconn1_1, -lconn3_1, -lcpt20, lconn6_1, lcpb20};
ps_side_dielectric1a = newreg; Plane Surface(ps_side_dielectric1a) = {ll_side_dielectric1a};
ll_side_dielectric1b = newreg; Line Loop(ll_side_dielectric1b) = {lconn6_1, lcpt19b, -lsqt2, -lcpb19b};
ps_side_dielectric1b = newreg; Plane Surface(ps_side_dielectric1b) = {ll_side_dielectric1b};
ll_side_dielectric1c = newreg; Line Loop(ll_side_dielectric1c) = {lconn1_3, -lconn3_3, lcpt18, lconn5_3, -lcpb18};
ps_side_dielectric1c = newreg; Plane Surface(ps_side_dielectric1c) = {ll_side_dielectric1c};
ll_side_dielectric1d = newreg; Line Loop(ll_side_dielectric1d) = {-lconn5_3, lcpt19a, lsqt2, -lcpb19a};
ps_side_dielectric1d = newreg; Plane Surface(ps_side_dielectric1d) = {ll_side_dielectric1d};
ll_side_dielectric2a = newreg; Line Loop(ll_side_dielectric2a) = {lcpt14, -lcpb31, -lcpb14, lconn6_3};
ps_side_dielectric2a = newreg; Plane Surface(ps_side_dielectric2a) = {ll_side_dielectric2a};
ll_side_dielectric2b = newreg; Line Loop(ll_side_dielectric2b) = {lcpt15, lconn4_3, -lconn2_3, -lcpb15, -lconn6_3};
ps_side_dielectric2b = newreg; Plane Surface(ps_side_dielectric2b) = {ll_side_dielectric2b};
ll_side_dielectric3a = newreg; Line Loop(ll_side_dielectric3a) = {lcpt13, lcpb31, -lcpb13, lconn8_2};
ps_side_dielectric3a = newreg; Plane Surface(ps_side_dielectric3a) = {ll_side_dielectric3a};
ll_side_dielectric3b = newreg; Line Loop(ll_side_dielectric3b) = {-lconn8_2, lcpt12, lconn2_2, -lconn5_2, -lcpb12};
ps_side_dielectric3b = newreg; Plane Surface(ps_side_dielectric3b) = {ll_side_dielectric3b};
ll_side_dielectric4a = newreg; Line Loop(ll_side_dielectric4a) = {lcpt10, lconn4_2, -lconn1_2, -lcpb10, lconn7_2};
ps_side_dielectric4a = newreg; Plane Surface(ps_side_dielectric4a) = {ll_side_dielectric4a};
ll_side_dielectric4b = newreg; Line Loop(ll_side_dielectric4b) = {-lconn7_2, lcpt9, -lcpb32, -lcpb9};
ps_side_dielectric4b = newreg; Plane Surface(ps_side_dielectric4b) = {ll_side_dielectric4b};

ll_side_dielectric5a = newreg; Line Loop(ll_side_dielectric5a) = {lcpt8, lcpb32, -lcpb8, -lconn5_1};
ps_side_dielectric5a = newreg; Plane Surface(ps_side_dielectric5a) = {ll_side_dielectric5a};
ll_side_dielectric5b = newreg; Line Loop(ll_side_dielectric5b) = {lcpt7, lconn5_1, -lcpb7, lconn2_1, -lconn4_1};
ps_side_dielectric5b = newreg; Plane Surface(ps_side_dielectric5b) = {ll_side_dielectric5b};

// *************************************************
// Top and bottom
// *************************************************

ll_top_dielectric = newreg; Line Loop(ll_top_dielectric) = {lcpt9, cbue1_2, cbue2_2, lcpt13, lcpt14, cbue1_3, lcpt19a, lcpt19b, -cbue1_1, lcpt8};
ps_top_dielectric = newreg; Plane Surface(ps_top_dielectric) = {ll_top_dielectric};
ll_bottom_dielectric = newreg; Line Loop(ll_bottom_dielectric) = {-lcpb19a, -lcpb19b, ctle1_1, -lcpb8, -lcpb9, -ctle1_2, -ctle2_2, -lcpb13, -lcpb14, -ctle1_3};
ps_bottom_dielectric = newreg; Plane Surface(ps_bottom_dielectric) = {ll_bottom_dielectric};


// *************************************************
// 2 Gem
// *************************************************

// Copper plate surfaces
llcp_up_rim12_2 = newreg; Line Loop(llcp_up_rim12_2) = {-lue12_2, -cbue12_2, lue32_2, ctue12_2};
rscp_up_rim12_2 = newreg; Ruled Surface(rscp_up_rim12_2) = {llcp_up_rim12_2};
llcp_up_rim22_2 = newreg; Line Loop(llcp_up_rim22_2) = {lue22_2, -1*cbue22_2, -1*lue32_2, ctue22_2};
rscp_up_rim22_2 = newreg; Ruled Surface(rscp_up_rim22_2) = {llcp_up_rim22_2};


llcp_up_rim2_1 = newreg; Line Loop(llcp_up_rim2_1) = {lcpt29_2, cbue12_1, -lcpt28_2, -ctue12_1};
rscp_up_rim2_1 = newreg; Ruled Surface(rscp_up_rim2_1) = {llcp_up_rim2_1};
llcp_up_rim2_3 = newreg; Line Loop(llcp_up_rim2_3) = {lcpt27_2, -cbue12_3, -lcpt26_2, ctue12_3};
rscp_up_rim2_3 = newreg; Ruled Surface(rscp_up_rim2_3) = {llcp_up_rim2_3};




llcp_up_border12 = newreg; Line Loop(llcp_up_border12) = {lcpt26_2, -lcpt14_2, -lcpt22_2, -lcpt4_2};
pscp_up_border12 = newreg; Plane Surface(pscp_up_border12) = {llcp_up_border12};
llcp_up_border22 = newreg; Line Loop(llcp_up_border22) = {lue12_2, -lcpt9_2, -lcpt23_2, -lcpt1_2};
pscp_up_border22 = newreg; Plane Surface(pscp_up_border22) = {llcp_up_border22};
llcp_up_border32 = newreg; Line Loop(llcp_up_border32) = {-lcpt2_2, -lcpt29_2, -lcpt8_2, lcpt23_2};
pscp_up_border32 = newreg; Plane Surface(pscp_up_border32) = {llcp_up_border32};
llcp_up_border42a = newreg; Line Loop(llcp_up_border42a) = {-lcpt3_2b, -lcpt27_2, -lcpt19_2a, lsqt12};
pscp_up_border42a = newreg; Plane Surface(pscp_up_border42a) = {llcp_up_border42a};
llcp_up_border42b = newreg; Line Loop(llcp_up_border42b) = {-lcpt3_2a, lcpt28_2, -lcpt19_2b, -lsqt12};
pscp_up_border42b = newreg; Plane Surface(pscp_up_border42b) = {llcp_up_border42b};
llcp_up_border52 = newreg; Line Loop(llcp_up_border52) = {-lcpt5_2, -lue22_2, -lcpt13_2, lcpt22_2};
pscp_up_border52 = newreg; Plane Surface(pscp_up_border52) = {llcp_up_border52};

llcp_low_rim12_2 = newreg; Line Loop(llcp_low_rim12_2) = {-lle12_2, ctle12_2, lle32_2, -cble12_2};
rscp_low_rim12_2 = newreg; Ruled Surface(rscp_low_rim12_2) = {llcp_low_rim12_2};
llcp_low_rim22_2 = newreg; Line Loop(llcp_low_rim22_2) = {lle22_2, ctle22_2, -lle32_2, -cble22_2};
rscp_low_rim22_2 = newreg; Ruled Surface(rscp_low_rim22_2) = {llcp_low_rim22_2};

llcp_low_rim2_1 = newreg; Line Loop(llcp_low_rim2_1) = {lcpb29_2, -ctle12_1, -lcpb28_2, cble12_1};
rscp_low_rim2_1 = newreg; Ruled Surface(rscp_low_rim2_1) = {llcp_low_rim2_1};
llcp_low_rim2_3 = newreg; Line Loop(llcp_low_rim2_3) = {lcpb27_2, ctle12_3, -lcpb26_2, -cble12_3};
rscp_low_rim2_3 = newreg; Ruled Surface(rscp_low_rim2_3) = {llcp_low_rim2_3};

llcp_low_border12 = newreg; Line Loop(llcp_low_border12) = {lcpb26_2, lcpb14_2, -lcpb22_2, lcpb4_2};
pscp_low_border12 = newreg; Plane Surface(pscp_low_border12) = {llcp_low_border12};
llcp_low_border22 = newreg; Line Loop(llcp_low_border22) = {lle12_2, lcpb9_2, -lcpb23_2, lcpb1_2};
pscp_low_border22 = newreg; Plane Surface(pscp_low_border22) = {llcp_low_border22};
llcp_low_border32 = newreg; Line Loop(llcp_low_border32) = {lcpb2_2, -lcpb29_2, lcpb8_2, lcpb23_2};
pscp_low_border32 = newreg; Plane Surface(pscp_low_border32) = {llcp_low_border32};
llcp_low_border42a = newreg; Line Loop(llcp_low_border42a) = {lcpb19_2a, lsqt32, lcpb3_2b, -lcpb27_2};
pscp_low_border42a = newreg; Plane Surface(pscp_low_border42a) = {llcp_low_border42a};
llcp_low_border42b = newreg; Line Loop(llcp_low_border42b) = {lcpb19_2b, lcpb28_2, lcpb3_2a, -lsqt32};
pscp_low_border42b = newreg; Plane Surface(pscp_low_border42b) = {llcp_low_border42b};
llcp_low_border52 = newreg; Line Loop(llcp_low_border52) = {lcpb5_2, -lle22_2, lcpb13_2, lcpb22_2};
pscp_low_border52 = newreg; Plane Surface(pscp_low_border52) = {llcp_low_border52};

llcp_face12 = newreg; Line Loop(llcp_face12) = {lcpt2_2, ctue12_1, lcpt3_2a, lcpt3_2b, -1*ctue12_3, lcpt4_2, lcpt5_2, -1*ctue22_2, -1*ctue12_2, lcpt1_2};
pscp_face12 = newreg; Plane Surface(pscp_face12) = {llcp_face12};
llcp_face22 = newreg; Line Loop(llcp_face22) = {-lcpb1_2, -lcpb2_2, -cble12_1, -lcpb3_2a, -lcpb3_2b, cble12_3, -lcpb4_2, -lcpb5_2, cble22_2, cble12_2};
pscp_face22 = newreg; Plane Surface(pscp_face22) = {llcp_face22};

// Dielectric surfaces

ll_up_dielectric2_1 = newreg; Line Loop(ll_up_dielectric2_1) = {-lcpt7_2, -cbue12_1, -lcpt20_2, cth12_1};
ps_up_dielectric2_1 = newreg; Plane Surface(ps_up_dielectric2_1) = {ll_up_dielectric2_1};
ll_low_dielectric2_1 = newreg; Line Loop(ll_low_dielectric2_1) = {lcpb7_2, ctle12_1, lcpb20_2, -cbh12_1};
ps_low_dielectric2_1 = newreg; Plane Surface(ps_low_dielectric2_1) = {ll_low_dielectric2_1};

ll_up_dielectric2_2 = newreg; Line Loop(ll_up_dielectric2_2) = {-lcpt12_2, cbue22_2, cbue12_2, -lcpt10_2, -cth12_2, -cth22_2};
ps_up_dielectric2_2 = newreg; Plane Surface(ps_up_dielectric2_2) = {ll_up_dielectric2_2};
ll_low_dielectric2_2 = newreg; Line Loop(ll_low_dielectric2_2) = {lcpb12_2, -ctle22_2, -ctle12_2, lcpb10_2, cbh12_2, cbh22_2};
ps_low_dielectric2_2 = newreg; Plane Surface(ps_low_dielectric2_2) = {ll_low_dielectric2_2};

ll_up_dielectric2_3 = newreg; Line Loop(ll_up_dielectric2_3) = {-lcpt15_2, -cth12_3, -lcpt18_2, cbue12_3};
ps_up_dielectric2_3 = newreg; Plane Surface(ps_up_dielectric2_3) = {ll_up_dielectric2_3};
ll_low_dielectric2_3 = newreg; Line Loop(ll_low_dielectric2_3) = {lcpb15_2, cbh12_3, lcpb18_2, -ctle12_3};
ps_low_dielectric2_3 = newreg; Plane Surface(ps_low_dielectric2_3) = {ll_low_dielectric2_3};

//Cylinders


ll_cyl_dielectric12_21 = newreg; Line Loop(ll_cyl_dielectric12_21) = {lconn12_2, cch12_2, -lconn32_2, -cbh12_2};
rs_cyl_dielectric12_21 = newreg; Ruled Surface(rs_cyl_dielectric12_21) = {ll_cyl_dielectric12_21};
ll_cyl_dielectric12_22 = newreg; Line Loop(ll_cyl_dielectric12_22) = {lconn32_2, cch22_2, -lconn22_2, -cbh22_2};
rs_cyl_dielectric12_22 = newreg; Ruled Surface(rs_cyl_dielectric12_22) = {ll_cyl_dielectric12_22};


ll_cyl_dielectric22_21 = newreg; Line Loop(ll_cyl_dielectric22_21) = {cth12_2, -lconn42_2, -cch12_2, lconn62_2};
rs_cyl_dielectric22_21 = newreg; Ruled Surface(rs_cyl_dielectric22_21) = {ll_cyl_dielectric22_21};
ll_cyl_dielectric22_22 = newreg; Line Loop(ll_cyl_dielectric22_22) = {cth22_2, -lconn62_2, -cch22_2, lconn52_2};
rs_cyl_dielectric22_22 = newreg; Ruled Surface(rs_cyl_dielectric22_22) = {ll_cyl_dielectric22_22};

ll_cyl_dielectric32_1 = newreg; Line Loop(ll_cyl_dielectric32_1) = {lconn12_3, cbh12_3, -lconn22_3, -cch12_3};
rs_cyl_dielectric32_1 = newreg; Ruled Surface(rs_cyl_dielectric32_1) = {ll_cyl_dielectric32_1};
ll_cyl_dielectric32_2 = newreg; Line Loop(ll_cyl_dielectric32_2) = {lconn32_3, cth12_3, -lconn42_3, -cch12_3};
rs_cyl_dielectric32_2 = newreg; Ruled Surface(rs_cyl_dielectric32_2) = {ll_cyl_dielectric32_2};


ll_cyl_dielectric12_1 = newreg; Line Loop(ll_cyl_dielectric12_1) = {lconn12_1, -cch12_1, -lconn22_1, cbh12_1};
rs_cyl_dielectric12_1 = newreg; Ruled Surface(rs_cyl_dielectric12_1) = {ll_cyl_dielectric12_1};
ll_cyl_dielectric12_2 = newreg; Line Loop(ll_cyl_dielectric12_2) = {lconn32_1, -cch12_1, -lconn42_1, cth12_1};
rs_cyl_dielectric12_2 = newreg; Ruled Surface(rs_cyl_dielectric12_2) = {ll_cyl_dielectric12_2};

// ************************************
// Sides
// ************************************

ll_side_dielectric12a = newreg; Line Loop(ll_side_dielectric12a) = {lconn12_1, -lconn32_1, -lcpt20_2, lconn62_1, lcpb20_2};
ps_side_dielectric12a = newreg; Plane Surface(ps_side_dielectric12a) = {ll_side_dielectric12a};
ll_side_dielectric12b = newreg; Line Loop(ll_side_dielectric12b) = {lconn62_1, lcpt19_2b, -lsqt22, -lcpb19_2b};
ps_side_dielectric12b = newreg; Plane Surface(ps_side_dielectric12b) = {ll_side_dielectric12b};
ll_side_dielectric12c = newreg; Line Loop(ll_side_dielectric12c) = {lconn12_3, -lconn32_3, lcpt18_2, lconn52_3, -lcpb18_2};
ps_side_dielectric12c = newreg; Plane Surface(ps_side_dielectric12c) = {ll_side_dielectric12c};
ll_side_dielectric12d = newreg; Line Loop(ll_side_dielectric12d) = {-lconn52_3, lcpt19_2a, lsqt22, -lcpb19_2a};
ps_side_dielectric12d = newreg; Plane Surface(ps_side_dielectric12d) = {ll_side_dielectric12d};
ll_side_dielectric22a = newreg; Line Loop(ll_side_dielectric22a) = {lcpt14_2, -lcpb31_2, -lcpb14_2, lconn62_3};
ps_side_dielectric22a = newreg; Plane Surface(ps_side_dielectric22a) = {ll_side_dielectric22a};
ll_side_dielectric22b = newreg; Line Loop(ll_side_dielectric22b) = {lcpt15_2, lconn42_3, -lconn22_3, -lcpb15_2, -lconn62_3};
ps_side_dielectric22b = newreg; Plane Surface(ps_side_dielectric22b) = {ll_side_dielectric22b};
ll_side_dielectric32a = newreg; Line Loop(ll_side_dielectric32a) = {lcpt13_2, lcpb31_2, -lcpb13_2, lconn82_2};
ps_side_dielectric32a = newreg; Plane Surface(ps_side_dielectric32a) = {ll_side_dielectric32a};
ll_side_dielectric32b = newreg; Line Loop(ll_side_dielectric32b) = {-lconn82_2, lcpt12_2, lconn22_2, -lconn52_2, -lcpb12_2};
ps_side_dielectric32b = newreg; Plane Surface(ps_side_dielectric32b) = {ll_side_dielectric32b};
ll_side_dielectric42a = newreg; Line Loop(ll_side_dielectric42a) = {lcpt10_2, lconn42_2, -lconn12_2, -lcpb10_2, lconn72_2};
ps_side_dielectric42a = newreg; Plane Surface(ps_side_dielectric42a) = {ll_side_dielectric42a};
ll_side_dielectric42b = newreg; Line Loop(ll_side_dielectric42b) = {-lconn72_2, lcpt9_2, -lcpb32_2, -lcpb9_2};
ps_side_dielectric42b = newreg; Plane Surface(ps_side_dielectric42b) = {ll_side_dielectric42b};
ll_side_dielectric52a = newreg; Line Loop(ll_side_dielectric52a) = {lcpt8_2, lcpb32_2, -lcpb8_2, -lconn52_1};
ps_side_dielectric52a = newreg; Plane Surface(ps_side_dielectric52a) = {ll_side_dielectric52a};
ll_side_dielectric52b = newreg; Line Loop(ll_side_dielectric52b) = {lcpt7_2, lconn52_1, -lcpb7_2, lconn22_1, -lconn42_1};
ps_side_dielectric52b = newreg; Plane Surface(ps_side_dielectric52b) = {ll_side_dielectric52b};



// ****************************************
// Top and bottom
// ****************************************

ll_top_dielectric2 = newreg; Line Loop(ll_top_dielectric2) = {lcpt9_2, cbue12_2, cbue22_2, lcpt13_2, lcpt14_2, cbue12_3, lcpt19_2a, lcpt19_2b, -cbue12_1, lcpt8_2};
ps_top_dielectric2 = newreg; Plane Surface(ps_top_dielectric2) = {ll_top_dielectric2};
ll_bottom_dielectric2 = newreg; Line Loop(ll_bottom_dielectric2) = {-lcpb19_2a, -lcpb19_2b, ctle12_1, -lcpb8_2, -lcpb9_2, -ctle12_2, -ctle22_2, -lcpb13_2, -lcpb14_2, -ctle12_3};
ps_bottom_dielectric2 = newreg; Plane Surface(ps_bottom_dielectric2) = {ll_bottom_dielectric2};


// *************************************************
// 3 Gem
// *************************************************

// Copper plate surfaces
llcp_up_rim13_2 = newreg; Line Loop(llcp_up_rim13_2) = {-lue13_2, -cbue13_2, lue33_2, ctue13_2};
rscp_up_rim13_2 = newreg; Ruled Surface(rscp_up_rim13_2) = {llcp_up_rim13_2};
llcp_up_rim23_2 = newreg; Line Loop(llcp_up_rim23_2) = {lue23_2, -1*cbue23_2, -1*lue33_2, ctue23_2};
rscp_up_rim23_2 = newreg; Ruled Surface(rscp_up_rim23_2) = {llcp_up_rim23_2};

llcp_up_rim3_1 = newreg; Line Loop(llcp_up_rim3_1) = {lcpt29_3, cbue13_1, -lcpt28_3, -ctue13_1};
rscp_up_rim3_1 = newreg; Ruled Surface(rscp_up_rim3_1) = {llcp_up_rim3_1};
llcp_up_rim3_3 = newreg; Line Loop(llcp_up_rim3_3) = {lcpt27_3, -cbue13_3, -lcpt26_3, ctue13_3};
rscp_up_rim3_3 = newreg; Ruled Surface(rscp_up_rim3_3) = {llcp_up_rim3_3};

// ***************************************************


llcp_up_border13 = newreg; Line Loop(llcp_up_border13) = {lcpt26_3, -lcpt14_3, -lcpt22_3, -lcpt4_3};
pscp_up_border13 = newreg; Plane Surface(pscp_up_border13) = {llcp_up_border13};
llcp_up_border23 = newreg; Line Loop(llcp_up_border23) = {lue13_2, -lcpt9_3, -lcpt23_3, -lcpt1_3};
pscp_up_border23 = newreg; Plane Surface(pscp_up_border23) = {llcp_up_border23};
llcp_up_border33 = newreg; Line Loop(llcp_up_border33) = {-lcpt2_3, -lcpt29_3, -lcpt8_3, lcpt23_3};
pscp_up_border33 = newreg; Plane Surface(pscp_up_border33) = {llcp_up_border33};
llcp_up_border43a = newreg; Line Loop(llcp_up_border43a) = {-lcpt3_3b, -lcpt27_3, -lcpt19_3a, lsqt13};
pscp_up_border43a = newreg; Plane Surface(pscp_up_border43a) = {llcp_up_border43a};
llcp_up_border43b = newreg; Line Loop(llcp_up_border43b) = {-lcpt3_3a, lcpt28_3, -lcpt19_3b, -lsqt13};
pscp_up_border43b = newreg; Plane Surface(pscp_up_border43b) = {llcp_up_border43b};
llcp_up_border53 = newreg; Line Loop(llcp_up_border53) = {-lcpt5_3, -lue23_2, -lcpt13_3, lcpt22_3};
pscp_up_border53 = newreg; Plane Surface(pscp_up_border53) = {llcp_up_border53};

llcp_low_rim13_2 = newreg; Line Loop(llcp_low_rim13_2) = {-lle13_2, ctle13_2, lle33_2, -cble13_2};
rscp_low_rim13_2 = newreg; Ruled Surface(rscp_low_rim13_2) = {llcp_low_rim13_2};
llcp_low_rim23_2 = newreg; Line Loop(llcp_low_rim23_2) = {lle23_2, ctle23_2, -lle33_2, -cble23_2};
rscp_low_rim23_2 = newreg; Ruled Surface(rscp_low_rim23_2) = {llcp_low_rim23_2};

llcp_low_rim3_1 = newreg; Line Loop(llcp_low_rim3_1) = {lcpb29_3, -ctle13_1, -lcpb28_3, cble13_1};
rscp_low_rim3_1 = newreg; Ruled Surface(rscp_low_rim3_1) = {llcp_low_rim3_1};
llcp_low_rim3_3 = newreg; Line Loop(llcp_low_rim3_3) = {lcpb27_3, ctle13_3, -lcpb26_3, -cble13_3};
rscp_low_rim3_3 = newreg; Ruled Surface(rscp_low_rim3_3) = {llcp_low_rim3_3};

llcp_low_border13 = newreg; Line Loop(llcp_low_border13) = {lcpb26_3, lcpb14_3, -lcpb22_3, lcpb4_3};
pscp_low_border13 = newreg; Plane Surface(pscp_low_border13) = {llcp_low_border13};
llcp_low_border23 = newreg; Line Loop(llcp_low_border23) = {lle13_2, lcpb9_3, -lcpb23_3, lcpb1_3};
pscp_low_border23 = newreg; Plane Surface(pscp_low_border23) = {llcp_low_border23};
llcp_low_border33 = newreg; Line Loop(llcp_low_border33) = {lcpb2_3, -lcpb29_3, lcpb8_3, lcpb23_3};
pscp_low_border33 = newreg; Plane Surface(pscp_low_border33) = {llcp_low_border33};
llcp_low_border43a = newreg; Line Loop(llcp_low_border43a) = {lcpb19_3a, lsqt33, lcpb3_3b, -lcpb27_3};
pscp_low_border43a = newreg; Plane Surface(pscp_low_border43a) = {llcp_low_border43a};
llcp_low_border43b = newreg; Line Loop(llcp_low_border43b) = {lcpb19_3b, lcpb28_3, lcpb3_3a, -lsqt33};
pscp_low_border43b = newreg; Plane Surface(pscp_low_border43b) = {llcp_low_border43b};
llcp_low_border53 = newreg; Line Loop(llcp_low_border53) = {lcpb5_3, -lle23_2, lcpb13_3, lcpb22_3};
pscp_low_border53 = newreg; Plane Surface(pscp_low_border53) = {llcp_low_border53};

llcp_face13 = newreg; Line Loop(llcp_face13) = {lcpt2_3, ctue13_1, lcpt3_3a, lcpt3_3b, -1*ctue13_3, lcpt4_3, lcpt5_3, -1*ctue23_2, -1*ctue13_2, lcpt1_3};
pscp_face13 = newreg; Plane Surface(pscp_face13) = {llcp_face13};
llcp_face23 = newreg; Line Loop(llcp_face23) = {-lcpb1_3, -lcpb2_3, -cble13_1, -lcpb3_3a, -lcpb3_3b, cble13_3, -lcpb4_3, -lcpb5_3, cble23_2, cble13_2};
pscp_face23 = newreg; Plane Surface(pscp_face23) = {llcp_face23};

// Dielectric surfaces

ll_up_dielectric3_1 = newreg; Line Loop(ll_up_dielectric3_1) = {-lcpt7_3, -cbue13_1, -lcpt20_3, cth13_1};
ps_up_dielectric3_1 = newreg; Plane Surface(ps_up_dielectric3_1) = {ll_up_dielectric3_1};
ll_low_dielectric3_1 = newreg; Line Loop(ll_low_dielectric3_1) = {lcpb7_3, ctle13_1, lcpb20_3, -cbh13_1};
ps_low_dielectric3_1 = newreg; Plane Surface(ps_low_dielectric3_1) = {ll_low_dielectric3_1};

ll_up_dielectric3_2 = newreg; Line Loop(ll_up_dielectric3_2) = {-lcpt12_3, cbue23_2, cbue13_2, -lcpt10_3, -cth13_2, -cth23_2};
ps_up_dielectric3_2 = newreg; Plane Surface(ps_up_dielectric3_2) = {ll_up_dielectric3_2};
ll_low_dielectric3_2 = newreg; Line Loop(ll_low_dielectric3_2) = {lcpb12_3, -ctle23_2, -ctle13_2, lcpb10_3, cbh13_2, cbh23_2};
ps_low_dielectric3_2 = newreg; Plane Surface(ps_low_dielectric3_2) = {ll_low_dielectric3_2};

ll_up_dielectric3_3 = newreg; Line Loop(ll_up_dielectric3_3) = {-lcpt15_3, -cth13_3, -lcpt18_3, cbue13_3};
ps_up_dielectric3_3 = newreg; Plane Surface(ps_up_dielectric3_3) = {ll_up_dielectric3_3};
ll_low_dielectric3_3 = newreg; Line Loop(ll_low_dielectric3_3) = {lcpb15_3, cbh13_3, lcpb18_3, -ctle13_3};
ps_low_dielectric3_3 = newreg; Plane Surface(ps_low_dielectric3_3) = {ll_low_dielectric3_3};

//Cylinders


ll_cyl_dielectric13_21 = newreg; Line Loop(ll_cyl_dielectric13_21) = {lconn13_2, cch13_2, -lconn33_2, -cbh13_2};
rs_cyl_dielectric13_21 = newreg; Ruled Surface(rs_cyl_dielectric13_21) = {ll_cyl_dielectric13_21};
ll_cyl_dielectric13_22 = newreg; Line Loop(ll_cyl_dielectric13_22) = {lconn33_2, cch23_2, -lconn23_2, -cbh23_2};
rs_cyl_dielectric13_22 = newreg; Ruled Surface(rs_cyl_dielectric13_22) = {ll_cyl_dielectric13_22};
ll_cyl_dielectric23_21 = newreg; Line Loop(ll_cyl_dielectric23_21) = {cth13_2, -lconn43_2, -cch13_2, lconn63_2};
rs_cyl_dielectric23_21 = newreg; Ruled Surface(rs_cyl_dielectric23_21) = {ll_cyl_dielectric23_21};
ll_cyl_dielectric23_22 = newreg; Line Loop(ll_cyl_dielectric23_22) = {cth23_2, -lconn63_2, -cch23_2, lconn53_2};
rs_cyl_dielectric23_22 = newreg; Ruled Surface(rs_cyl_dielectric23_22) = {ll_cyl_dielectric23_22};
ll_cyl_dielectric33_1 = newreg; Line Loop(ll_cyl_dielectric33_1) = {lconn13_3, cbh13_3, -lconn23_3, -cch13_3};
rs_cyl_dielectric33_1 = newreg; Ruled Surface(rs_cyl_dielectric33_1) = {ll_cyl_dielectric33_1};
ll_cyl_dielectric33_2 = newreg; Line Loop(ll_cyl_dielectric33_2) = {lconn33_3, cth13_3, -lconn43_3, -cch13_3};
rs_cyl_dielectric33_2 = newreg; Ruled Surface(rs_cyl_dielectric33_2) = {ll_cyl_dielectric33_2};
ll_cyl_dielectric13_1 = newreg; Line Loop(ll_cyl_dielectric13_1) = {lconn13_1, -cch13_1, -lconn23_1, cbh13_1};
rs_cyl_dielectric13_1 = newreg; Ruled Surface(rs_cyl_dielectric13_1) = {ll_cyl_dielectric13_1};
ll_cyl_dielectric13_2 = newreg; Line Loop(ll_cyl_dielectric13_2) = {lconn33_1, -cch13_1, -lconn43_1, cth13_1};
rs_cyl_dielectric13_2 = newreg; Ruled Surface(rs_cyl_dielectric13_2) = {ll_cyl_dielectric13_2};

// ****************************************
// Sides
// ****************************************

ll_side_dielectric13a = newreg; Line Loop(ll_side_dielectric13a) = {lconn13_1, -lconn33_1, -lcpt20_3, lconn63_1, lcpb20_3};
ps_side_dielectric13a = newreg; Plane Surface(ps_side_dielectric13a) = {ll_side_dielectric13a};
ll_side_dielectric13b = newreg; Line Loop(ll_side_dielectric13b) = {lconn63_1, lcpt19_3b, -lsqt23, -lcpb19_3b};
ps_side_dielectric13b = newreg; Plane Surface(ps_side_dielectric13b) = {ll_side_dielectric13b};
ll_side_dielectric13c = newreg; Line Loop(ll_side_dielectric13c) = {lconn13_3, -lconn33_3, lcpt18_3, lconn53_3, -lcpb18_3};
ps_side_dielectric13c = newreg; Plane Surface(ps_side_dielectric13c) = {ll_side_dielectric13c};
ll_side_dielectric13d = newreg; Line Loop(ll_side_dielectric13d) = {-lconn53_3, lcpt19_3a, lsqt23, -lcpb19_3a};
ps_side_dielectric13d = newreg; Plane Surface(ps_side_dielectric13d) = {ll_side_dielectric13d};
ll_side_dielectric23a = newreg; Line Loop(ll_side_dielectric23a) = {lcpt14_3, -lcpb31_3, -lcpb14_3, lconn63_3};
ps_side_dielectric23a = newreg; Plane Surface(ps_side_dielectric23a) = {ll_side_dielectric23a};
ll_side_dielectric23b = newreg; Line Loop(ll_side_dielectric23b) = {lcpt15_3, lconn43_3, -lconn23_3, -lcpb15_3, -lconn63_3};
ps_side_dielectric23b = newreg; Plane Surface(ps_side_dielectric23b) = {ll_side_dielectric23b};
ll_side_dielectric33a = newreg; Line Loop(ll_side_dielectric33a) = {lcpt13_3, lcpb31_3, -lcpb13_3, lconn83_2};
ps_side_dielectric33a = newreg; Plane Surface(ps_side_dielectric33a) = {ll_side_dielectric33a};
ll_side_dielectric33b = newreg; Line Loop(ll_side_dielectric33b) = {-lconn83_2, lcpt12_3, lconn23_2, -lconn53_2, -lcpb12_3};
ps_side_dielectric33b = newreg; Plane Surface(ps_side_dielectric33b) = {ll_side_dielectric33b};
ll_side_dielectric43a = newreg; Line Loop(ll_side_dielectric43a) = {lcpt10_3, lconn43_2, -lconn13_2, -lcpb10_3, lconn73_2};
ps_side_dielectric43a = newreg; Plane Surface(ps_side_dielectric43a) = {ll_side_dielectric43a};
ll_side_dielectric43b = newreg; Line Loop(ll_side_dielectric43b) = {-lconn73_2, lcpt9_3, -lcpb32_3, -lcpb9_3};
ps_side_dielectric43b = newreg; Plane Surface(ps_side_dielectric43b) = {ll_side_dielectric43b};
ll_side_dielectric53a = newreg; Line Loop(ll_side_dielectric53a) = {lcpt8_3, lcpb32_3, -lcpb8_3, -lconn53_1};
ps_side_dielectric53a = newreg; Plane Surface(ps_side_dielectric53a) = {ll_side_dielectric53a};
ll_side_dielectric53b = newreg; Line Loop(ll_side_dielectric53b) = {lcpt7_3, lconn53_1, -lcpb7_3, lconn23_1, -lconn43_1};
ps_side_dielectric53b = newreg; Plane Surface(ps_side_dielectric53b) = {ll_side_dielectric53b};

// ****************************************
// Top and bottom
// ****************************************

ll_top_dielectric3 = newreg; Line Loop(ll_top_dielectric3) = {lcpt9_3, cbue13_2, cbue23_2, lcpt13_3, lcpt14_3, cbue13_3, lcpt19_3a, lcpt19_3b, -cbue13_1, lcpt8_3};
ps_top_dielectric3 = newreg; Plane Surface(ps_top_dielectric3) = {ll_top_dielectric3};
ll_bottom_dielectric3 = newreg; Line Loop(ll_bottom_dielectric3) = {-lcpb19_3a, -lcpb19_3b, ctle13_1, -lcpb8_3, -lcpb9_3, -ctle13_2, -ctle23_2, -lcpb13_3, -lcpb14_3, -ctle13_3};
ps_bottom_dielectric3 = newreg; Plane Surface(ps_bottom_dielectric3) = {ll_bottom_dielectric3};


// Bounding surfaces

// ***************************
// First
// ***************************


ll_bsurf1 = newreg; Line Loop(ll_bsurf1) = {-lconn1_3, lconn3_3, lcpt17, -lcpb33, -lcpb17};
ps_bsurf1 = newreg; Plane Surface(ps_bsurf1) = {ll_bsurf1};
ll_bsurf2 = newreg; Line Loop(ll_bsurf2) = {lcpb33, -lcpb16, lconn2_3, -lconn4_3, lcpt16};
ps_bsurf2 = newreg; Plane Surface(ps_bsurf2) = {ll_bsurf2};

ll_bsurf3a = newreg; Line Loop(ll_bsurf3a) = {lconn1_2, -lconn4_2, lcpt11a, lshalf2, -lcpb11a};
ps_bsurf3a = newreg; Plane Surface(ps_bsurf3a) = {ll_bsurf3a};
ll_bsurf3b = newreg; Line Loop(ll_bsurf3b) = {lconn5_2, -lconn2_2, lcpt11b, -lshalf2, -lcpb11b};
ps_bsurf3b = newreg; Plane Surface(ps_bsurf3b) = {ll_bsurf3b};

ll_bsurf4 = newreg; Line Loop(ll_bsurf4) = {lcpt6, lconn4_1, -lconn2_1, -lcpb6, -lcpb30};
ps_bsurf4 = newreg; Plane Surface(ps_bsurf4) = {ll_bsurf4};
ll_bsurf5 = newreg; Line Loop(ll_bsurf5) = {lcpt21, lcpb30, -lcpb21, lconn1_1, -lconn3_1};
ps_bsurf5 = newreg; Plane Surface(ps_bsurf5) = {ll_bsurf5};

// ***************************
// Second
// ***************************

ll_bsurf12g = newreg; Line Loop(ll_bsurf12g) = {-lconn12_3, lconn32_3, lcpt17_2, -lcpb33_2, -lcpb17_2};
ps_bsurf12g = newreg; Plane Surface(ps_bsurf12g) = {ll_bsurf12g};
ll_bsurf22 = newreg; Line Loop(ll_bsurf22) = {lcpb33_2, -lcpb16_2, lconn22_3, -lconn42_3, lcpt16_2};
ps_bsurf22 = newreg; Plane Surface(ps_bsurf22) = {ll_bsurf22};

ll_bsurf32a = newreg; Line Loop(ll_bsurf32a) = {lconn12_2, -lconn42_2, lcpt11_2a, lshalf22, -lcpb11_2a};
ps_bsurf32a = newreg; Plane Surface(ps_bsurf32a) = {ll_bsurf32a};
ll_bsurf32b = newreg; Line Loop(ll_bsurf32b) = {lconn52_2, -lconn22_2, lcpt11_2b, -lshalf22, -lcpb11_2b};
ps_bsurf32b = newreg; Plane Surface(ps_bsurf32b) = {ll_bsurf32b};

ll_bsurf42 = newreg; Line Loop(ll_bsurf42) = {lcpt6_2, lconn42_1, -lconn22_1, -lcpb6_2, -lcpb30_2};
ps_bsurf42 = newreg; Plane Surface(ps_bsurf42) = {ll_bsurf42};
ll_bsurf52 = newreg; Line Loop(ll_bsurf52) = {lcpt21_2, lcpb30_2, -lcpb21_2, lconn12_1, -lconn32_1};
ps_bsurf52 = newreg; Plane Surface(ps_bsurf52) = {ll_bsurf52};


// ***************************
// Third
// ***************************

ll_bsurf13 = newreg; Line Loop(ll_bsurf13) = {-lconn13_3, lconn33_3, lcpt17_3, -lcpb33_3, -lcpb17_3};
ps_bsurf13 = newreg; Plane Surface(ps_bsurf13) = {ll_bsurf13};
ll_bsurf23 = newreg; Line Loop(ll_bsurf23) = {lcpb33_3, -lcpb16_3, lconn23_3, -lconn43_3, lcpt16_3};
ps_bsurf23 = newreg; Plane Surface(ps_bsurf23) = {ll_bsurf23};

ll_bsurf33a = newreg; Line Loop(ll_bsurf33a) = {lconn13_2, -lconn43_2, lcpt11_3a, lshalf23, -lcpb11_3a};
ps_bsurf33a = newreg; Plane Surface(ps_bsurf33a) = {ll_bsurf33a};
ll_bsurf33b = newreg; Line Loop(ll_bsurf33b) = {lconn53_2, -lconn23_2, lcpt11_3b, -lshalf23, -lcpb11_3b};
ps_bsurf33b = newreg; Plane Surface(ps_bsurf33b) = {ll_bsurf33b};

ll_bsurf43 = newreg; Line Loop(ll_bsurf43) = {lcpt6_3, lconn43_1, -lconn23_1, -lcpb6_3, -lcpb30_3};
ps_bsurf43 = newreg; Plane Surface(ps_bsurf43) = {ll_bsurf43};
ll_bsurf53 = newreg; Line Loop(ll_bsurf53) = {lcpt21_3, lcpb30_3, -lcpb21_3, lconn13_1, -lconn33_1};
ps_bsurf53 = newreg; Plane Surface(ps_bsurf53) = {ll_bsurf53};

// ****************************


//ll_bsurf6a = newreg; Line Loop(ll_bsurf6a) = {-lexet1, -lexetc2, -lshalf13, -lcpt11_3b, -lcpt12_3, lue23_2, lcpt5_3, lexetc1};
//ps_bsurf6a = newreg; Plane Surface(ps_bsurf6a) = {ll_bsurf6a};
//ll_bsurf6b = newreg; Line Loop(ll_bsurf6b) = {-lexet2, -lexetc3, lcpt1_3, -lue13_2, -lcpt10_3, -lcpt11_3a, lshalf13, lexetc2};
//ps_bsurf6b = newreg; Plane Surface(ps_bsurf6b) = {ll_bsurf6b};
//ll_bsurf7a = newreg; Line Loop(ll_bsurf7a) = {-lexet5, -lexetc6, -lcpt25_3, -lcpt17_3, -lcpt18_3, lcpt27_3, lcpt3_3b, lexetc5};
//ps_bsurf7a = newreg; Plane Surface(ps_bsurf7a) = {ll_bsurf7a};
//ll_bsurf7b = newreg; Line Loop(ll_bsurf7b) = {-lexet4, lexetc4, lcpt24_3, -lcpt21_3, -lcpt20_3, -lcpt28_3, lcpt3_3a, -lexetc5};
//ps_bsurf7b = newreg; Plane Surface(ps_bsurf7b) = {ll_bsurf7b};
//ll_bsurf8 = newreg; Line Loop(ll_bsurf8) = {-lexetc4, -lcpt24_3, -lcpt6_3, -lcpt7_3, lcpt29_3, lcpt2_3, lexetc3, -lexet3};
//ps_bsurf8 = newreg; Plane Surface(ps_bsurf8) = {ll_bsurf8};
//ll_bsurf9 = newreg; Line Loop(ll_bsurf9) = {lexet1, lexet2, lexet3, lexet4, lexet5, lexet6};
//ps_bsurf9 = newreg; Plane Surface(ps_bsurf9) = {ll_bsurf9};


//ll_bsurf10 = newreg; Line Loop(ll_bsurf10) = {-lexebc6, lcpb25_2, lcpb16_2, lcpb15_2, -lcpb26_2, -lcpb4_2, lexebc1, lexeb6};
//ps_bsurf10 = newreg; Plane Surface(ps_bsurf10) = {ll_bsurf10};
//ll_bsurf11a = newreg; Line Loop(ll_bsurf11a) = {-lexebc5, -lcpb3_2b, lcpb27_2, lcpb18_2, lcpb17_2, -lcpb25_2, lexebc6, lexeb5};
//ps_bsurf11a = newreg; Plane Surface(ps_bsurf11a) = {ll_bsurf11a};
//ll_bsurf11b = newreg; Line Loop(ll_bsurf11b) = {lexebc5, -lcpb3_2a, -lcpb28_2, lcpb20_2, lcpb21_2, lcpb24_2, -lexebc4, lexeb4};
//ps_bsurf11b = newreg; Plane Surface(ps_bsurf11b) = {ll_bsurf11b};
//ll_bsurf12 = newreg; Line Loop(ll_bsurf12) = {-lexebc3, -lcpb2_2, lcpb29_2, lcpb7_2, lcpb6_2, -lcpb24_2, lexebc4, lexeb3};
//ps_bsurf12 = newreg; Plane Surface(ps_bsurf12) = {ll_bsurf12};
//ll_bsurf13a = newreg; Line Loop(ll_bsurf13a) = {lexeb1, lexebc2, -lshalf32, lcpb11_2b, lcpb12_2, lle22_2, -lcpb5_2, -lexebc1};
//ps_bsurf13a = newreg; Plane Surface(ps_bsurf13a) = {ll_bsurf13a};
//ll_bsurf13b = newreg; Line Loop(ll_bsurf13b) = {lexeb2, lexebc3, -lcpb1_2, -lle12_2, lcpb10_2, lcpb11_2a, lshalf32, -lexebc2};
//ps_bsurf13b = newreg; Plane Surface(ps_bsurf13b) = {ll_bsurf13b};
//ll_bsurf14 = newreg; Line Loop(ll_bsurf14) = {-lexeb1, -lexeb2, -lexeb3, -lexeb4, -lexeb5, -lexeb6};
//ps_bsurf14 = newreg; Plane Surface(ps_bsurf14) = {ll_bsurf14};
//ll_bsurf15 = newreg; Line Loop(ll_bsurf15) = {lexetc6, lcpt25_3, -lcpt16_3, -lcpt15_3, -lcpt26_3, lcpt4_3, -lexetc1, -lexet6};
//ps_bsurf15 = newreg; Plane Surface(ps_bsurf15) = {ll_bsurf15};


// *************************************************
// Connect gems
// *************************************************



// Connect the top electrode to the LEM.
//lexetc13 = newc; Line(lexetc13) = {pcpbl3_2, pcptu2};
//lexetc23 = newc; Line(lexetc23) = {pc43_2, pc3_2};
//lexetc33 = newc; Line(lexetc33) = {pcpbl3_3, pcptu3};
//lexetc43 = newc; Line(lexetc43) = {pc43_1, pc3_1};
//lexetc53 = newc; Line(lexetc53) = {pbmc3, ptmc};
//lexetc63 = newc; Line(lexetc63) = {pc43_3, pc3_3};

// Connect the bottom electrode to the LEM.
//lexebc12 = newc; Line(lexebc12) = {pcpbl2, pcptu2_2};
//lexebc22 = newc; Line(lexebc22) = {pc4_2, pc32_2};
//lexebc32 = newc; Line(lexebc32) = {pcpbl3, pcptu3_2};
//lexebc42 = newc; Line(lexebc42) = {pc4_1, pc32_1};
//lexebc52 = newc; Line(lexebc52) = {pbmc, ptmc2};
//lexebc62 = newc; Line(lexebc62) = {pc4_3, pc32_3};


//ll_bsurf62a = newreg; Line Loop(ll_bsurf62a) = {lcpb11_3b, lcpb12_3, lle23_2, -lcpb5_3, -lexetc23, -lshalf1, -lcpt11b, -lcpt12, lue2_2, lcpt5, lexetc13, lshalf};
//ps_bsurf62a = newreg; Plane Surface(ps_bsurf62a) = {ll_bsurf62a};
//ll_bsurf62b = newreg; Line Loop(ll_bsurf62b) = {-lcpb11_3a, -lcpb10_3, lle13_2, lcpb1_3, -lexetc23, -lshalf1, lcpt11a, lcpt10, lue1_2, -lcpt1, lexetc13};
//ps_bsurf62b = newreg; Plane Surface(ps_bsurf62b) = {ll_bsurf62b};

//ll_bsurf72a = newreg; Line Loop(ll_bsurf72a) = {-lexet5, -lexetc6, -lcpt25_3, -lcpt17_3, -lcpt18_3, lcpt27_3, lcpt3_3b, lexetc5};
//ps_bsurf72a = newreg; Plane Surface(ps_bsurf72a) = {ll_bsurf72a};









// *************************************************
// Volumes
// *************************************************


// First gem

sl_dielectric = newreg; Surface Loop(sl_dielectric) = {ps_top_dielectric, ps_bottom_dielectric, ps_side_dielectric1a, ps_side_dielectric1b, ps_side_dielectric1c, ps_side_dielectric1d, ps_up_dielectric_1, ps_up_dielectric_3, ps_low_dielectric_1, ps_low_dielectric_3, ps_side_dielectric2a, ps_side_dielectric2b, ps_side_dielectric3a, ps_side_dielectric3b, ps_side_dielectric4a, ps_side_dielectric4b, ps_side_dielectric5a, ps_side_dielectric5b, ps_up_dielectric_2, ps_low_dielectric_2, rs_cyl_dielectric1_21, rs_cyl_dielectric1_22, rs_cyl_dielectric2_21, rs_cyl_dielectric2_22, rs_cyl_dielectric1_1, rs_cyl_dielectric1_2, rs_cyl_dielectric3_1, rs_cyl_dielectric3_2};
vol_dielectric = newreg; Volume(vol_dielectric) = {sl_dielectric};


sl_upper_cp = newreg; Surface Loop(sl_upper_cp) = {pscp_face1, rscp_up_rim_1, rscp_up_rim_3, rscp_up_rim2_2, rscp_up_rim1_2, ps_top_dielectric, pscp_up_border4a, pscp_up_border4b, pscp_up_border3, pscp_up_border2, pscp_up_border5, pscp_up_border1};
vol_upper_cp = newreg; Volume(vol_upper_cp) = {sl_upper_cp};

sl_lower_cp = newreg; Surface Loop(sl_lower_cp) = {pscp_face2, ps_bottom_dielectric, rscp_low_rim_1, rscp_low_rim_3, rscp_low_rim2_2, rscp_low_rim1_2, pscp_low_border3, pscp_low_border2, pscp_low_border4a, pscp_low_border4b, pscp_low_border1, pscp_low_border5};
vol_lower_cp = newreg; Volume(vol_lower_cp) = {sl_lower_cp};

// Second gem

sl_dielectric2 = newreg; Surface Loop(sl_dielectric2) = {ps_top_dielectric2, ps_bottom_dielectric2, ps_side_dielectric12a, ps_side_dielectric12b, ps_side_dielectric12c, ps_side_dielectric12d, ps_up_dielectric2_1, ps_up_dielectric2_3, ps_low_dielectric2_1, ps_low_dielectric2_3, ps_side_dielectric22a, ps_side_dielectric22b, ps_side_dielectric32a, ps_side_dielectric32b, ps_side_dielectric42a, ps_side_dielectric42b, ps_side_dielectric52a, ps_side_dielectric52b, ps_up_dielectric2_2, ps_low_dielectric2_2, rs_cyl_dielectric12_21, rs_cyl_dielectric12_22, rs_cyl_dielectric22_21, rs_cyl_dielectric22_22, rs_cyl_dielectric12_1, rs_cyl_dielectric12_2, rs_cyl_dielectric32_1, rs_cyl_dielectric32_2};
vol_dielectric2 = newreg; Volume(vol_dielectric2) = {sl_dielectric2};


sl_upper_cp2 = newreg; Surface Loop(sl_upper_cp2) = {pscp_face12, rscp_up_rim2_1, rscp_up_rim2_3, rscp_up_rim22_2, rscp_up_rim12_2, ps_top_dielectric2, pscp_up_border42a, pscp_up_border42b, pscp_up_border32, pscp_up_border22, pscp_up_border52, pscp_up_border12};
vol_upper_cp2 = newreg; Volume(vol_upper_cp2) = {sl_upper_cp2};

sl_lower_cp2 = newreg; Surface Loop(sl_lower_cp2) = {pscp_face22, ps_bottom_dielectric2, rscp_low_rim2_1, rscp_low_rim2_3, rscp_low_rim22_2, rscp_low_rim12_2, pscp_low_border32, pscp_low_border22, pscp_low_border42a, pscp_low_border42b, pscp_low_border12, pscp_low_border52};
vol_lower_cp2 = newreg; Volume(vol_lower_cp2) = {sl_lower_cp2};

// Third gem

sl_dielectric3 = newreg; Surface Loop(sl_dielectric3) = {ps_top_dielectric3, ps_bottom_dielectric3, ps_side_dielectric13a, ps_side_dielectric13b, ps_side_dielectric13c, ps_side_dielectric13d, ps_up_dielectric3_1, ps_up_dielectric3_3, ps_low_dielectric3_1, ps_low_dielectric3_3, ps_side_dielectric23a, ps_side_dielectric23b, ps_side_dielectric33a, ps_side_dielectric33b, ps_side_dielectric43a, ps_side_dielectric43b, ps_side_dielectric53a, ps_side_dielectric53b, ps_up_dielectric3_2, ps_low_dielectric3_2, rs_cyl_dielectric13_21, rs_cyl_dielectric13_22, rs_cyl_dielectric23_21, rs_cyl_dielectric23_22, rs_cyl_dielectric13_1, rs_cyl_dielectric13_2, rs_cyl_dielectric33_1, rs_cyl_dielectric33_2};
vol_dielectric3 = newreg; Volume(vol_dielectric3) = {sl_dielectric3};


sl_upper_cp3 = newreg; Surface Loop(sl_upper_cp3) = {pscp_face13, rscp_up_rim3_1, rscp_up_rim3_3, rscp_up_rim23_2, rscp_up_rim13_2, ps_top_dielectric3, pscp_up_border43a, pscp_up_border43b, pscp_up_border33, pscp_up_border23, pscp_up_border53, pscp_up_border13};
vol_upper_cp3 = newreg; Volume(vol_upper_cp3) = {sl_upper_cp3};

sl_lower_cp3 = newreg; Surface Loop(sl_lower_cp3) = {pscp_face23, ps_bottom_dielectric3, rscp_low_rim3_1, rscp_low_rim3_3, rscp_low_rim23_2, rscp_low_rim13_2, pscp_low_border33, pscp_low_border23, pscp_low_border43a, pscp_low_border43b, pscp_low_border13, pscp_low_border53};
vol_lower_cp3 = newreg; Volume(vol_lower_cp3) = {sl_lower_cp3};

// *******************
// Connect gems
// *******************


Line(993) = {229, 71};
Line(994) = {159, 4};
Line(995) = {227, 65};
Line(996) = {204, 49};
Line(997) = {228, 70};
Line(998) = {178, 23};
Line(999) = {75, 148};
Line(1000) = {5, 81};
Line(1001) = {73, 142};
Line(1002) = {50, 126};
Line(1003) = {74, 147};
Line(1004) = {24, 100};

// **********************
// Bounding surfaces
// **********************

Line Loop(1005) = {546, -576, -552, -551, 571, 994, 281, 261, 262, -286, -256, -993};
Plane Surface(1006) = {1005};
Line Loop(1007) = {547, 995, -257, 285, 277, 278, -281, -994, -571, -568, -567, 575};
Plane Surface(1008) = {1007};
Line Loop(1009) = {548, -574, -564, -563, 572, 996, 282, 273, 274, -284, -258, -995};
Plane Surface(1010) = {1009};
Line Loop(1011) = {562, 572, 996, 282, -272, -271, -283, 259, -997, -549, -573, 561};
Plane Surface(1012) = {1011};
Line Loop(1013) = {557, 558, 489, -550, 997, 260, 224, -268, -267, -323, -998, -583};
Plane Surface(1014) = {1013};
Line Loop(1015) = {545, 993, -255, 223, 265, 266, -323, -998, -583, -556, -555, 488};
Plane Surface(1016) = {1015};
Line Loop(1017) = {288, -318, -294, -293, 313, 1000, 410, 390, 391, -415, -385, -999};
Plane Surface(1018) = {1017};
Line Loop(1019) = {1001, -386, 414, 406, 407, -410, -1000, -313, -310, -309, 317, 289};
Plane Surface(1020) = {1019};
Line Loop(1021) = {1002, 411, 402, 403, -413, -387, -1001, 290, -316, -306, -305, 314};
Plane Surface(1022) = {1021};
Line Loop(1023) = {291, 1003, -388, 412, 400, 401, -411, -1002, -314, -304, -303, 315};
Plane Surface(1024) = {1023};
Line Loop(1025) = {299, 300, 231, -292, 1003, 389, 353, -397, -396, -452, -1004, -325};
Plane Surface(1026) = {1025};
Line Loop(1027) = {298, 325, 1004, 452, -395, -394, -352, 384, -999, -287, -230, 297};
Plane Surface(1028) = {1027};

// *********************
// Connect electrodes to Gem
// **********************

Line(1029) = {237, 203};
Line(1030) = {232, 224};
Line(1031) = {233, 177};
Line(1032) = {234, 225};
Line(1033) = {235, 158};
Line(1034) = {236, 219};
Line(1035) = {127, 243};
Line(1036) = {151, 238};
Line(1037) = {101, 239};
Line(1038) = {152, 240};
Line(1039) = {241, 82};
Line(1040) = {242, 150};


//Electrode surfaces

// *****************
//Upper electrode
// *****************
Line Loop(1041) = {592, 587, 588, 589, 590, 591};
Plane Surface(1042) = {1041};
// *****************
//Lower electrode
// *****************
Line Loop(1043) = {598, 593, 594, 595, 596, 597};
Plane Surface(1044) = {1043};

// ******************
// Bounding surfaces
// ******************

Line Loop(1045) = {592, 1030, -517, 541, 529, 530, -540, -1029};
Plane Surface(1046) = {1045};
Line Loop(1047) = {587, 1031, 581, 525, 526, -482, -518, -1030};
Plane Surface(1048) = {1047};
Line Loop(1049) = {588, 1032, -513, 481, 523, 524, -581, -1031};
Plane Surface(1050) = {1049};
Line Loop(1051) = {589, 1033, 539, 519, 520, -544, -514, -1032};
Plane Surface(1052) = {1051};
Line Loop(1053) = {590, 1034, -515, 543, 535, 536, -539, -1033};
Plane Surface(1054) = {1053};
Line Loop(1055) = {591, 1029, 540, 531, 532, -542, -516, -1034};
Plane Surface(1056) = {1055};
Line Loop(1057) = {420, 1036, -598, -1035, -443, -433, -432, 444};
Plane Surface(1058) = {1057};
Line Loop(1059) = {428, 429, 360, -421, 1036, 593, -1037, -454};
Plane Surface(1060) = {1059};
Line Loop(1061) = {427, 454, 1037, 594, -1038, -416, -359, 426};
Plane Surface(1062) = {1061};
Line Loop(1063) = {417, -447, -423, -422, 442, -1039, -595, -1038};
Plane Surface(1064) = {1063};
Line Loop(1065) = {439, 442, -1039, 596, 1040, -418, -446, 438};
Plane Surface(1066) = {1065};
Line Loop(1067) = {419, -445, -435, -434, 443, 1035, -597, 1040};
Plane Surface(1068) = {1067};

// **********************
// Bounding volume
// **********************


Surface Loop(1069) = {1042, 1046, 1048, 1050, 1052, 1054, 1056, 924, 1010, 1012, 926, 902, 900, 1022, 1024, 1026, 906, 904, 1016, 1006, 932, 934, 1008, 910, 908, 1018, 1020, 922, 920, 1064, 1066, 1044, 1058, 1060, 918, 916, 1028, 1062, 1068, 912, 914, 1014, 930, 928, 766, 764, 754, 752, 760, 748, 762, 758, 756, 750, 770, 768, 746, 744, 704, 740, 706, 702, 700, 724, 742, 720, 722, 726, 666, 664, 654, 652, 660, 648, 662, 658, 656, 650, 670, 668, 646, 644, 604, 640, 606, 602, 600, 624, 642, 620, 622, 626, 866, 864, 854, 852, 860, 848, 862, 858, 856, 850, 870, 868, 846, 844, 804, 840, 806, 802, 800, 824, 842, 820, 822, 826};
Volume(1070) = {1069};


// ****************************
//Physical surfaces
// ****************************


// Surfaces to which voltages will be applied



physsurf_upper_cp3 = newreg; Physical Surface(physsurf_upper_cp3) = {pscp_face13, rscp_up_rim3_1, rscp_up_rim3_3, rscp_up_rim23_2, rscp_up_rim13_2, ps_top_dielectric3, pscp_up_border43a, pscp_up_border43b, pscp_up_border33, pscp_up_border23, pscp_up_border53, pscp_up_border13};
physsurf_lower_cp3 = newreg; Physical Surface(physsurf_lower_cp3) = {pscp_face23, ps_bottom_dielectric3, rscp_low_rim3_1, rscp_low_rim3_3, rscp_low_rim23_2, rscp_low_rim13_2, pscp_low_border33, pscp_low_border23, pscp_low_border43a, pscp_low_border43b, pscp_low_border13, pscp_low_border53};

physsurf_upper_cp = newreg; Physical Surface(physsurf_upper_cp) = {pscp_face1, rscp_up_rim_1, rscp_up_rim_3, rscp_up_rim2_2, rscp_up_rim1_2, ps_top_dielectric, pscp_up_border4a, pscp_up_border4b, pscp_up_border3, pscp_up_border2, pscp_up_border5, pscp_up_border1};
physsurf_lower_cp = newreg; Physical Surface(physsurf_lower_cp) = {pscp_face2, ps_bottom_dielectric, rscp_low_rim_1, rscp_low_rim_3, rscp_low_rim2_2, rscp_low_rim1_2, pscp_low_border3, pscp_low_border2, pscp_low_border4a, pscp_low_border4b, pscp_low_border1, pscp_low_border5};

physsurf_upper_cp2 = newreg; Physical Surface(physsurf_upper_cp2) = {pscp_face12, rscp_up_rim2_1, rscp_up_rim2_3, rscp_up_rim22_2, rscp_up_rim12_2, ps_top_dielectric2, pscp_up_border42a, pscp_up_border42b, pscp_up_border32, pscp_up_border22, pscp_up_border52, pscp_up_border12};
physsurf_lower_cp2 = newreg; Physical Surface(physsurf_lower_cp2) = {pscp_face22, ps_bottom_dielectric2, rscp_low_rim2_1, rscp_low_rim2_3, rscp_low_rim22_2, rscp_low_rim12_2, pscp_low_border32, pscp_low_border22, pscp_low_border42a, pscp_low_border42b, pscp_low_border12, pscp_low_border52};

physsurf_upper_el = newreg; Physical Surface(physsurf_upper_el) = {1042};
physsurf_lower_el = newreg; Physical Surface(physsurf_lower_el) = {1044};

// Surfaces for periodic boundary conditions

physsurf_bd1h1 = newreg; Physical Surface(physsurf_bd1h1) = {1046, 926, 882, 880, 1012, 902, 682, 680, 1024, 914, 782, 780, 1058};
physsurf_bd1h2 = newreg; Physical Surface(physsurf_bd1h2) = {1052, 932, 892, 894, 1006, 692, 694, 908, 1018, 792, 794, 920, 1064};
physsurf_bd2h3 = newreg; Physical Surface(physsurf_bd2h3) = {1048, 884, 886, 930, 1014, 684, 686, 906, 1026, 784, 786, 918, 1060};
physsurf_bd2h2 = newreg; Physical Surface(physsurf_bd2h2) = {1054, 874, 872, 934, 1008, 674, 672, 910, 1020, 774, 772, 922, 1066};
physsurf_bd3h1 = newreg; Physical Surface(physsurf_bd3h1) = {1050, 928, 888, 890, 1016, 690, 688, 904, 1028, 788, 790, 916, 1062};
physsurf_bd3h3 = newreg; Physical Surface(physsurf_bd3h3) = {1056, 878, 876, 924, 1010, 678, 676, 900, 1022, 778, 776, 912, 1068};

// Physical volumes

physvol_gas = newreg; Physical Volume(physvol_gas) = {1070};


physvol_dielectric = newreg; Physical Volume(physvol_dielectric) = {vol_dielectric};
physvol_upper_cp = newreg; Physical Volume(physvol_upper_cp) = {vol_upper_cp};
physvol_lower_cp = newreg; Physical Volume(physvol_lower_cp) = {vol_lower_cp};

physvol_dielectric2 = newreg; Physical Volume(physvol_dielectric2) = {vol_dielectric2};
physvol_upper_cp2 = newreg; Physical Volume(physvol_upper_cp2) = {vol_upper_cp2};
physvol_lower_cp2 = newreg; Physical Volume(physvol_lower_cp2) = {vol_lower_cp2};

physvol_dielectric3 = newreg; Physical Volume(physvol_dielectric3) = {vol_dielectric3};
physvol_upper_cp3 = newreg; Physical Volume(physvol_upper_cp3) = {vol_upper_cp3};
physvol_lower_cp3 = newreg; Physical Volume(physvol_lower_cp3) = {vol_lower_cp3};


