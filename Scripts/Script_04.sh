#!/bin/bash
#Script_04.sh
#align with mafft
#aguas que esto puede matar mi compu

mkdir -p busco_aligned

while read busco; do
    echo "aligning ${busco}"
    mafft --thread 4 --localpair --maxiterate 250 busco_aa_concat/$busco-all.faa > busco_aligned/$busco-aligned.faa;
done < ../BUSCO/conserved_buscos.txt
