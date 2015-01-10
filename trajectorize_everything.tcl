proc trajectorizeEverything {} {

    foreach type [list WT W133V I155A] {

        for {set i 1} {$i <= 30} {incr i} {

            cd /Volumes/ExtHD/Data/DHFR_refold_intermediate/${type}_$i/pdbs

            foreach temp [list 0.800 1.000 1.100 1.200] {

                set mol1 [animatepdbs 0 1000 "DHFR_${type}_refold_${temp}.%d0000"]
                animate write dcd 4DFR_${type}_${temp}_$i.dcd waitfor all $mol1

                mol delete $mol1
            }
        }
    }
}
