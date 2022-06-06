import numpy as np 
import pandas as pd
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D

plt.rcParams.update({
  "text.usetex": True,
  "font.family": "sans-serif"
})

#	Paths

ELECTRONS_DATA_PATH 	= 'electronsData/'

AVALANCHES_DATA_PATH 	= 'avalanchesData/'

EVENTS_DATA_PATH 		= 'eventsData/'

TTGEM_DATA_PATH 		= 'TTGEMData/'

#	TTGEM graphs path

TTGEM_GRAPHS_PATH = 'TTGEMGraphs/'

#	Constants 

MUON_MASS_EV			= 105.6583755E6

SPEED_OF_LIGHT 			= 299792458

#	Detector Constants

INTER_GEM_DISTANCE 		= 2.5

INTRA_GEM_DISTANCE 		= (0.906)/100

#	Functions (Trayectory)

def linearTrajectory(t, x0, y0, z0, x1, y1, z1, dx, dy, dz, v):

	vx = v*dx
	vy = v*dy
	vz = v*dz

	x = x0 + vx*t
	y = y0 + vy*t
	z = z0 + vz*t

	return np.array([x, y, z])

def linearTrajectoryVect(t, x0, y0, z0, x1, y1, z1, dx, dy, dz, v):
	return np.vectorize(linearTrajectory, excluded = np.arange(10) + 1, signature = '()->(n)')(t, x0, y0, z0, x1, y1, z1, dx, dy, dz, v)


def trajectoryZFunc(x0, y0, z0, x1, y1, z1, points = 10000):

	myz = (y1 - y0)/(z1 - z0)

	mxz = (x1 - x0)/(z1 - z0)

	z = np.linspace(z0, z1, points)

	x = mxz*(z-z0) + x0

	y = myz*(z-z0) + y0

	return x, y, z

#	Functions (Vectorization)


def TGEMVect(serials):
	return np.vectorize(TGEM)(serials)

def dataFrameVect(objects, attr):
	return np.vectorize(getattr, excluded = [1], otypes = [np.dtype('O')])(objects, attr)

def MuonTrackVect(id, x0, y0, z0, x1, y1, z1):
	return np.vectorize(MuonTrack)(id, x0, y0, z0, x1, y1, z1)

def getEfficienciesVect(TTGEMArray, threshold, mode = 'chain'):
	return np.vectorize(TTGEM.getEfficiencies, excluded = [1, 2], signature = '()->(n)')(TTGEMArray, threshold, mode)

def getAttrVectObj(objects, attr):
	return np.vectorize(getattr, excluded = [1], signature = '()->(n)')(objects, attr)

def getAttrSingleVectObj(objects, attr):
	return np.vectorize(getattr, excluded = [1])(objects, attr)

def getAttrArrayVectObj(objects, attr):
	return np.vectorize(getattr, excluded = [1], signature = '()->(n,m)')(objects, attr)


# Processing

def reconstructEventsData(electronDataFrame, serial = None):

	collectedDataFrame = electronDataFrame[electronDataFrame['z'] <= -0.6029]

	groupByEvent = electronDataFrame.groupby('step')
	groupByEventCollected = collectedDataFrame.groupby('step') 

	eventsId		= 	np.unique(collectedDataFrame['step'])
	totalCounts		=	groupByEvent.count()['x']
	collectedCounts =	groupByEventCollected.count()['x']

	xMean			= groupByEventCollected.mean()['x']
	yMean			= groupByEventCollected.mean()['y']

	reconstructedEventsDataFrame = pd.DataFrame({
		'event': eventsId, 
		'collected': collectedCounts,
		'total': totalCounts, 
		'x':xMean,
		'y': yMean})


	if(serial):

		reconstructedEventsDataFrame.to_csv(EVENTS_DATA_PATH + '{}.csv'.format(serial))
 
	return reconstructedEventsDataFrame

# Create title and name

def createTitle():
	pass

def createName():
	pass

# Graphs

def histogram(series, belowNumDev = None,  **kwargs):

	fig = plt.figure()

	mu = np.mean(series)
	std = np.std(series)

	if(belowNumDev):
		#print(len(series[series < mu + 2*std])/len(series))
		#print(len(series[series < mu + std])/len(series))

		plt.hist(series[series < mu + 2*std], color = 'blue', bins = 40)

	else:

		plt.hist(series, color = 'blue', bins = 40)

	plt.ylabel('Conteos')

	print(mu, std)

	return mu, std

