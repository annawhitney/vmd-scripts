#Name: 
# animatepdbs 
#Synopsis:
#  A Tcl script to load a consecutively numbered 
#  sequence of PDB files into VMD for animation purposes
#  and return the molid of the resulting molecule.
#Version:
# 1.0
#Uses VMD Version:
# 1.1
#Parameters:
#  start  - "frame number" of first PDB file in sequence
#  end    - "frame number" of last PDB file in sqeuence
#  format - a Tcl format string which describes the filename/numbering
#           used.
#
#Examples:
#  To load a sequence of PDB files named 0.pdb 1.pdb 2.pdb 3.pdb 
#  one would call this proc with:  animatepdbs 0 3 "%d.pdb"
#
#  To load a sequence of PDB files named foo0000.pdb foo0001.pdb foo0002.pdb
#  one would call this proc with:  animatepdbs 0 2 "foo%04d.pdb"
#
#Author:
# John Stone $lt;johns@ks.uiuc.edu&gt;
# modified to return molid and not crash on missing frames by Anna Whitney
#
proc animatepdbs {start end fileformat} {
  set filename [format $fileformat [expr $start]]
  incr start
  puts "Reading initial frame in PDB sequence $filename"
  set idnum [mol load pdb $filename]

  puts "Reading PDB files as an animation..."
  for {set i $start} {$i <= $end} {incr i 1} {
    set filename [format $fileformat [expr $i]]
    if {[file exists $filename] == 1} {
        animate read pdb $filename
    }
    if {[file exists $filename] == 0} {
        puts "Missing frame $filename."
    }
  }
  return $idnum
}


