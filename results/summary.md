## Mar 22

output
should be d1 b8 00 00 00 xx at address 
all elem in this page should be (xx b8/9 00 00 00 00 00) 512elem
at address 0x688 (d1 c6 01 00 00 00 0)
Conclusion read can  be incorrect

```
[LOG]:Pmem-paged: mapped 159a3000 to 0x90005c000
ERROR TestBody:iteration 6162, Integrity check failed! slot-val=116433 expected=47313 or 0
now dump page starting at 0x90005c000
HEXDUMP----------------------------------------------
0x0:    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x10:   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x20:   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x30:   06 c8 05 00 00 00 00 00 00 00 00 00 00 00 00 00
0x40:   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x50:   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x60:   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x70:   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x80:   00 00 00 00 00 00 00 00 11 c8 05 00 00 00 00 00

```

kmeans-nvme-128-1024-100000-v3.log
with hexdump info

integrity error: kmeans-nvme-128-1024-100000-v2.log
the last faulted address 0x900027060 is not asserted before, but was orignally zeroed. 
need to dump the whole page


## Mar 21
654 us second for each fault

summary: if you output to a file: it's okay. but not if directly running

ok: more detailed info: kmeans-nvme-128-1024-100000it.log

err: results/kmeans-nvme-128-1024.log
    ```
    ERROR TestBody:iteration 2957, Integrity check failed! slot-val=296241 expected=21297 or 0
    ```
ok: results/kmeans-nvme-1-2.log
ok: results/kmeans-nvme-1-4.log
ok: results/kmeans-nvme-128-1024.log wt 10000 iter
## Mar 8
0. NUM_POINTS 500000 150M,
	origin: 2.8s
1. mount nvme as swap, ram 512M, 8G NVME
    NUM_POINTS 1000000(30Mheap)
	```
	map avg user time: 0.552    (0.551, 0.552)
	map avg thread time: 0.552    (0.551, 0.552)
	map phase : 0.554
	reduce avg user time: 0.000    (0.000, 0.000)
	reduce avg thread time: 0.000    (0.000, 0.000)
	reduce phase : 0.001
	merge phase : 0.000
	run time : 0.555
	library : 70.017
	inter library : 0.001
	KMeans: MapReduce Completed
	```
	copager 
	```
	map avg user time: 0.548    (0.548, 0.549)
	map avg thread time: 0.548    (0.548, 0.549)
	map phase : 0.549
	reduce avg user time: 0.000    (0.000, 0.000)
	reduce avg thread time: 0.000    (0.000, 0.000)
	reduce phase : 0.001
	merge phase : 0.000
	run time : 0.551
	library : 85.856
	inter library : 0.001
	KMeans: MapReduce Completed
	```
