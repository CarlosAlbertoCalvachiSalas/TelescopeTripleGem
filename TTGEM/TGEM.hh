#include <fstream>
#include <cmath>
#include <regex>
#include <sstream>


#include <TCanvas.h>
#include <TApplication.h>

#include "Garfield/MediumMagboltz.hh"
#include "Garfield/ComponentElmer.hh"
#include "Garfield/AvalancheMicroscopic.hh"
#include "Garfield/ViewFEMesh.hh"
#include "Garfield/TrackHeed.hh"
#include "Garfield/Sensor.hh"

using namespace Garfield;
using namespace std;

class TGEM

{
	private:
		const double gem_th = 0.0050; 
		const double gem_cpth = 0.0005; 
		const double gem_pitch = 0.0140;
		const double axis_x = 5.00; 
		const double axis_y = 5.00;
		const double axis_z = 0.303;
		const double neg_axis_z = -0.603; 
		const double collectorThreshold = -0.6029;
		const double temperature = 293.15;
		const double pressure = 760.;
		const double maxElectronEnergy = 200.; 
		const int collisionSteps = 100;

		const double z0 = 0.302;

		// Boolean that indicates if the charge is array based

		bool arrayBased;

		// Initial coordinates in cm
		double track_x;
		double track_y;
		double track_z = z0;

		// Velocity unitary position vector
		double track_dx;
		double track_dy;
		double track_dz;

		int TGEMnum; 
		int events; 

		double energy;
		double argon; 
		double co2;
		double voltage;

		int simulationName;

		// Array elements

		vector<double> x0_;
		vector<double> y0_;
		vector<double> dx0_;
		vector<double> dy0_;
		vector<double> dz0_;
		vector<double> energy_;

		// DataFiles 

		ofstream dataElectrons;
		ofstream dataAvalanches;
		ofstream dataEvents;

		MediumMagboltz *gas = new MediumMagboltz();

		ComponentElmer *elm = new ComponentElmer(
      		"gemcell/mesh.header", "gemcell/mesh.elements", "gemcell/mesh.nodes",
      		"gemcell/dielectrics.dat", "gemcell/gemcell.result", "cm");

		Sensor *sensor = new Sensor();

		AvalancheMicroscopic *aval = new AvalancheMicroscopic();

		TrackHeed *track = new TrackHeed();

		// Variable to save number of electrons that reach readout plane

		int nReadOutElectrons = 0; 



	public:

		TGEM(int TGEMnum, bool arrayBasedVal = false, double argon = 70., double voltage = 400){

			setTGEMNum(TGEMnum);
			
			arrayBased = arrayBasedVal;

			//setEvents(events);
			// - 

			//setXYCoordinates(x0, y0);
			// setXYCoordinatesArray

			//setDirection(dx0, dy0, dz0);
			// setDirectionsArray

			//setEnergy(energy);
			// setEnergyArray

			setArgon(argon);
			setVoltage(voltage);
	
			setSimulationName();
			//	readBySimulationName

			openDataFiles();
			addDataHeaders();
			// -

			setGasMedium();
			setElectricField();
			setSensor();
			setAvalanche();
			setTrack();

		}

		void initSimple(int eventsVal = 100, double x0 = 0.0, double y0 = 0.0 , double dx0 = 0.0, double dy0 = 0.0, double dz0 = -1.0, double energyVal = pow(10, 9)){	

			events = eventsVal;

			for (int k = 0; k < events; ++k)
			{
				x0_.push_back(x0);
				y0_.push_back(y0);
				dx0_.push_back(dx0);
				dy0_.push_back(dy0);
				dz0_.push_back(dz0);
				energy_.push_back(energyVal);	
			}

		}

		void initArray(vector<double> x0, vector<double> y0, vector<double> dx0, vector<double> dy0, vector<double> dz0, vector<double> energy){

			x0_ = x0;
			y0_ = y0;
			dx0_ = dx0;
			dy0_ = dy0;
			dz0_ = dz0;
			energy_ = energy;

			events = x0_.size();

		}

		void setTGEMNum(int TGEMNUM){
			TGEMnum = TGEMNUM;
		}

		void setEvents(int eventsNum){
			events = eventsNum;
		}

		void setXYCoordinates(double x0, double y0){
			track_x = x0;
			track_y = y0;
		}

		void setDirection(double dx0, double dy0, double dz0){
			track_dx = dx0;
			track_dy = dy0;
			track_dz = dz0;
		}

		void setEnergy(double energyVal){
			energy = energyVal;
		}

		void setArgon(double argonVal){
			argon = argonVal;
			co2 = 100 - argon;
		}

		void setVoltage(double voltageVal){
			voltage = voltageVal;
		}

		void setSimulationName(){
			simulationName = random();
		}

		void openDataFiles(){
			// Open data files
			dataElectrons.open("electronsData/" + to_string(simulationName) + ".csv");
			dataAvalanches.open("avalanchesData/" + to_string(simulationName) + ".csv");
			dataEvents.open("eventsData/" + to_string(simulationName) + ".csv");
		}

