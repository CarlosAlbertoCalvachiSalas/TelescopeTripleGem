import numpy as np 
import matplotlib.pyplot as plt
import pandas as pd
import scipy.integrate as integrate 
import scipy.stats.sampling as sampling

INTER_GEM_DISTANCE 		= 2.5

INTRA_GEM_DISTANCE 		= (0.906)/100

DISTANCE = INTER_GEM_DISTANCE + INTRA_GEM_DISTANCE

MUON_MASS_EV			= 105.6583755E6

SPEED_OF_LIGHT 		= 299792458

GRAPHS_PATH = 'TTGEMGraphs/MuonDistributions/'

plt.rcParams.update({
  "text.usetex": True,
  "font.family": "sans-serif"
})

def polarDistribution(angle):
	if(np.abs(angle) <= np.pi/2):
		return (np.cos(angle)**2)/(np.pi/2)
	else:
		return 0

def polarDistributionVect(angles):
	return np.vectorize(polarDistribution)(angles)

def landauToBeIntegrated(x, mu = 1.1, c = np.pi/2):
	return lambda t: (1/(np.pi*c))*(np.exp(-t)*np.cos(t*((x - mu)/(c)) + ((2*t)/np.pi)*np.log(t/c)))

def energyDistribution(x, mu = 1.1, c = np.pi/2):
		if(x < 20 and x > -20):
			return integrate.quad(landauToBeIntegrated(x, mu, c), 0, np.inf)[0]
		else:
			return 0

normEnergyFactor = integrate.quad(energyDistribution, 0, 20)[0]

def energyDistributionVect(x, mu = 1.1, c = np.pi/2):
	return np.vectorize(energyDistribution, excluded = [1, 2])(x, mu, c)/normEnergyFactor

def energyDistribution2(x, mu = 0):
	if(x < 0):
		return 0
	else:
		return (1/np.sqrt(2*np.pi))*np.exp(-((x-mu) + np.exp(-(x - mu)))/2)

def energyDistribution2Vect(x, mu = 0):
	return np.vectorize(energyDistribution2, excluded = [1])(x, mu)

class Polar:
	def pdf(self, theta):
		return polarDistribution(theta)

class Energy:
	def pdf(self, E, mu = 1.1, c = np.pi/2):
		#return energyDistribution(E, mu, c)/normEnergyFactor
		return energyDistribution2(E, mu = mu)

	def vectPdf(self, E):
		return np.vectorize(self.pdf)(E)

	def mean(self):
		return integrate.quad(lambda E: E*self.pdf(E), 0, np.inf)[0]/integrate.quad(lambda E: self.pdf(E), 0, np.inf)[0]

	def rms(self):
		return np.sqrt(integrate.quad(lambda E: (1/20)*(self.pdf(E)**2), 0, 20)[0])

