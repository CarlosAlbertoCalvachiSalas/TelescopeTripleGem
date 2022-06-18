cd 400

echo V=400

for ar in {60,65,70,75,80}
do
	for e in {7,8,9,10,11}
	do
		./muon_track ar=$ar intEnergy=$e &
		echo intEnergy=$e
	done
	wait
	echo ar=$ar
done

cd ..

for v in {410,420,430,440,450,460,470,480,490,500}
do
	for ar in {60,65,70,75,80}
	do
		cd $v
		./muon_track ar=$ar &
		echo ar=$ar
		cd ..
	done
	wait
	echo V=$v
done