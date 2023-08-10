#!/bin/bash

#create dictionary of real overlaps for each tissue
declare -A tissue_overlap

#number of actual overlaps
tissue_overlap["Adipose_Subcutaneous"]=2711
tissue_overlap["Adipose_Visceral_Omentum"]=1804
tissue_overlap["Adrenal_Gland"]=914
tissue_overlap["Artery_Aorta"]=1829
tissue_overlap["Artery_Coronary"]=599
tissue_overlap["Artery_Tibial"]=2793
tissue_overlap["Brain_Amygdala"]=257
tissue_overlap["Brain_Anterior_Cingulate_Cortex"]=506
tissue_overlap["Brain_Caudate_Basal_Ganglia"]=739
tissue_overlap["Brain_Cerebellar_Hemisphere"]=943
tissue_overlap["Brain_Cerebellum"]=1421
tissue_overlap["Brain_Cortex"]=801
tissue_overlap["Brain_Frontal_Cortex"]=580
tissue_overlap["Brain_Hippocampus"]=363
tissue_overlap["Brain_Hypothalamus"]=373
tissue_overlap["Brain_Nucleus_Accumbens_B_G"]=611
tissue_overlap["Brain_Putamen_Basal_Ganglia"]=488
tissue_overlap["Brain_Spinal_Cord_Cervical"]=288
tissue_overlap["Brain_Substantia_Nigra"]=186
tissue_overlap["Breast_Mammary_Tissue"]=1250
tissue_overlap["Cells_EBV-Transformed_Lymphocytes"]=482
tissue_overlap["Cells_Transformed_Fibroblasts"]=2285
tissue_overlap["Colon_Sigmoid"]=1188
tissue_overlap["Colon_Transverse"]=1451
tissue_overlap["Esophagus_Gastroesophageal_Junction"]=1249
tissue_overlap["Esophagus_Mucosa"]=2582
tissue_overlap["Esophagus_Muscularis"]=2441
tissue_overlap["Heart_Atrial_Appendage"]=1469
tissue_overlap["Heart_Left_Ventricle"]=1311
tissue_overlap["Liver"]=594
tissue_overlap["Lung"]=2509
tissue_overlap["Minor_Salivary_Gland"]=223
tissue_overlap["Muscle_Skeletal"]=2564
tissue_overlap["Nerve_Tibial"]=3279
tissue_overlap["Ovary"]=490
tissue_overlap["Pancreas"]=1328
tissue_overlap["Pituitary"]=982
tissue_overlap["Prostate"]=485
tissue_overlap["Skin_Not_Sun_Exposed_Suprapubic"]=2188
tissue_overlap["Skin_Sun_Exposed_Lower_Leg"]=3072
tissue_overlap["Small_Intestine_Terminal_Ileum"]=554
tissue_overlap["Spleen"]=893
tissue_overlap["Stomach"]=1119
tissue_overlap["Testis"]=2504
tissue_overlap["Thyroid"]=3669
tissue_overlap["Uterus"]=286
tissue_overlap["Vagina"]=306
tissue_overlap["Whole_Blood"]=1864

echo "tissue,result,pvalue" >> greater_than_equal_to_results.csv

for tissue_bed in ./gtex_beds/*.bed; do
  tissue=$(basename "$tissue_bed" .bed)
  #9,999 permutations for generation of random motifs across genome
  for run in {1..9999}
  do
    bedtools random -l 10 -n 20565 -g hg19.genome > randomERSEI.bed
    bedtools random -l 10 -n 18410 -g hg19.genome > randomERSEII.bed
    bedtools random -l 10 -n 60202 -g hg19.genome > randomATF4.bed
    bedtools random -l 8 -n 125067 -g hg19.genome > randomXBP1.bed
    cat randomERSEI.bed randomERSEII.bed randomATF4.bed randomXBP1.bed > randomall.bed
    bedtools intersect -wa -wb -a $tissue_bed -b randomall.bed > "$tissue"_Intersect.bed
    wc -l "$tissue"_Intersect.bed >> "$tissue"_Randomcount.txt
  done
  cut -d ' ' -f 1 "$tissue"_Randomcount.txt > "$tissue"_Randomcount_cleaned.txt

  ##count how many times the overlap in a random generation is more than the real overlap
  overlap_value=${tissue_overlap[$tissue]}
  count=0
  while read line; do
    if [ "$line" -ge "$overlap_value" ]; then
      count=$((count + 1))
    fi
  done < "$tissue"_Randomcount_cleaned.txt

  #calculate pvalue
  pvalue=$(bc -l <<< "scale=10; ($count + 1) / (9999 + 1)")

  #create final file
  echo "$tissue,$count,$pvalue" >> greater_than_equal_to_results.csv
done