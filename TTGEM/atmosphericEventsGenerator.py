import numpy as np
import pandas as pd

from muonsDistributions import eventsGenerator

TTGEM_DATA_PATH 	= 'TTGEMData/TTGEMDataAtmospheric/'

class EventsGenerator():
 
	def __init__(self, N, partitions = 40, export = True, makeGraphs = False):

		self.N = N
		self.makeGraphs = makeGraphs

		self.setPartitions(partitions)

		self.generateEvents()
		self.getSelectionList()
		self.setSerials()


		if(export):
			self.exportEvents()

	def generateEvents(self):
		self.eventsFrame = eventsGenerator(self.N, self.makeGraphs)

	def getSelectionList(self):
		self.selectionList = np.array(np.array_split(self.eventsFrame, self.partitions), dtype = np.dtype('O'))
		
	def setSerials(self):

		self.TTGEMserials = np.random.randint(low = 1000000000 , high = 9999999999 , size = self.partitions)

	def setPartitions(self, partitions):
		self.partitions = partitions

	def exportEvents(self):

		self.TTGEMserialsStrings = np.array(self.TTGEMserials, dtype = np.dtype('U'))

		self.eventsLinks =  np.char.add(TTGEM_DATA_PATH, np.char.add(self.TTGEMserialsStrings, '.csv'))

		np.vectorize(pd.DataFrame.to_csv)(self.selectionList, self.eventsLinks)


N = 100000

eGenerator = EventsGenerator(N, partitions = 1, export = False, makeGraphs = True)