def eventsGenerator(N, makeGraphs = False):

	phi = np.random.uniform(low = -np.pi, high = np.pi, size = N)
	x  	= np.random.uniform(low = -5, high = 5, size = N)
	y 	= np.random.uniform(low = -5, high = 5, size = N)

	rngPolar = sampling.SimpleRatioUniforms(Polar(), mode=0,
	                          random_state=np.random.default_rng())

	theta 	= rngPolar.rvs(N)

	rngEnergy = sampling.SimpleRatioUniforms(Energy(), mode=0,
	                          random_state=np.random.default_rng())

	energy 	= rngEnergy.rvs(N)

	if(makeGraphs):

		plt.title(r'Distribución atmosférica de $\phi$')
		plt.hist(phi, color = 'blue', density = True, bins = 40)
		plt.plot(np.linspace(-np.pi, np.pi, N), 1/(2*np.pi)*np.ones(N), color = 'red')
		plt.xlabel(r'$\phi$(rad)')
		plt.ylabel('Conteos')
		plt.savefig(GRAPHS_PATH + 'phiAtmospheric.eps', format = 'eps')
		plt.close()
		#plt.show()

		
		plt.title(r'Distribución atmosférica de $\theta$')
		plt.hist(theta, density = True, color = 'green', bins = 40)
		plt.plot(np.linspace(-np.pi/2, np.pi/2, N), polarDistributionVect(np.linspace(-np.pi/2, np.pi/2, N)), color = 'blue')
		plt.xlabel(r'$\theta$(rad)')
		plt.ylabel('Conteos')
		plt.savefig(GRAPHS_PATH + 'thetaAtmospheric.eps', format = 'eps')
		plt.close()
		#plt.show()		


		plt.title(r'Distribución atmosférica de $E$')
		plt.hist(energy[energy >= 0], density = True, color = 'orange', bins = 40)
		plt.plot(np.linspace(0, 20, N), energyDistribution2Vect(np.linspace(0, 20, N), mu = 1.1), color = 'black')
		plt.plot(np.linspace(0, 20, N), energyDistribution2Vect(np.linspace(0, 20, N), mu = 1.1), color = 'black')
		plt.xlabel(r'E(GeV)')
		plt.ylabel('Conteos')
		plt.savefig(GRAPHS_PATH + 'energyAtmospheric.eps', format = 'eps')
		plt.close()
		#plt.show()	


		plt.title(r'Distribución atmosférica de $x$')
		plt.hist(x, color = 'pink', density = True, bins = 40)
		plt.plot(np.linspace(-5, 5, N), 1/(10)*np.ones(N), color = 'black')
		plt.xlabel(r'$x$(cm)')
		plt.ylabel('Conteos')
		plt.savefig(GRAPHS_PATH + 'xAtmospheric.eps', format = 'eps')
		plt.close()
		#plt.show()		


		plt.title(r'Distribución atmosférica de $y$')
		plt.hist(y, color = 'brown', density = True, bins = 40)
		plt.plot(np.linspace(-5, 5, N), 1/(10)*np.ones(N), color = 'black')
		plt.xlabel(r'$y$(cm)')
		plt.ylabel('Conteos')
		plt.savefig(GRAPHS_PATH + 'yAtmospheric.eps', format = 'eps')
		plt.close()
		#plt.show()		


		"""
		plt.hist2d(x, y, bins = 40)
		plt.xlabel('x(cm)')
		plt.ylabel('y(cm)')
		plt.colorbar()
		plt.show()

		"""

	dx = -np.sin(theta)*np.cos(phi)
	dy = -np.sin(theta)*np.sin(phi)
	dz = -np.cos(theta)

	gamma = (energy/MUON_MASS_EV)*1E9 + 1

	energy = (1E9)* energy + MUON_MASS_EV*1E-9

	v  = SPEED_OF_LIGHT*np.sqrt(1-(1/(gamma**2)))

	vx = v*dx
	vy = v*dy
	vz = v*dz

	t = (2*DISTANCE)/(np.abs(vz))

	xFinal = x + vx*t*100
	yFinal = y + vy*t*100

	xCondition = np.abs(xFinal) < 5
	yCondition = np.abs(yFinal) < 5

	condition  = xCondition & yCondition

	# Filters

	vx = vx[condition]
	vy = vy[condition]
	vz = vz[condition]

	t = t[condition]

	x1 = x[condition]
	y1 = y[condition]

	x2 = x1 + vx*(t/2)*100
	y2 = y1 + vy*(t/2)*100

	x3 = xFinal[condition]
	y3 = yFinal[condition]

	dx = dx[condition]
	dy = dy[condition]
	dz = dz[condition]

	energy = energy[condition]

	if(makeGraphs):

		plt.title(r'Distribución en el detector de $E$')
		plt.hist(energy, density = False, color = 'orange', bins = 40)
		plt.xlabel(r'E(eV)')
		plt.ylabel('Conteos')
		plt.savefig(GRAPHS_PATH + 'energyDetector.eps', format = 'eps')
		plt.close()
		#plt.show()


		plt.title(r'Distribución en el TGEM3 de $x$')
		plt.hist(x3, color = 'pink', density = False, bins = 40)
		plt.xlabel(r'$x$(cm)')
		plt.ylabel('Conteos')
		plt.savefig(GRAPHS_PATH + 'xDetector.eps', format = 'eps')
		plt.close()
		#plt.show()

		plt.title(r'Distribución en el TGEM3 de $y$')
		plt.hist(y3, color = 'brown', density = False, bins = 40)
		plt.xlabel(r'$y$(cm)')
		plt.ylabel('Conteos')
		plt.savefig(GRAPHS_PATH + 'yDetector.eps', format = 'eps')
		plt.close()
		#plt.show()

		plt.title(r'Distribución en el detector de $\hat v_x$')
		plt.hist(dx, color = 'blue', density = False, bins = 40)
		plt.xlabel(r'$\hat v_x$')
		plt.ylabel('Conteos')
		plt.savefig(GRAPHS_PATH + 'dxDetector.eps', format = 'eps')
		plt.close()
		#plt.show()

		plt.title(r'Distribución en el detector de $\hat v_y$')
		plt.hist(dy, density = False, color = 'green', bins = 40)
		plt.xlabel(r'$\hat v_y$')
		plt.ylabel('Conteos')
		plt.savefig(GRAPHS_PATH + 'dyDetector.eps', format = 'eps')	
		plt.close()
		#plt.show()

		plt.title(r'Distribución en el detector de $\hat v_z$')
		plt.hist(dz, density = False, color = 'purple', bins = 40)
		plt.xlabel(r'$\hat v_z$')
		plt.ylabel('Conteos')
		plt.savefig(GRAPHS_PATH + 'dzDetector.eps', format = 'eps')	
		plt.close()
		#plt.show()


	frame = pd.DataFrame({
						'x1': x1,
						'x2': x2,
						'x3': x3,
						'y1': y1,
						'y2': y2,
						'y3': y3,
						'energy': energy, 
						'dx': dx, 
						'dy': dy,
						'dz': dz
					})

	frame.index.name = 'Id'

	return frame


