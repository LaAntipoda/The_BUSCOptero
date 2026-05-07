#!/bin/bash
# Here we are subbmiting the job to a cluster with SLURM

#SBATCH --job-name=iq3_genome
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=200G
#SBATCH --time=144:00:00
#SBATCH --output=iq3_genome_%A_%a.log
#SBATCH --mail-user=your_mail.org
#SBATCH --mail-type=END,FAIL
#SBATCH --partition=long

# 
/bin/bash Script_01.sh
/bin/bash Script_02.sh
/bin/bash Script_03.sh
/bin/bash Script_04.sh
/bin/bash Script_05.sh

#calling IQTree to run the actual tree inference
./iqtree2 -s  ../busco_concatenated -p ../busco_concatenated.nex -m MFP+MERGE -T 32 -B 1000 -pre busco_tree
