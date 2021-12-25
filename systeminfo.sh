# vars
    
    systemname=$(uname)
    kernelversion=$(uname -v)
    hostname=$(uname -n)
    cpucores=$(lscpu | grep 'CPU(s)')

# output

echo System Name: $uname
echo Kernel: $kernelversion
echo Host Name: $hostname
echo CPU Core Count: $cpucores