def errorbarPlot(coordinates, variable, errorVariable, **kwargs):

	fig = plt.figure()

	plt.errorbar(coordinates, variable, errorVariable, fmt='.', color = 'black', capsize = 2)

	return fig

def errorbarChannelsPlot(coordinates, variable, errorVariable, **kwargs):

	fig = plt.figure()

	plt.errorbar(coordinates[:, 0], variable[:, 0], errorVariable[:, 0], fmt='.', color = 'black', capsize = 2, label = 'TGEM1')
	plt.errorbar(coordinates[:, 1], variable[:, 1], errorVariable[:, 1], fmt='.', color = 'green', capsize = 2, label = 'TGEM2')
	plt.errorbar(coordinates[:, 2], variable[:, 2], errorVariable[:, 2], fmt='.', color = 'blue', capsize = 2, label = 'TGEM3')
	plt.legend()

	return fig


def plotTGEMEfficiencies(efficiencies, devNum, color = 'blue'):

	plt.plot(np.arange(3) + 1, efficiencies, label = str(devNum) + r'$\sigma$', color = color)
	plt.scatter(np.arange(3) + 1, efficiencies, color = color)

	plt.ylabel('Eficiencia')
	plt.xlabel('Número del TGEM')
	plt.legend()

def trackPlot(ax, x, y, xMuon, yMuon, zMuon, **kwargs):
	
	#ax.scatter(x, y, zMuon, color = 'blue')

	ax.scatter(x[0], y[0], zMuon[0], color = 'blue')
	ax.scatter(x[1], y[1], zMuon[1], color = 'blue')
	ax.scatter(x[2], y[2], zMuon[2], color = 'blue')

	muonX, muonY, muonZ = trajectoryZFunc(xMuon[0], yMuon[0], zMuon[0], xMuon[2], yMuon[2], zMuon[2])

	ax.plot(muonX, muonY, muonZ, color = 'green')

	xAverage = np.mean(x, axis = 1)
	yAverage = np.mean(y, axis = 1)

	r1X, r1Y, r1Z 	= trajectoryZFunc(xAverage[0], yAverage[0], zMuon[0], xAverage[1], yAverage[1], zMuon[1])
	r2X, r2Y, r2Z	= trajectoryZFunc(xAverage[1], yAverage[1], zMuon[1], xAverage[2], yAverage[2], zMuon[2])

	rX = np.append(r1X, r2X)
	rY = np.append(r1Y, r2Y)
	rZ = np.append(r1Z, r2Z)

	ax.plot(rX, rY, rZ, color = 'black', linestyle = '--')

	ax.set_xlabel('x(cm)')
	ax.set_ylabel('y(cm)')
	ax.set_zlabel('z(m)')

	return 0

def vectTrackPlot(ax, xAll, yAll, xMuonAll, yMuonAll, zMuonAll, **kwargs):

	return np.vectorize(trackPlot, excluded = [0], otypes = [np.dtype('O')], signature = '(n,m), (n,m), (n), (n), (n) -> ()')(ax, xAll, yAll, xMuonAll, yMuonAll, zMuonAll)


# Classes

class TGEM():

	def __init__(self, serial):

		self.serial = serial

		self.electronsDataPath 	= ELECTRONS_DATA_PATH + str(serial) + '.csv'
		#self.avalanchesDataPath = AVALANCHES_DATA_PATH + str(serial) + '.csv'
		self.eventsDataPath  	= EVENTS_DATA_PATH + str(serial) + '.csv'

		self.getData()


	def getData(self):

		try:
			self.eventsDataFrame = pd.read_csv(self.eventsDataPath)
		
		except Exception as e:

			self.electronsDataFrame = pd.read_csv(self.electronsDataPath)
			self.eventsDataFrame = reconstructEventsData(self.electronsDataFrame, self.serial)
			#self.eventsDataFrame.to_csv(self.electronsDataPath)

		#self.avlanchesDataFrame = pd.read_csv(self.avalanchesDataPath)

		self.idArray  = np.unique(self.eventsDataFrame['event'])	
		
		self.getGain()

		self.getCoordinates()

	def getGain(self):

		self.gain 	 = np.array(self.eventsDataFrame['collected'])

	def getCoordinates(self):

		self.x 		=  np.array(self.eventsDataFrame['x'])
		self.y 		=  np.array(self.eventsDataFrame['y'])


