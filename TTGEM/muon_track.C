/*

Created by Carlos Alberto Calvachi Salas. 
First semester 2022.

This code is based on previous work done by 
Carlos Barreto and Juan Molano in their 
bachelors thesis at Uniandes.

Additionaly, these authors based 
their contibutions in a template code used 
in C. Shalem et. al. Nucl. Instr. Meth. A, 558, 475 (2006).

*/

#include "TTGEM.hh"


int main(int argc, char *argv[]) {

    if(argc > 1){

    	for (int k = 1; k < argc; ++k)
    	{	

    		TTGEM *atmospheric = new TTGEM(true);
    		atmospheric->initArray(stoi(argv[k]));
    		atmospheric->runAll();

    	}

    } else { 

    	int events;

    	double x; 

		double y;

		double dx; 

		double dy;

		double dz;

		double energy;

		cout << "events: ";
		cin >> events;

		cout << "x: ";
		cin >> x;

		cout << "y: ";
		cin >> y;

		cout << "dx: ";
		cin >> dx;

		cout << "dy: ";
		cin >> dy;

		cout << "dz: ";
		cin >> dz;

		cout << "energy: ";
		cin >> energy;

		TTGEM *first = new TTGEM(false);
		first->initSimple(events, x, y, dx, dy, dz, energy);
		first->runAll();

    }

	
 	return 0;
}