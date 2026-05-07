# The_BUSCOptero

From the genome to the tree, an easy going approach to use BUSCO sequences for phylogenetic inference.

### Software requirements

  - MAFFT 7 https://mafft.cbrc.jp/alignment/software/source.html
  - IQTree2 https://iqtree.github.io/doc/Quickstart
  - BUSCO https://busco.ezlab.org
  - Bash
    
### Scripts description

1. Script_01 - Search BUSCO sequences in the downloaded genomes
2. Script_02 - Search more conserved BUSCOs in the dataset.
3. Script_03 - Extract the single-copy BUSCOs from the most conserved
4. Script_04 - Concatenate files with the same BUSCO ID
5. Script_05 - Align each BUSCO ID
6. Script_06 - Concatenate all the alignments
7. Script_07 - Call IQTree on the cluster

### Optional
8. Script_08 - Plot BUSCO results

### Expected output

### Results
```
├── BDD
│   └── genomes
│       └── */*.fasta
├── Concatenated
│   ├── duplicated
│   |   └── *_duplicated.fasta
│   ├── *_concatenated.fasta
│   └── *_unique.fasta
├── alignments
│   ├── *_align.fasta
├── iqtree
│   ├── *_tree.contree
```
### Additional info

Due the amount of information, this proyect was executed in a cluster. In this case the KewHPC:

  - CentOs 7.7
  - 576 cores
  - 7.6TB RAM

We will request 200G of memory and 144h of computer time. This is an overkill, but ModelFinder can really consume rosurces and take an infinite +1 time to finish.
