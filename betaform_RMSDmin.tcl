proc betaFormEverything {} {

    source ~/Documents/Research/Shakhnovich/DHFR\ Aggregation/contact_loss/beta_formation.tcl

    foreach type [list WT W133V I155A] {

        for {set i 1} {$i <= 20} {incr i} {

            cd /Volumes/ExtHD/Data/DHFR/REMC_refold/${type}_$i/pdbs

            foreach temp [list 0.400 0.517 0.667 0.862 1.113 1.438 1.857] {

                mol load pdb DHFR_${type}_refold_${temp}_RMSDmin.pdb
                betaForm 1 159 6.0 beta_form_${type}_${temp}_${i}_RMSDmin.html
            }
        }
    }
}
