# carico il governor userspace
sudo modprobe cpufreq_userspace

# fisso le cpu 2 e 3 a una frequenza fissa
sudo cpufreq-set -c 2 -g userspace
sudo cpufreq-set -c 2 -f 2Ghz
sudo cpufreq-set -c 3 -g userspace
sudo cpufreq-set -c 3 -f 2Ghz

# creo il cgroup (facoltativo)
sudo cgcreate -g cpuset:/VMGroup
sudo cgset -r cpuset.cpus=0 VMGroup
sudo cgset -r cpuset.cpu_exclusive=1 VMGroup

# creo il primo tap
sudo ip tuntap add dev tap0 mode tap
sudo ip link set tap0 up promisc on
sudo brctl addif virbr0 tap0

# creo il secondo tap
sudo ip tuntap add dev tap1 mode tap
sudo ip link set tap1 up promisc on
sudo brctl addif virbr0 tap1