class TTGEM():

	def __init__(self, serial):

		self.serial = serial	
		self.TTGEMDataPath  = TTGEM_DATA_PATH + str(serial) + '.csv'

		self.getData()

		self.getTGEMS()

		self.setMuonTracks()

		#self.graphTrayectory()

	def getData(self):

		self.TTGEMdataFrame = pd.read_csv(self.TTGEMDataPath)


		self.xMuon = np.array(self.TTGEMdataFrame['x'])
		self.yMuon = np.array(self.TTGEMdataFrame['y'])
		self.zMuon = np.array([ 0, -1*INTER_GEM_DISTANCE, -2*INTER_GEM_DISTANCE])

		self.areMuonsVertical =  len(np.unique(self.xMuon)) == 1 and len(np.unique(self.yMuon)) == 1

		self.areMuonsCentral = self.areMuonsVertical and np.all(self.xMuon == 0) and np.all(self.yMuon == 0) 

	def getTGEMS(self):

		self.serialsTGEMS = np.array(self.TTGEMdataFrame['name'])
	
		self.TGEMS   	= TGEMVect(self.serialsTGEMS)

		allDataFramesList = list(np.array(dataFrameVect(self.TGEMS, 'eventsDataFrame')))

		self.allDataFrames = pd.DataFrame(columns = allDataFramesList[0].columns)

		self.allDataFrames = self.allDataFrames.append(allDataFramesList)

		self.getGains()

	def getGains(self):

		self.gains = np.array(getAttrVectObj(self.TGEMS, 'gain'))

		self.events = self.gains.shape[1]

		self.TTGEMGains = np.sum(self.gains, axis = 0)

		self.allGains = np.matrix.flatten(self.gains)

		self.getAverageGains()


	def getEfficiencies(self, threshold, mode):

		if(mode == 'chain'):
			conditionArray1 = self.gains[0] <= threshold
			conditionArray2 = np.all(self.gains[:2] <= threshold, axis = 0)
			conditionArray3 = np.all(self.gains <= threshold, axis = 0)
		else:
			conditionArray1 = self.gains[0] <= threshold
			conditionArray2 = self.gains[1] <= threshold
			conditionArray3 = self.gains[2] <= threshold

		return np.array([np.sum(conditionArray1)/self.events , np.sum(conditionArray2)/self.events, np.sum(conditionArray3)/self.events])

	def getAverageGains(self):

		self.averageGain = np.average(self.TTGEMGains)
		self.devGain	  = np.std(self.TTGEMGains)/np.sqrt(len(self.TTGEMGains))

		self.averageTGEMsGain = np.average(self.gains, axis = 1)
		self.devTGEMsGain = np.std(self.gains, axis = 1)/np.sqrt(len(self.gains))

	def setMuonTracks(self):
		
		self.idTGEMArray = getAttrVectObj(self.TGEMS, "idArray")

		self.x = getAttrVectObj(self.TGEMS, "x")
		self.y = getAttrVectObj(self.TGEMS, "y")

		self.xDifferences = self.x - self.xMuon.reshape(-1,1)
		self.yDifferences = self.y - self.yMuon.reshape(-1,1)

		self.differences = np.sqrt(self.xDifferences**2 + self.yDifferences**2) 

		self.allDifferences = np.matrix.flatten(self.differences)

		self.getAverageCoordinates()

	def getAverageCoordinates(self):

		self.xAverage = np.mean(self.x, axis = 1)
		self.yAverage = np.mean(self.y, axis = 1)

		self.xDev	  = np.std(self.x, axis = 1)/np.sqrt(len(self.x))
		self.yDev	  = np.std(self.y, axis = 1)/np.sqrt(len(self.y))

		self.xDifferencesAverage = np.mean(self.xDifferences, axis = 1)
		self.yDifferencesAverage = np.mean(self.yDifferences, axis = 1)	

		self.differencesAverage = np.mean(self.differences, axis = 1)

		self.allDifferencesAverage = np.mean(self.allDifferences)


		self.xDifferencesDev	  = np.std(self.xDifferences, axis = 1)/np.sqrt(len(self.xDifferences))
		self.yDifferencesDev	  = np.std(self.yDifferences, axis = 1)/np.sqrt(len(self.yDifferences))

		self.differencesDev     = np.std(self.differences, axis = 1)/np.sqrt(len(self.differences))

		self.allDifferencesDev = np.std(self.allDifferences)/np.sqrt(len(self.allDifferences))

	def graphTrayectory(self):

		x1, x2, x3 = self.x
		y1, y2, y3 = self.y

		z1, z2, z3 = 0, -1*INTER_GEM_DISTANCE, -2*INTER_GEM_DISTANCE

		#print(x1)
		#print(y1)

		fig = plt.figure()
		ax  = fig.add_subplot(111, projection='3d')
		ax.scatter(x1, y1, z1, color = 'blue', s = 3)
		ax.scatter(x2, y2, z2, color = 'red', s = 3)
		ax.scatter(x3, y3, z3, color = 'black', s = 3)
		ax.set_xlabel('x(cm)')
		ax.set_ylabel('y(cm)')
		ax.set_zlabel('z(m)')

		#ax.set_xlim(-0.2, 0.2)
		#ax.set_ylim(0, 0.20)

		#self.muonTrack1 = MuonTrackVect(self.idTGEMArray[0], x1, y1, z1, x2, y2, z2)
		#self.muonTrack2 = MuonTrackVect(self.idTGEMArray[1], x2, y2, z2, x3, y3, z3)

