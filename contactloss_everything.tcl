proc contactLossEverything {} {

    source ~/Documents/Research/Shakhnovich/DHFR\ Aggregation/contact_loss/init_contacts.tcl
    source ~/Documents/Research/Shakhnovich/DHFR\ Aggregation/contact_loss/track_contact_loss_colored.tcl
    source ~/Documents/Research/Shakhnovich/code/return_animatepdbs.tcl

    foreach type [list WT W133V I155A] {

        for {set i 1} {$i <= 30} {incr i} {

            cd /Volumes/ExtHD/Data/DHFR/inter_long/${type}_$i/pdbs

            foreach temp [list 0.950 1.050] {

                set mol1 [animatepdbs 0 2000 "DHFR_${type}_inter_$temp.%d0000"]
                animate write dcd DHFR_${type}_${temp}_$i.dcd waitfor all $mol1
                initContacts 6.0 init_contacts_${type}_$i.out
                trackContactLoss 6.0 init_contacts_${type}_$i.out contact_loss_${type}_${temp}_$i.html
                mol delete $mol1
            }
        }
    }
}
