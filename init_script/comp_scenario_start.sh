# nel caso di una CPU uso solo la cpu 0
sudo cpufreq-set -c 0 -g userspace
sudo cpufreq-set -c 0 -f 800Mhz

# faccio partire le macchine virtuali
# a fini didattici si sono utilizzati i cgroups, identica procedura con taskset
sudo cgexec -g cpuset:VMGroup qemu-system-x86_64 -smp 1 -m 1024 tinycore4.7.7_apache2_php.qcow2 -enable-kvm -netdev tap,id=net0,ifname=tap0,script=no,downscript=no -device e1000-82545em,netdev=net0,id=net0,mac=52:54:00:c9:18:27 &
sudo cgexec -g cpuset:VMGroup qemu-system-x86_64 -smp 1 -m 1024 tinycore4.7.7_apache2_php_2.qcow2 -enable-kvm -netdev tap,id=net0,ifname=tap1,script=no,downscript=no -device e1000-82545em,netdev=net0,id=net0,mac=52:54:00:c9:18:28 &