		void addDataHeaders(){
			// Define data headers
			dataElectrons << "Ar" << ","  << "E" << "," << "V" << "," << "step" << "," << "elecNum" << "," << "x" << "," << "y" << "," << "z" <<  "," <<  "t" << "," <<  "e"  <<"\n" ;
			dataAvalanches << "Ar"<< ","  << "E" << "," << "V" << "," << "step" <<  "," << "avalTot" << "," << "filTot" << ","  << "ne" << "," << "nIons" << "\n" ;
			dataEvents 	<< "event" << ","  << "collected" << "," << "total" << "," << "x" <<  "," << "y" << "\n" ;
		}

		void setGasMedium(){
			// Define gaseous medium
			gas->SetTemperature(temperature);	// Set the temperature (K)
			gas->SetPressure(pressure);			// Set the pressure(Torr)
			gas->EnableDrift();				// Allow for drifting in this medium
			gas->SetComposition("ar", argon, "co2", co2);	// Specify the gas mixture (Ar/CO2 70:30)
			gas->SetMaxElectronEnergy(maxElectronEnergy);
		}

		void setElectricField(){
			// Import Elmer-created field map
			elm->EnablePeriodicityX();
			elm->EnableMirrorPeriodicityY();
			elm->SetMedium(0, gas);
			elm->EnableConvergenceWarnings(false);
		}

		void setSensor(){
			// Set up object that represents the avalanche of electrons
			sensor->AddComponent(elm);
			sensor->SetArea(-axis_x, -axis_y, neg_axis_z, axis_x, axis_y, axis_z);
		}

		void setAvalanche(){
			// Set up object that represents the avalanche of electrons
			aval->SetSensor(sensor);
			aval->SetCollisionSteps(collisionSteps);
		}

		void setTrack(){
			// Set up object for the simulation of the incoming particle
			track->SetParticle("mu-");
			track->SetSensor(sensor);
			track->EnableMagneticField();
			track->EnableElectricField();
			track->EnableDebugging();
		}

		int getTGEMnum(){
			return TGEMnum;
		}
		int getSimulationName(){
			return simulationName;
		}

		int getReadOutElectrons(){
			return nReadOutElectrons;
		}

		void runSimulation(bool printProgress = true){

			// Loop over all incoming particles
			for(int i = 0; i < events; ++i){
				
				track->SetEnergy(energy_[i]);
				track->NewTrack(x0_[i], y0_[i], track_z, 100*i, dx0_[i], dy0_[i], dz0_[i]);
				
				double xc = 0., yc = 0., zc = 0., tc = 0., ec = 0., extra = 0.;
				int nc = 0;
				int clusters = 0;
				int counter = 0;

				int eventElectrons = 0;
				int eventFilteredElectrons = 0;

				double xCounter = 0;
				double yCounter = 0;


				// Loop over each cluster generated by an incoming particle
				while(track->GetCluster(xc, yc, zc, tc, nc, ec, extra)){
					// Loop over all electrons generated in each cluster
					for(int j = 0; j < nc; ++j) {
						
						double xe = 0., ye = 0., ze = 0., te = 0., ee = 0.;
						double dxe = 0., dye = 0., dze = 0.;

						track->GetElectron(j, xe, ye, ze, te, ee, dxe, dye, dze);
						aval->AvalancheElectron(xe, ye, ze, te, ee, dxe, dye, dze);

						// Count how many electrons of each avalanche reached the readout plane
						int nAvalanche = aval->GetNumberOfElectronEndpoints();

						double xe1, ye1, ze1, te1, e1;
						double xe2, ye2, ze2, te2, e2;
						int status;

						int filteredElectrons = 0;

						for(int k = nAvalanche; k>0; k--){
							aval->GetElectronEndpoint(k-1,xe1,ye1,ze1,te1,e1,xe2,ye2,ze2,te2,e2,status);

							eventElectrons += 1;

							if(ze2 <= collectorThreshold){
								nReadOutElectrons += 1;
								filteredElectrons += 1;
								eventFilteredElectrons += 1;

								xCounter += xe2;
								yCounter += ye2;

							}

							// Save in data electrons

							dataElectrons  << argon << ","  <<  energy_[i] << ","  << voltage << "," << i + 1 << "," << nAvalanche - k << "," << xe2 << "," << ye2 << "," << ze2 <<  "," <<  te2 << "," <<  e2  << "\n" ;
						}

						// Save the avalanche size
						int ne, ni;
						aval->GetAvalancheSize(ne, ni);
				
						dataAvalanches << argon << ","  <<  energy_[i] << ","  << voltage << "," << i + 1 <<  "," << nAvalanche << "," << filteredElectrons << ","  << ne << "," << ni << "\n" ;
					}

				counter ++;

				}

				dataEvents 	<< i + 1 << ","  << eventFilteredElectrons << "," << eventElectrons << "," << xCounter/eventFilteredElectrons <<  "," << yCounter/eventFilteredElectrons << "\n" ;

				if(printProgress){
					cout << i + 1 << "/" << events << "\t" << "clusters" << "\t" << counter  << "\n"; 
				}

			}

			dataElectrons.close();
			dataAvalanches.close();
			dataEvents.close();

		}

};