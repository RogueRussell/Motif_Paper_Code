bedtools window \
-w 2000 '#WINDOW DESIRED AROUND PROTEIN CODING GENE' \ 
-a '#THIS IS THE BED FILE THAT HAS ALL PROTEIN CODING GENES' PROTEIN_CODING_GENES.bed \
-b '#THIS IS THE BED FILE THAT CONTAINS THE PUTATIVE MOTIFS' PWMSCAN.bed \
> '#THIS IS THE RESULT WHICH WILL INCLUDE ALL PWMSCAN MOTIFS THAT HAVE A PROTEIN CODING GENE WITHIN A 2KB WINDOW' PWMSCAN_MOTIFS_AND_PROTEIN_CODING_GENES.bed