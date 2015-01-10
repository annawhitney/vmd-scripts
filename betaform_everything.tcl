# beta form everything
# runs beta_formation.tcl on all simulations specified
# outputs list of all simulations in which beta strands are formed in the specified range
# requires outfile name as argument

source ~/Documents/Research/Shakhnovich/DHFR\ Aggregation/contact_loss/beta_formation.tcl
source ~/Documents/Research/Shakhnovich/code/return_animatepdbs.tcl

set list_out [lindex $argv 0]
set outfile [open $list_out w]

foreach type [list WT] {

    for {set i 1} {$i <= 20} {incr i} {

        cd /Volumes/ExtHD/Data/DHFR/REMC_refold_2/${type}_$i/pdbs

        foreach temp [list 0.250 0.291 0.340 0.396 0.462 0.539 0.628 0.732 0.854 0.995] {

            set mol1 [animatepdbs 1 8000 "DHFR_${type}_refold_$temp.%d0000"]
            animate write dcd DHFR_${type}_${temp}_$i.dcd waitfor all $mol1
            set arraylist [betaForm 108 159 6.0 betaform_${type}_${temp}_$i.html]
            array set betainfo $arraylist

            if {$betainfo(framenum) > 0} {
                puts $outfile "${type}_$i $temp $betainfo(framenum) $betainfo(type)"
            }
            mol delete $mol1
        }
    }
}
exit
