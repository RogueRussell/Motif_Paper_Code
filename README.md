##GENE PROXIMITY FILTERING USING BEDTOOLS#
bash script: Bedtools_Window_Gene_Proximity.sh
This bash script will determine which putative motifs of your choosing (ours is from PWMScan, details in the manuscript) are within a window (we chose 2kb) of a protein-coding gene. We performed this on build37. This will search for motifs that are within a protein coding gene, 2kb upstream of a gene, and 2kb downstream of a gene. 


##HUMAN CONSERVATION SCORES ANALYSIS#
bash script: BigWigAverageOverBed.sh
This script uses BigWigAverageOverBed which is a tool from Kent Utilities. The conservation file "hg19.100way.phastCons.bw" was obtained from UCSC. This script will obtain the average phastcons score for each motif of interest. Switching out the conservation file for phyloP "hg19.100way.phyloP100way.bw" was instead used for determining per position conservation scores. 


##ANOVA AND GRAPH CODE FOR TESTING IF AVERAGE PHYLOP SCORE AT EACH POSITION IS DIFFERENT THAN OTHER POSITIONS#
r script: PhyloP_AnovaTest_And_Graph.r
This script will take in the data that has the phylop score for each position within a motif. It will plot the phylop scores using ggplot2, then it will perform an anova test with tukeyHSD post-hoc.


##OVERLAP BETWEEN DATASET OF INTEREST AND PUTATIVE MOTIFS#
bash script: Bedtools_Intersect_Datset_and_Motifs.sh
This script will overlap a bedfile containing the dataset of interest (ie GTEx cis- eQTLs or ClinVar data) with a bed file containing your motifs of interest. 


##ENRICHMENT OF GTEX CIS- EQTLS AT SPECIFIC POSITIONS WITHIN A MOTIF#
r script: GTEX_Enrichment_Chisqare_Correction.R
This r script will test whether the observed counts of cis- eQTLs at a specific position differed significantly from the counts for all the other positions combined, assuming equal counts across all positions. A chi-squared test of goodness-of-fit was performed with subsequent Bonferroni correction. 


##OVERREPRESENTATION OF BENIGN VARIANTS, VERSUS PATHOGENIC, AT SPECIFIC POSITIONS WITHIN A MOTIF#
r script: Benign_vs_Pathogenic_Variants_Binom_Test.r
This is an r script for running binomial exact test to determine if there are proportionally more benign variants than expected at a given position of the motif. Significant level set at 0.05 with bonferroni correction applied. 


##OVERLAP BETWEEN GTEX AND RANDOMLY GENERATED MOTIFS#
bash script: GTEx_Overlap_Versus_Random_Motifs.sh
This bash script will create a set of randomaly generated regions across the genome that correspond to the number and length of our putative motifs. It will then overlap these random motifs with the cis- eQTLs for each GTEx tissue bed file. It will then count the overlaps. It will do this 9,999 times. It will then count how many times this overlap (randmon motifs with GTEx) is greater than or equal to the overlap with our putative motifs (this number is set as a variable at the top of the script). It does this for each tissue. Then it will calculate the unbiased pvalue using this calculation (#{n* >= n[real]} + 1)/(N + 1). n* being the overlaps betweeen random and GTEx and n[real] being the overlap between the tissue and our putative motifs. It then adds 1, and divide that by the number of permutations (9,999) + 1. We add 1 to avoid 0. These calculations are then added to the final file which has the tissue type, # of times the random overlap was greater than or equal to real overlap, and the p-value.


##OVERLAP BETWEEN PATHOGENIC CLINVAR AND RANDOMLY GENERATED MOTIFS#
bash script: Clinvar_Path_Overlap_Versus_Random_Motifs.sh
This bash script will create a set of randomaly generated regions across the genome that correspond to the number and length of our putative motifs. It will then overlap these random motifs with the pathogenic clinvar bed file. It will then count the overlaps for all and separate motifs. It will do this 9,999 times. It will then count how many times this overlap (randmon motifs with pathogenic clinvar) is greater than or equal to the overlap with our putative motifs (this number is set as a variables at the top of the script). Then it will calculate the unbiased pvalue using this calculation (#{n* >= n[real]} + 1)/(N + 1). n* being the overlaps betweeen random and pathogenic clinvar and n[real] being the overlap between pathogenic clinvar and our putative motifs. It then adds 1, and divide that by the number of permutations (9,999) + 1. We add 1 to avoid 0. These calculations are then added to the final file which has the motif, # of times the random overlap was greater than or equal to real overlap, and the p-value.


##CIS- EQTL ANALYSIS#
bash script: FastQTL_Analysis.sh
Cis- eQTL analysis applied on CEPH individuals. Details listed in methods section of paper. This script will perform FastQTL on samples that have expression data and genotype data. 


##CIS- eQTL EFFECT SIZE OVERLAP BETWEEN CONTROL AND TM CONDITIONS#
python script: FastQTL_Generate_SE.py
This script will generate standard errors from the FASTQTL output which is needed for next script
r script: cis-eQTL_effect_size_comparison.r
compare the effect size of significant cis- eQTLs with the same cis- eQTL in the other condition. Performs Welch Modified Two-Sample t-Test for each cis- eQTL. Checks if the CI crosses 0, counts as significant if it does not cross 0.

##FIGURES##
Figure 1: Performed in Adobe Illustrator
Figure 2: GTEx_cis_eQTL_and_Motif_Overlap_Graph.r
Figure 3: PhyloP_AnovaTest_And_Graph.r
Figure 4: Benign_vs_Pathogenic_Variants_Graph_Proportion.r
Figure 5: CisEQTL_Expression_Plot.r

##SUPPLEMENTAL FIGURES##
Supplemental Figure 1: Generated by PWMScan, details in methods section of paper
Supplemental Figure 2: GTEx_Nucleotide_Change_Stacked_Barplot.r
Supplemental Figure 3: ClinVar_Variants_in_Motif_Barplots.r
Supplemental Figure 4: ClinVar_Variants_in_Motif_Barplots.r
Supplemental Figure 5: Benign_vs_Pathogenic_Variants_Graph_Count.r
Supplemental Figure 6: Benign_vs_Pathogenic_Variants_Graph_Proportion.r
Supplemental Figure 7: Shared_and_Unique_cis-eqtl_Stacked_Barplot.r
