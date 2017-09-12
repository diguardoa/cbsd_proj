# cambiare nome cartella nel caso si tratti di base (cpu2) o comp (cpu1) scenario

mkdir workload_cpu1
for rat in 200 210 220 230 240 250 260 270 280 290 300 310 320 330 340 350 360 370 380 390 400 410 420 430 440 450 460 470 480 490 500
do
let "con = ${rat} * 60 * 1"

	taskset -c 2 httperf --server=192.168.122.190 --uri=/random_file_small.html --num-conns ${con} --rate ${rat} --timeout 1 > /dev/null &
	taskset -c 3 httperf --server=192.168.122.191 --uri=/random_file_small.html --num-conns ${con} --rate ${rat} --timeout 1 > /dev/null &
	dstat -C 0,1 > ./workload_cpu1/${rat}.txt &
	wait %1 %2
	kill %3
	sleep 2s
done
sleep 10s
done
