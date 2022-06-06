#include "TGEM.hh"

string TTGEM_DATA_PATH_ATMOSPHERIC = "TTGEMData/TTGEMDataAtmospheric/";

double gammaFromEnergy(double E, double E0){
	return E/E0;
}

double gammaFromKineticEnergy(double E, double E0){
	return 1 + (E/E0);
}

double speedFromGamma(double gamma){

	const double lightSpeed =  299792458; // m/s
	// Source https://physics.nist.gov/cgi-bin/cuu/Value?c

	return lightSpeed*sqrt(1 - (1/(gamma*gamma)));
}


void getNextPosition(double distanceTGEM, double x0, double y0, double z0, double dx0, double dy0, double dz0, double v, double& x1, double& y1, double& z1, bool inCm = true){

	 double t = distanceTGEM/((-dz0)*v);

	 x1 = x0 + v*dx0*t;
	 y1 = y0 + v*dy0*t;
	 z1 = z0 + v*dz0*t;


}

double getNextEnergy(double energy0, int numElectronsProduced, double energyPerElectron){	
	return energy0 - energyPerElectron*numElectronsProduced;

	// Only makes sense if energy0 > energyPerElectron*numElectronsProduced
}


class TTGEMCSV
{

	public:

		string link;

		ifstream file;

		vector<string> headers;

		vector<vector<string>> values;

		TTGEMCSV(string linkVal){
			link = linkVal;
			openFile();
			readData();

		}

		void openFile(){
			file.open(link);
		}


		void readData(){

			string line;
			string cell;

			int c = 0;

			while(!file.eof()){

        		file >> line;

        		vector <string> row;

        		stringstream str(line);

        		while(getline(str, cell, ',')){	
       				row.push_back(cell);		
        		}	

       			if(c == 0){

        			headers = row;

        		} else {
        			values.push_back(row);	
        		}
       			
    			c++;
    		}

    		values.pop_back();
    
		}

		vector <double> getColumnDouble(string column){

			//vector <string> columnString = values[getColumnIndex(column)];

			vector <double> doubleColumn;

			for (int k = 0; k < values.size(); ++k)
			{
				doubleColumn.push_back(stod(values[k][getColumnIndex(column)]));
			}

			return doubleColumn;
		}


		int getColumnIndex(string column){

			for (int k = 0; k < headers.size(); ++k)
			{
				if(headers[k] == column){
					return k;
				}
			}

			return -1;

		}

		int getEntriesNum(){

			return values.size();
		}

		void printHeaders(){

			for (int k = 0; k < headers.size(); ++k)
			{
				cout << headers[k] << '\n';
			}
		}

		void printValues(){

			for (int a = 0; a < values.size(); ++a){

				for (int b = 0; b < values[a].size(); ++b){

					cout << values[a][b] << '\n';
				}
			}
		}


		void printColumnDouble(string column){

			vector <double> columnDouble = getColumnDouble(column);

			for (int k = 0; k < columnDouble.size(); ++k)
			{
				cout << columnDouble[k] << '\n';
			}

		}


/*	vector<string> getHeaders(){
		file.
	}

	double getColumnDouble(string columnName){

	}
*/

};


class TTGEM 
{
	private:

		const double TGEMInterDistance = 2.5; // m
		const double TGEMIntraDistance = (0.906)/100; 
		const double TGEMDistance = TGEMIntraDistance + TGEMInterDistance;

		bool arrayBased;

		int TTGEMName;
		int events;

		double x0;
		double y0;

		double dx0;
		double dy0;
		double dz0;

		double x[3];
		double y[3];
		double z[3];

		double energy;
		long double v;

		int simulationName;

		TGEM *TGEMlist[3]; 

		ofstream dataTTGEM;

		// For array init variables

		vector <double> x1_;
		vector <double> x2_; 
		vector <double> x3_;

		vector <double> y1_;
		vector <double> y2_; 
		vector <double> y3_;

		vector <double> energy_;

		vector <double> dx_;
		vector <double> dy_; 
		vector <double> dz_;

	public:

		const double lightSpeed =  299792458;  // m/s
		const double electronMass = 0.51099895000e6; // eV/c2 
		const double muonMass = 105.6583755e6; // eV/c2 

		// Source https://physics.nist.gov/cgi-bin/cuu/Value?mmuc2mev

		TTGEM(bool arrayBasedVal = false) {
			
			arrayBased = arrayBasedVal; 

			/*if(!arrayBased){
				initSimple(events, x0, y0, dx0, dy0, dz0, energy);
			}*/

		}

		void initSimple(int events = 100, double x0 = 0.0, double y0 = 0.0, double dx0 = 0.0, double dy0 = 0.0, double dz0 = -1.0, double energy = pow(10, 9)){

			setEvents(events);
			// -	

			setXYCoordinates(x0, y0);
			// setXYCoordinatesArray

			setDirection(dx0, dy0, dz0);
			// setDirectionsArray
	
			setEnergy(energy);
			// setEnergies

			setSimulationName();
			//	readBySimulationName
			
			openDataFiles();
			addDataHeaders();
			// 	- 

			calculateXYCoordinates();
			//	-

			initiateAll();
			// initiateBySimulationName

			fillData();
			//	-

		}

