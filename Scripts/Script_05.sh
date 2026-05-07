#!/bin/bash
#Script_05.sh
# concatenate all alignments

iqtree2 -p ../BUSCO/busco_aligned_dedup --out-aln ../BUSCO/busco_concatenated -nt AUTO
