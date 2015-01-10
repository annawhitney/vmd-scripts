proc contactFormEverything {} {

    source ~/Documents/Research/Shakhnovich/DHFR\ Aggregation/contact_loss/contact_formation.tcl
    source ~/Documents/Research/Shakhnovich/code/return_animatepdbs.tcl

    foreach type [list WT W133V I155A] {

        cd /Volumes/ExtHD/Data/DHFR/REMC_refold/${type}/pdbs

        foreach temp [list 0.400 0.517 0.667 0.862 1.113 1.438 1.857 2.398 3.097 4.000] {

            set mol1 [animatepdbs 0 2000 "DHFR_${type}_refold_$temp.%d0000"]
            animate write dcd DHFR_${type}_${temp}.dcd waitfor all $mol1
            trackContactForm 6.0 ~/Documents/Research/Shakhnovich/DHFR\ Aggregation/contact_loss/4DFR_${type}_diff_init_contacts.out contact_form_${type}_${temp}.html
            mol delete $mol1
        }
    }
}