		void initArray(int serial){

			string link = TTGEM_DATA_PATH_ATMOSPHERIC +  to_string(serial) + ".csv";

			TTGEMCSV *dataInit = new TTGEMCSV(link);
			
			x1_ = dataInit->getColumnDouble("x1");
			x2_ = dataInit->getColumnDouble("x2"); 
			x3_ = dataInit->getColumnDouble("x3");

			y1_ = dataInit->getColumnDouble("y1");
			y2_ = dataInit->getColumnDouble("y2"); 
			y3_ = dataInit->getColumnDouble("y3");

			energy_ = dataInit->getColumnDouble("energy");

			dx_ = dataInit->getColumnDouble("dx");
			dy_ = dataInit->getColumnDouble("dy"); 
			dz_ = dataInit->getColumnDouble("dz");

			events = dataInit->getEntriesNum();

			simulationName = serial;

			openDataFiles();
			addDataHeaders();

			initiateAll();

			fillData();

		}

		void setEvents(int eventsNum){
			events = eventsNum;
		}

		void setXYCoordinates(double x0Val, double y0Val){
			x0 = x0Val;
			y0 = y0Val;
		}

		void setDirection(double dx0Val, double dy0Val, double dz0Val){
			dx0 = dx0Val;
			dy0 = dy0Val;
			dz0 = dz0Val;
		}

		void setSimulationName(){
			simulationName = random();
		}
	
		void openDataFiles(){
			// Open data files
			dataTTGEM.open("TTGEMData/" + to_string(simulationName) + ".csv");
		}

		void addDataHeaders(){
			// Define data headers
			if(arrayBased){
				dataTTGEM << "Id" << "," << "name" << "\n" ;
			}else{
				dataTTGEM << "Id" << "," << "name" << "," << "x" << "," << "y" << "," << "z" << "," << "dx" << "," << "dy" << "," << "dz" << "," << "v"  << "\n" ;
			}
		}

		void addLineData(int Id, int name, double x = 0, double y = 0, double z = 0, double dx = 0, double dy = 0, double dz = -1.00, long double v = 299792458){
			
			if(arrayBased){
				dataTTGEM << Id << "," << name << "\n" ;
			}else{
				dataTTGEM << Id << "," << name << "," << x << "," << y << "," << z << ","  << dx << "," << dy << "," << dz << "," << v/lightSpeed <<"\n" ;
			}

			
		}

		void closeData(){
			dataTTGEM.close();
		}

		void fillData(){
			cout << TGEMlist[0]->getSimulationName() << "\n";

			if(arrayBased){
				addLineData(1, TGEMlist[0]->getSimulationName());
				addLineData(2, TGEMlist[0]->getSimulationName());
				addLineData(3, TGEMlist[0]->getSimulationName());
			}else{
				addLineData(1, TGEMlist[0]->getSimulationName(), x[0], y[0], z[0], dx0, dy0, dz0, v);
				addLineData(2, TGEMlist[1]->getSimulationName(), x[1], y[1], z[1], dx0, dy0, dz0, v);
				addLineData(3, TGEMlist[2]->getSimulationName(), x[2], y[2], z[2], dx0, dy0, dz0, v);
			}
			
			
			closeData();
		}


		void calculateXYCoordinates(){
			x[0] = x0;
			y[0] = y0;
			z[0] = 0;

			double x1, y1, z1; 

			getNextPosition(TGEMDistance, x[0]/100, y[0]/100, z[0]/100, dx0, dy0, dz0, v, x1, y1, z1); 

			x[1] = x1;
			y[1] = y1;
			z[1] = z1;

			double x2, y2, z2; 

			getNextPosition(TGEMDistance, x[1], y[1], z[1], dx0, dy0, dz0, v, x2, y2, z2); 

 			x[2] = x2;
			y[2] = y2;
			z[2] = z2;

			x[1] = x[1]*100;
			x[2] = x[2]*100;

			y[1] = y[1]*100;
			y[2] = y[2]*100;
		}

		void initiateAll(){

			if(arrayBased){

				TGEMlist[0] = new TGEM(1, arrayBased);
				TGEMlist[0]->initArray(x1_, y1_, dx_, dy_, dz_, energy_);

				TGEMlist[1] = new TGEM(2, arrayBased);
				TGEMlist[1]->initArray(x2_, y2_, dx_, dy_, dz_, energy_);

				TGEMlist[2] = new TGEM(3, arrayBased);
				TGEMlist[2]->initArray(x3_, y3_, dx_, dy_, dz_, energy_);

			}else{
				for (int k = 0; k < 3; ++k)
				{	
					TGEMlist[k] = new TGEM(k+1, arrayBased);
					TGEMlist[k]->initSimple(events, x[k], y[k], dx0, dy0, dz0, energy);
				}	
			
			}
		
		}

		void runAll(){
			for (int k = 0; k < 3; ++k)
			{
				TGEMlist[k]->runSimulation();
			}
		}


		void setEnergy(double energyVal){
			energy = energyVal;

			double gamma  = gammaFromEnergy(energy, muonMass);
		
			v = speedFromGamma(gamma); 
		}


};