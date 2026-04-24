#!/bin/bash
# Script_01
# Use BUSCO software to identify orthologues in the downloades genomes
# -l is used to indicate the reference database. We are using the agaricales database in this case agaricales_odb12

# Specify the output directory
OUTDIR="../BUSCO/"
mkdir -p "$OUTDIR"

# genomes are stored in folders with particular names, so we will look for all the .fna files
for fna in ../genomes/*/*.fna; do
    genome=$(basename "$(dirname "$fna")")
    outpath="$OUTDIR/${genome}"
    busco -i $fna -l agaricales_odb12 -m genome -o $genome -c 4 --out_path $OUTDIR
done
