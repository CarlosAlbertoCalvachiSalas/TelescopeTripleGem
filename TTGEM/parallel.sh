cd TTGEMData/TTGEMDataAtmospheric
c=1

regex='(\d+)\.csv'

for x in *.csv
do 
	name="${x%.*}"
	echo $name
	cd ../../
	./muon_track $name &
	cd TTGEMData/TTGEMDataAtmospheric
	if [[ $(($c % 10)) == 0 ]]
	then
		echo $c
		wait
	fi
	let c=c+1
done

cd ../..