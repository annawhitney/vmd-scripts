proc contactLossEverything {} {

    source ~/Documents/Research/Shakhnovich/DHFR\ Aggregation/contact_loss/init_contacts.tcl
    source ~/Documents/Research/Shakhnovich/DHFR\ Aggregation/contact_loss/track_contact_loss_staph_nuc.tcl
    source ~/Documents/Research/Shakhnovich/DHFR\ Aggregation/contact_loss/track_contact_loss_del.tcl
    source ~/Documents/Research/Shakhnovich/code/return_animatepdbs.tcl

    foreach type [list WT del] {

        for {set i 1} {$i <= 10} {incr i} {

            cd /Volumes/ExtHD/Data/staph_nuc/new/${type}_new_$i/

            foreach temp [list 0.500 0.550 0.600] {

                set mol1 [animatepdbs 0 2000 "1SNC_${type}_$temp.%d0000"]
                animate write dcd 1SNC_${type}_${temp}_$i.dcd waitfor all $mol1
                initContacts 6.0 init_contacts_${type}_$i.out
                trackContactLoss_$type 6.0 init_contacts_${type}_$i.out contact_loss_${type}_${temp}_$i.html
                mol delete $mol1
            }
        }
    }
}