class MuonTrack():

	def __init__(self, id = 0, x0 = 0.0, y0 = 0.0, z0 = 0.0, x1 = 0.0, y1 = 0.0, z1 = 0.0, dx = 0.0, dy = 0.0, dz = -1.0, energy = 1E9, travelZDistance = INTER_GEM_DISTANCE):

		self.id 	= id

		self.setCoordinates(x0, y0, z0, x1, y1, z1)
		self.setDirection()
		self.setEnergy(energy)
		self.calculateTrayectory(energy, travelZDistance)

		#self.graphTrayectory()

	def setCoordinates(self, x0, y0, z0, x1, y1, z1):
		self.x0 = x0
		self.y0 = y0
		self.z0 = z0

		self.x1 = x1
		self.y1 = y1
		self.z1 = z1


	def setDirection(self):

		norm = np.sqrt((self.x1 - self.x0)**2 + (self.y1 - self.y0)**2 + (self.z1 - self.z0)**2)
		self.dx = (self.x1 - self.x0)/norm
		self.dy = (self.y1 - self.y0)/norm
		self.dz = (self.z1 - self.z0)/norm

	def setEnergy(self, energy):

		self.energy = energy

	def calculateTrayectory(self, energy, travelZDistance):

		self.gamma = self.energy/MUON_MASS_EV
		self.v = SPEED_OF_LIGHT * np.sqrt(1 - (1/(self.gamma**2)))
		
		self.travelZDistance = travelZDistance
		self.tTot = self.travelZDistance/np.abs(self.v*self.dz)

		self.tTrack = np.linspace(0, self.tTot, 10000)

		self.xTrack, self.yTrack, self.zTrack = np.transpose(linearTrajectoryVect(self.tTrack, self.x0, self.y0, self.z0, self.x1, self.y1, self.z1, self.dx, self.dy, self.dz, self.v))

	def graphTrayectory(self):

		fig = plt.figure()
		ax  = fig.add_subplot(111, projection='3d')
		ax.plot(self.xTrack, self.yTrack, self.zTrack, color = 'blue')
		
		#plt.show()


