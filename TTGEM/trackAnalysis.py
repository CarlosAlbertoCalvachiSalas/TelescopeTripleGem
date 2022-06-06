import numpy as np 
import matplotlib.pyplot as plt
import pandas as pd
from trackModule import * 

import os 

TTGEM_FOLDER = 'TTGEMData/'

currentPath = os.getcwd()

TTGEM_PATH  = currentPath + '/'+ TTGEM_FOLDER

TTGEMsFiles = os.listdir(TTGEM_PATH)

TTGEMsFiles = np.array(TTGEMsFiles, dtype = np.dtype('U'))

TTGEMsFiles = TTGEMsFiles[np.chararray.endswith(TTGEMsFiles, '.csv')]

finalDataFrame = pd.DataFrame(columns = ['Id', 'name', 'x', 'y', 'z', 'dx', 'dy', 'dz', 'v'])


def readTTGEMData(link, mode = 'TTGEM'):

	dataFrame = pd.read_csv(TTGEM_PATH + '/' + link)	

	TTGEMserial = int(link.split('.')[0])

	names = np.array(dataFrame['name'], dtype = np.dtype('O'))

	x = np.array(dataFrame['x'])
	y = np.array(dataFrame['y'])
	dx = np.array(dataFrame['dx'])
	dy = np.array(dataFrame['dy'])

	if(mode == 'TTGEM'):
		return TTGEM(TTGEMserial)
	else:
		return dataFrame


allTTGEMs = np.vectorize(readTTGEMData, otypes = [np.dtype('O')])(np.array(TTGEMsFiles, dtype = np.dtype('O')))

print(TTGEMsFiles)

print(allTTGEMs)

allGroup = TTGEMGroup(allTTGEMs)

verticalGroup 		= allGroup.getVertical()
centralGroup 		= allGroup.getCentral()
inclinatedGroup 	= allGroup.getInclinated()

movingInXGroup 		= allGroup.getInclinated().getMovingIn('x')
movingInYGroup		= allGroup.getInclinated().getMovingIn('y')

verticalConstantXGroup = verticalGroup.getConstant('x')
verticalConstantYGroup = verticalGroup.getConstant('y')

allGroup.graphMuonTracks()


#verticalGroup.graphMuonTracks()

centralGroup.histAllGains()
centralGroup.histAllGains(belowNumDev = 2)
centralGroup.plotEfficiencies(mode = 'chain')
centralGroup.plotEfficiencies(mode = 'independent')
centralGroup.graphMuonTracks()


verticalConstantXGroup.graphMuonTracks('y')
verticalConstantXGroup.plotAverageGainAxis('y')
verticalConstantXGroup.plotAverageGainByChannelAxis('y')
verticalConstantXGroup.plotAverageDifferenceAxis('y')
verticalConstantXGroup.plotAverageDifferenceByChannelAxis('y')

verticalConstantYGroup.graphMuonTracks('x')
verticalConstantYGroup.plotAverageGainAxis('x')
verticalConstantYGroup.plotAverageGainByChannelAxis('x')
verticalConstantYGroup.plotAverageDifferenceAxis('x')
verticalConstantYGroup.plotAverageDifferenceByChannelAxis('x')


inclinatedGroup.graphMuonTracks()


movingInXGroup.graphMuonTracks('x')
movingInXGroup.plotAverageGainAxis('x')
movingInXGroup.plotAverageGainByChannelAxis('x')
movingInXGroup.plotAverageDifferenceAxis('x')
movingInXGroup.plotAverageDifferenceByChannelAxis('x')

movingInYGroup.graphMuonTracks('x')
movingInYGroup.plotAverageGainAxis('y')
movingInYGroup.plotAverageGainByChannelAxis('y')
movingInYGroup.plotAverageDifferenceAxis('y')
movingInYGroup.plotAverageDifferenceByChannelAxis('y')



"""
print('all', allGroup.TTGEMArray)
print('vertical', TTGEMsFiles[np.isin(allGroup.TTGEMArray, verticalGroup.TTGEMArray)])
print('central', TTGEMsFiles[np.isin(allGroup.TTGEMArray, centralGroup.TTGEMArray)])
print('inclinated', TTGEMsFiles[np.isin(allGroup.TTGEMArray, inclinatedGroup.TTGEMArray)])
print('movingInX', TTGEMsFiles[np.isin(allGroup.TTGEMArray, movingInXGroup.TTGEMArray)])
print('movingInY', TTGEMsFiles[np.isin(allGroup.TTGEMArray, movingInYGroup.TTGEMArray)])
print('verticalConstantX', TTGEMsFiles[np.isin(allGroup.TTGEMArray, verticalConstantXGroup.TTGEMArray)])
print('verticalConstantY', TTGEMsFiles[np.isin(allGroup.TTGEMArray, verticalConstantYGroup.TTGEMArray)])

"""


"""
allDataFrames = np.vectorize(readTTGEMData, otypes = [np.dtype('O')], excluded = [1])(np.array(TTGEMsFiles, dtype = np.dtype('O')), 'dataFrame')

finalDataFrame = finalDataFrame.append(list(allDataFrames))

allNames 	=  np.array(finalDataFrame['name'], dtype = np.dtype('U'))

#print(allNames + '.csv')

sourceString = 'scp -r ca.calvachi@hep-server1.uniandes.edu.co:'

endString = ' /Users/carlosalbertosalassalas/Downloads/ProyectoExperimental/Codigo/TTGEM/electronsData/electronsData'

PATH_IN_SERVER = '/home/ca.calvachi/TTGEM/TTGEM2/electronsData/'

filesString = '"'+ " ".join(list(np.char.add(PATH_IN_SERVER, np.char.add(allNames, '.csv')))) + '"' 

string = sourceString + filesString + endString


"""

#tgemTest = TTGEM(1498245490)

#print(tgemTest.TGEMS)


