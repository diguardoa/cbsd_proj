
for rat in 200 210 220 230 240 250 260 270 280 290 300 310 320 330 340 350 360 370 380 390 400 410 420 430 440 450 460 470 480 490 500
do
let "con = ${rat} * 5"
mkdir cpu2_rate${rat}_conn${con}


for i in `seq 1 30`;
do
	echo $i
	taskset -c 2 httperf --server=192.168.122.190 --uri=/random_file_small.html --num-conns ${con} --rate ${rat} --timeout 1 > ./cpu2_rate${rat}_conn${con}/rfs_190_${i}.txt &
	taskset -c 3 httperf --server=192.168.122.191 --uri=/random_file_small.html --num-conns ${con} --rate ${rat} --timeout 1 > ./cpu2_rate${rat}_conn${con}/rfs_191_${i}.txt &
	wait %1 %2
	sleep 2s
done
sleep 10s
done
