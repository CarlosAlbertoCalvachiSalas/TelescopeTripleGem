#include <iostream>
#include <cmath> 
#include <cstring>
#include <fstream>
#include <TCanvas.h>
#include <TApplication.h>
#include <TFile.h>

#include "MediumMagboltz.hh"
#include "ComponentElmer.hh"
#include "Sensor.hh"
#include "ViewField.hh"
#include "Plotting.hh"
#include "ViewFEMesh.hh"
#include "ViewSignal.hh"
#include "GarfieldConstants.hh"
#include "Random.hh"
#include "AvalancheMicroscopic.hh"
#include "TrackHeed.hh"
#include "GeometrySimple.hh"
#include "ComponentAnalyticField.hh"

using namespace Garfield;

int main(int argc, char * argv[]) {

    TApplication app("app", &argc, argv);

    // Set relevant LEM parameters.
    const double lem_th = 0.04;          // LEM thickness in cm
    const double lem_cpth = 0.035;      // Copper thickness
    const double lem_pitch = 0.14;       // LEM pitch in cm
    const double axis_x = 0.2;           // X-width of drift simulation will cover between +/- axis_x
    const double axis_y = 0.2;           // Y-width of drift simulation will cover between +/- axis_y
    const double axis_z = 0.5;
    
    // Set the electron start parameters.
    const double zi = 0.4; 	// Starting z position for electron drift
    double xi = 0.0;
    double yi = 0.01212;

    // Numero de eventos
    const int events = 100;
    // Energia del muon
    const double energy = 0.2;
    // Variables describing signal binning.
    const double tMin = 0.;
    const double tMax = 1000.;
    const double tStep = 0.1;
    const int nTimeBins = int((tMax - tMin) / tStep);

    // ---------------------------------------------------------------------------------------------------------------
    // Create several canvases for the plots.
    //TCanvas * cGeom = new TCanvas("Track", "c1");
    //TCanvas * cPotential = new TCanvas("Potential", "c2");
    //TCanvas * cSignal = new TCanvas("Signal","signal");
    //ofstream ddatae;
    //ofstream ddatac;
    ofstream ddatat;
    ddatat.open("datat.txt"); 
    //ddatae.open("datae.txt");
    //ddatac.open("datac.txt"); 

    // Define the medium.
    MediumMagboltz* gas = new MediumMagboltz();
    gas->SetTemperature(293.15);                  // Set the temperature (K)
    gas->SetPressure(740.);                       // Set the pressure (Torr)
    gas->EnableDrift();                           // Allow for drifting in this medium
    gas->SetComposition("ar", 70., "co2", 30.);   // Specify the gas mixture (Ar/CO2 70:30)

    // Import an Elmer-created LEM and the weighting field for the readout electrode.
    ComponentElmer * elm = new ComponentElmer("3gemcell/mesh.header","3gemcell/mesh.elements","3gemcell/mesh.nodes",
    "3gemcell/dielectrics.dat","3gemcell/3gemcell.result","cm");
    elm->EnablePeriodicityX();
    elm->EnableMirrorPeriodicityY();
    elm->SetMedium(0,gas);
    elm->SetWeightingField("3gemcell/3gemcell_WTlel.result","wtlel");

    // Set up a sensor object.
    Sensor * sensor = new Sensor();
    sensor->AddComponent(elm);
    sensor->SetArea(-1*axis_x,-1*axis_y,-1*axis_z,axis_x,axis_y,axis_z);
    sensor->AddElectrode(elm,"wtlel");
    sensor->SetTimeWindow(0., tStep, nTimeBins);

    // Create an avalanche object
    AvalancheMicroscopic* aval = new AvalancheMicroscopic();
    aval->SetSensor(sensor);
    aval->SetCollisionSteps(100);
    aval->EnableSignalCalculation();

    // Set up the object for field visualization.
    /*ViewField * vf = new ViewField();
    vf->SetSensor(sensor);
    vf->SetCanvas(cPotential);
    vf->SetArea(-1*axis_x,-1*axis_y,axis_x,axis_y);
    vf->SetNumberOfContours(40);
    vf->SetNumberOfSamples2d(30,30);
    vf->SetPlane(0,-1,0,0,0,0);

    // Set up the object for drift line visualization.
    ViewDrift* viewDrift = new ViewDrift();
    viewDrift->SetArea(-1*axis_x,-1*axis_y,-1*axis_z,axis_x,axis_y,axis_z);
    aval->EnablePlotting(viewDrift);

    // Set up the object for FE mesh visualization.
    ViewFEMesh * vFE = new ViewFEMesh();
    vFE->SetCanvas(cGeom);
    vFE->SetComponent(elm);
    vFE->SetPlane(0,-1,0,0,0,0);
    vFE->SetFillMesh(true);
    vFE->SetColor(1,kGray);
    vFE->SetColor(2,kYellow+3);
    vFE->SetColor(3,kYellow+3);
    vFE->SetColor(4,kGray);
    vFE->SetColor(5,kYellow+3);
    vFE->SetColor(6,kYellow+3);
    vFE->SetColor(7,kGray);
    vFE->SetColor(8,kYellow+3);
    vFE->SetColor(9,kYellow+3);
    
    // Set up the object for signal visualization.
    ViewSignal* vSignal = new ViewSignal();
    vSignal->SetSensor(sensor);
    vSignal->SetCanvas(cSignal);
    */
    
    //TrackHeed* track = new TrackHeed();
    //track->SetParticle("mu-");
    //track->SetEnergy(energy);
    //track->SetSensor(sensor);
    //track->EnableMagneticField();
    //track->EnableElectricField();
    //track->EnablePlotting(viewDrift);
    //track->EnableDebugging();    
    
    
    // Cluster info
    //double xcls, ycls, zcls, tcls, e, extra;
    //xcls = ycls = zcls = tcls = e = extra = -999.;
    // Electron info
    //double xele, yele, zele, tele, eele, dxele, dyele, dzele;
    // Electron start and endpoints, momentum direction and status
    //double x0ele, y0ele, z0ele, t0ele, e0ele;// start point
    //double x1ele, y1ele, z1ele, t1ele, e1ele;// endpoint
    //double dx1ele, dy1ele, dz1ele; // momentum direction
    //int status1ele; // status
    //int n = 0; // number of electrons in cluster
    //bool cls_ret;// return OK if cluster is OK
    
    // The initial impact position of the incoming ionising track
    double track_x = xi;// [cm]
    double track_y = yi;
    double track_z = zi;
    // Momentum direction of incoming track
    double track_dx = 0.0;
    double track_dy = 0.0; // Track coming downstream
    double track_dz = -1.0;
    
    for(int k = 1; k <=  events;k++){
    // Now create a single track
    
        //track->TransportPhoton(track_x, track_y, track_z, 100*k, energy,  track_dx, track_dy, track_dz,n);
    
    // Loop sobre los electrones en el cluster
        //for(int j = 1; j <= n; j++){
            //track->GetElectron(j-1, xele, yele, zele, tele, eele, dxele, dyele, dzele);
    
        // Simular la avalancha
            aval->AvalancheElectron(xi, yi, zi, k*100, energy, 0., 0., 0.);
            const int np = aval->GetNumberOfElectronEndpoints();
	    double xe1, ye1, ze1, te1, e1;
            double xe2, ye2, ze2, te2, e2;
            int status;
         
        // Obtener coordenadas de cada electron
            for(int i = np; i--;){
                aval->GetElectronEndpoint(i, xe1, ye1, ze1, te1, e1, xe2, ye2, ze2, te2, e2, status);
                ddatat << xe2 << "\t" << ye2 << "\t" << ze2 << "\t" << e1 << "\n";
            }
        } 
    
    
         
    
                         
    // Create plots.
    //vFE->SetArea(-1*axis_x,-1*axis_z,0.,axis_x,axis_z,0.);  // note: here the x-y axes correspond to projection chosen
                                                            //       z-axis is irrelevant for 2D projections
    //vf->PlotContour("v"); // uncomment this to plot the contours of the potential
    //vSignal->PlotSignal("wtlel");

    //vFE->EnableAxes();             // comment this to disable creation of independent axes when contours are plotted
    //vFE->SetViewDrift(viewDrift);  // comment this to remove the avalanche drift line from the plot when contours are plotted
    //vFE->SetXaxisTitle("x (cm)");
    //vFE->SetYaxisTitle("z (cm)");
    //vFE->Plot();
    

    //ddatae.close(); 
    //ddatac.close();
    ddatat.close();

    std::cout <<" END   \n"; 
    app.Run(kTRUE);

    return 0;
}
