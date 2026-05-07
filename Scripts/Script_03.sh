#!/bin/bash
# Script_03
# Identify the single copy BUSCOs from the top conserved buscos

# busco_aa holds .faa sequences with the names BUSCOID_GENOMEID
mkdir -p busco_aa
# busco_aa_concat holds all sequences from diferent genomes concatenated by BUSCOID
mkdir -p busco_aa_concat

for genome in $(find ../busco_wd/BUSCO -type d -name "single_copy_busco_sequences"); do
    accession=$(echo "$genome" | awk -F'/' '{print $8}')
    while read busco; do
        [[ -z "$busco" ]] && continue
        cp $genome/$busco.faa busco_aa/$busco-$accession.faa
        sed -i "s/^>.*/>${accession}/g" busco_aa/$busco-$accession.faa
    done < ../BUSCO/conserved_buscos.txt
done

while read busco; do
    [[ -z "$busco" ]] && continue
    find busco_aa/ -name "${busco}-*.faa" -exec cat {} \; >> busco_aa_concat/${busco}-all.faa
done < conserved_buscos.txt
