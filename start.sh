sudo qemu-system-x86_64 -m 1024 tinycore4.7.7_apache2_php.qcow2 -enable-kvm -netdev tap,id=net0,ifname=tap0,script=no,downscript=no -device e1000-82545em,netdev=net0,id=net0,mac=52:54:00:c9:18:27 

