proc contactLossRest {} {

    source ~/Documents/Research/Shakhnovich/DHFR\ Aggregation/contact_loss/init_contacts.tcl
    source ~/Documents/Research/Shakhnovich/DHFR\ Aggregation/contact_loss/track_contact_loss_colored.tcl
    source ~/Documents/Research/Shakhnovich/code/return_animatepdbs.tcl

    foreach type [list I155A] {

        for {set i 1} {$i <= 30} {incr i} {

            cd /Volumes/ExtHD/Data/DHFR_refold_intermediate/${type}_$i/pdbs

            foreach temp [list 1.100 1.200] {

                set mol1 [animatepdbs 0 1000 "DHFR_${type}_refold_$temp.%d0000"]
                animate write dcd DHFR_${type}_${temp}_$i.dcd waitfor all $mol1
                initContacts 6.0 init_contacts_${type}_$i.out
                trackContactLoss 6.0 init_contacts_${type}_$i.out contact_loss_${type}_${temp}_$i.html
                mol delete $mol1
            }
        }
    }
}