class TTGEMGroup():

	def __init__(self, TTGEMArray, tag = ''):

		self.TTGEMArray = np.array(TTGEMArray, dtype = np.dtype('O')) 
		self.tag = tag

		self.getJointDataFrame()

	def histGains(self):
		pass

	def histAllGains(self, belowNumDev = None):

		#print('Events', len(np.matrix.flatten(self.getAllGains())))

		histogram(np.matrix.flatten(self.getAllGains()),  belowNumDev = belowNumDev)

		plt.xlabel('Ganancia')

		if(belowNumDev):

			plt.title('Distribución corregida de la ganancia para muones centrales')
			plt.savefig(TTGEM_GRAPHS_PATH + 'histGanancia{}Dev.eps'.format(belowNumDev), format = 'eps')
		
		else:

			plt.title('Distribución de la ganancia para muones centrales')
			plt.savefig(TTGEM_GRAPHS_PATH + 'histGanancia.eps', format = 'eps')

		#plt.show()

	def histTTGEMGains(self):
		pass

	def plotAverageGainAxis(self, axis = 'x'):

		errorbarPlot(self.getAxisMuonCoordinates(axis = axis)[:, 2], self.getAverageGains(), self.getDevGains())

		plt.ylabel('Ganancia')
		plt.xlabel(axis + '(cm)')
		plt.title('Ganancia contra posición en {} para muones {}'.format(axis, self.tag))
		plt.savefig(TTGEM_GRAPHS_PATH + 'gain{}{}.eps'.format(self.tag, axis), format = 'eps')
		
		#plt.show()

	def plotAverageGainByChannelAxis(self, axis = 'x'):

		errorbarChannelsPlot(self.getAxisMuonCoordinates(axis = axis), self.getAverageGainsByTGEM(), self.getDevGainsByTGEM())

		plt.ylabel('Ganancia')
		plt.xlabel(axis + '(cm)')
		plt.title('Ganancia contra posición en {} para muones {} por TGEM'.format(axis, self.tag))
		plt.savefig(TTGEM_GRAPHS_PATH + 'gainTGEMs{}{}.eps'.format(self.tag, axis), format = 'eps')

		#plt.show()

	def plotAverageDifferenceAxis(self, axis = 'x'):

		errorbarPlot(self.getAxisMuonCoordinates(axis = axis)[:, 2], self.getAverageDifferences(), self.getDevDifferences())

		plt.ylabel('Diferencia (cm)')
		plt.xlabel(axis + '(cm)')
		plt.title('Diferencia contra posición en {} para muones {}'.format(axis, self.tag))
		plt.savefig(TTGEM_GRAPHS_PATH + 'diff{}{}.eps'.format(self.tag, axis), format = 'eps')

		#plt.show()

	def plotAverageDifferenceByChannelAxis(self, axis = 'x'):

		errorbarChannelsPlot(self.getAxisMuonCoordinates(axis = axis), self.getAverageDifferencesByTGEM(), self.getDevDifferencesByTGEM())

		plt.ylabel('Diferencia (cm)')
		plt.xlabel(axis + '(cm)')
		plt.title('Diferencia contra posición en {} para muones {} por TGEM'.format(axis, self.tag))
		plt.savefig(TTGEM_GRAPHS_PATH + 'diffTGEMs{}{}.eps'.format(self.tag, axis), format = 'eps')

		#plt.show()

	def plotEfficiencies(self, mode = 'chain'):

		fig = plt.figure()

		efficienciesSigma1 = self.getAverageEfficiencyArray(devNum = 1, mode=mode)
		
		plotTGEMEfficiencies(efficienciesSigma1, 1, color = 'blue')

		efficienciesSigma2 = self.getAverageEfficiencyArray(devNum = 2, mode=mode)

		plotTGEMEfficiencies(efficienciesSigma2, 2, color = 'green')

		if(mode == 'chain'):
			modeString = 'apilada'
		else:
			modeString = 'independiente'

		plt.ylabel('Eficiencia')
		plt.xlabel('Número del GEM')
		plt.title('Eficiencia {} de los TGEM con muones {}'.format(modeString, self.tag))
		plt.savefig(TTGEM_GRAPHS_PATH + 'plotEfficiencyTGEMs{}.eps'.format(mode), format = 'eps')

		#plt.show()


	def getJointDataFrame(self):
		
		allDataFrames =  list(np.array(dataFrameVect(self.TTGEMArray,'allDataFrames')))

		seriesIDs     =	 np.arange(len(allDataFrames)) + 1

		self.finalDataFrame = pd.DataFrame(columns = allDataFrames[0].columns)

		self.finalDataFrame = self.finalDataFrame.append(allDataFrames)

		self.graphDistanceGain()

	def graphDistanceGain(self):

		averageDifferences = self.getAverageDifferences()
		averageGains 			 = self.getAverageGains()

		plt.scatter(averageDifferences, averageGains, color = 'black')
		plt.title('Diferencia promedio contra ganancias')
		plt.xlabel('Diferencia Promedio(cm)')
		plt.ylabel('Ganancia')
		#plt.show()

	def graphMuonTracks(self, axis = ''):

		fig = plt.figure()

		ax  = fig.add_subplot(111, projection='3d')

		xAll = self.getAllCoordinates(axis = 'x')
		yAll = self.getAllCoordinates(axis = 'y')
		
		xMuonAll = self.getAxisMuonCoordinates(axis = 'x')
		yMuonAll = self.getAxisMuonCoordinates(axis = 'y')
		zMuonAll = self.getAxisMuonCoordinates(axis = 'z')

		vectTrackPlot(ax, xAll, yAll, xMuonAll, yMuonAll, zMuonAll)

		titleText = 'Muones {} reconstruidos'.format(self.tag)

		if(axis != ''):
			plt.title(titleText + ' con {} variable'.format(axis))

		else:
			plt.title(titleText)

		titleFigName = 'track{}{}.eps'.format(self.tag, axis)

		plt.savefig(TTGEM_GRAPHS_PATH + titleFigName)

		#plt.show()

	def getAxisMuonCoordinates(self, axis = 'x'):

		return np.array(getAttrVectObj(self.TTGEMArray, axis + 'Muon'))

	def getAxisAverageCoordinates(self, axis = 'x'):

		return np.array(getAttrVectObj(self.TTGEMArray, axis + 'Average'))

	def getAxisDevCoordinates(self, axis = 'x'):

		return np.array(getAttrVectObj(self.TTGEMArray, axis + 'Dev'))

	def getAllCoordinates(self, axis = 'x'):

		return np.array(getAttrArrayVectObj(self.TTGEMArray, axis))



	def getAverageGains(self):

		return np.array(getAttrSingleVectObj(self.TTGEMArray, 'averageGain'))

	def getDevGains(self):

		return np.array(getAttrSingleVectObj(self.TTGEMArray, 'devGain')) 
	
	def getAllGains(self):

		return np.array(getAttrVectObj(self.TTGEMArray, 'allGains'))

	def getAverageGainsByTGEM(self):

		return np.array(getAttrVectObj(self.TTGEMArray, 'averageTGEMsGain'))
	
	def getAllEventsNumber(self):

		return np.array(getAttrSingleVectObj(self.TTGEMArray, 'events'))

	def getTotalEvents(self):

		return np.sum(self.getAllEventsNumber())

	def getEfficiencyArray(self, devNum = 2, mode = 'chain'):

		mu = np.mean(self.getAllGains())

		std = np.std(self.getAllGains())

		return np.array(getEfficienciesVect(self.TTGEMArray, mu + devNum*std, mode))

	def getAverageEfficiencyArray(self, devNum = 2, mode = 'chain'):

		efficiencyArray = self.getEfficiencyArray(devNum, mode)

		return np.sum(((efficiencyArray*self.getAllEventsNumber().reshape(-1,1))/(self.getTotalEvents())), axis = 0 )

	def getDevGainsByTGEM(self):

		return np.array(getAttrVectObj(self.TTGEMArray, 'devTGEMsGain'))



	def getAverageDifferences(self):

		return np.array(getAttrSingleVectObj(self.TTGEMArray, 'allDifferencesAverage'))

	def getDevDifferences(self):

		return np.array(getAttrSingleVectObj(self.TTGEMArray, 'allDifferencesDev'))
	
	def getAverageDifferencesByTGEM(self):

		return np.array(getAttrVectObj(self.TTGEMArray, 'differencesAverage'))
	
	def getDevDifferencesByTGEM(self):

		return np.array(getAttrVectObj(self.TTGEMArray, 'differencesDev'))

	"""
	def getTotalGains(self):

		return np.array(getAttrSingleVectObj(self.TTGEMArray, 'totalGain'))
	"""

	def getVertical(self):

		index = getAttrSingleVectObj(self.TTGEMArray, 'areMuonsVertical')

		return TTGEMGroup(self.TTGEMArray[index], tag = 'verticales')

	def getCentral(self):

		index = getAttrSingleVectObj(self.TTGEMArray, 'areMuonsCentral')

		return TTGEMGroup(self.TTGEMArray[index], tag = 'centrales')

	def getInclinated(self):

		index = ~getAttrSingleVectObj(self.TTGEMArray, 'areMuonsVertical')

		return TTGEMGroup(self.TTGEMArray[index], tag = 'inclinados')

	def getConstant(self, axis = 'x', value = 0):

		coordinates = np.array(getAttrVectObj(self.TTGEMArray, axis + 'Muon'))

		index = np.all(coordinates == value, axis = 1)

		return TTGEMGroup(self.TTGEMArray[index], tag = self.tag)


	def getMovingIn(self, axis = 'x'):

		coordinates = np.array(getAttrVectObj(self.TTGEMArray, axis + 'Muon'))

		index = np.sum(np.abs(coordinates), axis = 1) > 0

		return TTGEMGroup(self.TTGEMArray[index], tag = self.tag)

	def getMovingTo(self, mode = '+x'):

		sign = mode[0]
		axis = mode[1]

		coordinates = np.array(getAttrVectObj(self.TTGEMArray, axis + 'Muon'))

		if(sign == '+'):

			index = np.max(coordinates, axis = 1) > 0

		else:
			
			index = np.max(coordinates, axis = 1) < 0 

		return TTGEMGroup(self.TTGEMArray[index], tag = self.tag)

