How to run X-Phoenix
# Basic setup

## prepare Comanche
X-Phoenix depends on [Comanche](https://github.com/IBM/comanche)

Follow basic comanche setup, see [here](https://github.com/IBM/comanche/blob/unstable/README.md) for more details.
basically, make sure:
1. xms module is loaded
2. nvme device is attached to VFIO or UIO 
    ```
     sudo ${COMANCHE_HOME}/tools/nvme_setup.sh
    ```
3. hugepages are set:
    ```
     echo 500 > /proc/sys/vm/nr_hugepages
    ```
4. get the pci address
    lspci|grep Non-Volatile


## build X-Phoenix

**IMPORTANT**:

Set comanche home and the PCI address of NVMe device
```shell
mkdir build
cd build

# modify path if needed
cmake -DCOMANCHE_PREFIX:PATH=${HOME}/comanche -DPCI_ADDR_INPUT="\"00:06.0\"" ..

```

## prepare dataset
this may take about 3~5mins
```
# go to project root
cd ../
sh scripts/get_data.sh
```

## run test
```
cd build/
sudo COMANCHE_HOME=${HOME}/comache bin/kmeans_copager_NVME
```


# Advanced
## preparations for virtual machine
1. setting vm using the [script](scripts/run_qemu.sh)(ubuntu1604, 2G ram with 4 cpus)

## swap on NVMe
Original contents from [here](https://wiki.archlinux.org/index.php/swap#Automated)
1. make swap partition
```
sudo mkswap /dev/nvme0n1
```
2. enable the device for paging
```
sudo swapon /dev/nvme0n1
```
3. check current swap
```
lifeng@node0:~$ swapon --show
NAME         TYPE      SIZE USED PRIO
/dev/sda5    partition   2G   0B   -1
/dev/nvme0n1 partition   8G   0B   -2
```
4. disable the other swap areas(if any)
```
sudo swapoff /dev/sda5
```
5. set swapiness
```shell
# you can also change this in /etc/sysctl.d/99-sysctl.conf
sysctl vm.swappiness=1
```
