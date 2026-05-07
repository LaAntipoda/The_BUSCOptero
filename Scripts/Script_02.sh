#!/bin/bash
# Script_02
# find the metadata from the BUSCO extraction to identify all Complete BUSCOs

for file in $(find ../BUSCO -type f -name "full_table.tsv"); do
    echo $file
    grep -v "^#" ${file} | awk '$2=="Complete" {print $1}' >> ../BUSCO/all_detected_buscos.txt;
    # all_detected_buscos.txt is storing all complete busco ids
done

# From those, we extract a unique list and pick the 1000 most conserved
cat ../BUSCO/all_detected_buscos.txt | sort | uniq -c | sort | tail -n 1000 | column -t | cut -d ' ' -f 3 > ../BUSCO/conserved_buscos.txt
