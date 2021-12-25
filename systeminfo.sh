# vars
    
    systemname=$(uname)
    kernelversion=$(uname -v)
    hostname=$(uname -n)
    cpufamily=$(sudo dmidecode -t processor | grep -e 'Manufacture' -e 'Family:')
    cpumodel=$(sudo dmidecode -t processor | grep 'Version:')
    architecture=$(hostnamectl | grep 'Architecture:')
    cpucores=$(sudo dmidecode -t processor | grep 'Core Count')
    cputhreads=$(sudo dmidecode -t processor | grep 'Thread Count')
    manufacturer=$(sudo dmidecode -t system | grep Manufacturer)
    productname=$(sudo dmidecode -t system | grep Product Name)
    ramsize=$(grep MemTotal /proc/meminfo)
    disksize=$(df -h | grep /dev/mmcblk0p2)
    os=$(hostnamectl | grep 'Operating System:')
    



# output

    echo System Name: $uname
    echo
    echo $os
    echo
    echo Kernel: $kernelversion
    echo
    echo Host Name: $hostname
    echo
    echo CPU Family: $cpufamily
    echo
    echo CPU Model: $cpumodel
    echo
    echo $architecture
    echo
    echo CPU Core Count: $cpucores
    echo
    echo CPU Thread Count: $cputhreads
    echo
    echo Manufacturer : $manufacturer
    echo
    echo Product Name : $productname
    echo
    echo Ram Size: $ramsize
    echo
    echo Disk Size: $disksize
    echo

