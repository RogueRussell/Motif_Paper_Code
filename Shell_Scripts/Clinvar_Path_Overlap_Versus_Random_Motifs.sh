#!/bin/bash

#ClinvarOverlaps
ERSEI_overlap=34
ERSEII_overlap=31
XBP1_overlap=128
ATF4_overlap=20
ALL_overlap=213


#final result file
echo "motif,result,pvalue" >> greater_than_equal_to_results.csv

#
for run in {1..9999}
  do
    bedtools random -l 10 -n 20565 -g hg19.genome > randomERSEI.bed
    bedtools random -l 10 -n 18410 -g hg19.genome > randomERSEII.bed
    bedtools random -l 10 -n 60202 -g hg19.genome > randomATF4.bed
    bedtools random -l 8 -n 125067 -g hg19.genome > randomXBP1.bed
    bedtools intersect -wa -wb -a Clinvar.37.Path.bed -b randomERSEI.bed > Clinvar_Path_Intersect_ERSEI.bed
    bedtools intersect -wa -wb -a Clinvar.37.Path.bed -b randomERSEII.bed > Clinvar_Path_Intersect_ERSEII.bed
    bedtools intersect -wa -wb -a Clinvar.37.Path.bed -b randomATF4.bed > Clinvar_Path_Intersect_ATF4.bed
    bedtools intersect -wa -wb -a Clinvar.37.Path.bed -b randomXBP1.bed > Clinvar_Path_Intersect_XBP1.bed
    cat randomERSEI.bed randomERSEII.bed randomATF4.bed randomXBP1.bed > randomall.bed
    bedtools intersect -wa -wb -a Clinvar.37.Path.bed -b randomall.bed > Clinvar_Path_Intersect_ALL.bed
    wc -l Clinvar_Path_Intersect_ALL.bed >> Clinvar_Path_Randomcount_ALL.txt
    wc -l Clinvar_Path_Intersect_ERSEI.bed >> Clinvar_Path_Randomcount_ERSEI.txt
    wc -l Clinvar_Path_Intersect_ERSEII.bed >> Clinvar_Path_Randomcount_ERSEII.txt
    wc -l Clinvar_Path_Intersect_ATF4.bed >> Clinvar_Path_Randomcount_ATF4.txt
    wc -l Clinvar_Path_Intersect_XBP1.bed >> Clinvar_Path_Randomcount_XBP1.txt
done
  cut -d ' ' -f 1 Clinvar_Path_Randomcount_ALL.txt > Clinvar_Path_Randomcount_ALL_cleaned.txt
  cut -d ' ' -f 1 Clinvar_Path_Randomcount_ERSEI.txt > Clinvar_Path_Randomcount_ERSEI_cleaned.txt
  cut -d ' ' -f 1 Clinvar_Path_Randomcount_ERSEII.txt > Clinvar_Path_Randomcount_ERSEII_cleaned.txt
  cut -d ' ' -f 1 Clinvar_Path_Randomcount_ATF4.txt > Clinvar_Path_Randomcount_ATF4_cleaned.txt
  cut -d ' ' -f 1 Clinvar_Path_Randomcount_XBP1.txt > Clinvar_Path_Randomcount_XBP1_cleaned.txt

  ##count how many times the overlap in a random generation is more than the real overlap
  ERSEI_count=0
  while read line; do
    if [ "$line" -ge "$ERSEI_overlap" ]; then
      ERSEI_count=$((ERSEI_count + 1))
    fi
  done < Clinvar_Path_Randomcount_ERSEI_cleaned.txt

  ERSEII_count=0
  while read line; do
    if [ "$line" -ge "$ERSEII_overlap" ]; then
      ERSEII_count=$((ERSEII_count + 1))
    fi
  done < Clinvar_Path_Randomcount_ERSEII_cleaned.txt

  ATF4_count=0
  while read line; do
    if [ "$line" -ge "$ATF4_overlap" ]; then
      ATF4_count=$((ATF4_count + 1))
    fi
  done < Clinvar_Path_Randomcount_ATF4_cleaned.txt

  XBP1_count=0
  while read line; do
    if [ "$line" -ge "$XBP1_overlap" ]; then
      XBP1_count=$((XBP1_count + 1))
    fi
  done < Clinvar_Path_Randomcount_XBP1_cleaned.txt

  ALL_count=0
  while read line; do
    if [ "$line" -ge "$ALL_overlap" ]; then
      ALL_count=$((ALL_count + 1))
    fi
  done < Clinvar_Path_Randomcount_ALL_cleaned.txt

  #calculate pvalue
  ERSEI_pvalue=$(bc -l <<< "scale=10; ($ERSEI_count + 1) / (9999 + 1)")
  ERSEII_pvalue=$(bc -l <<< "scale=10; ($ERSEII_count + 1) / (9999 + 1)")
  ATF4_pvalue=$(bc -l <<< "scale=10; ($ATF4_count + 1) / (9999 + 1)")
  XBP1_pvalue=$(bc -l <<< "scale=10; ($XBP1_count + 1) / (9999 + 1)")
  ALL_pvalue=$(bc -l <<< "scale=10; ($ALL_count + 1) / (9999 + 1)")

  #create final file
  echo "ERSEI,$ERSEI_count,$ERSEI_pvalue" >> greater_than_equal_to_results.csv
  echo "ERSEII,$ERSEII_count,$ERSEII_pvalue" >> greater_than_equal_to_results.csv
  echo "ATF4,$ATF4_count,$ATF4_pvalue" >> greater_than_equal_to_results.csv
  echo "XBP1,$XBP1_count,$XBP1_pvalue" >> greater_than_equal_to_results.csv
  echo "ALL,$ALL_count,$ALL_pvalue" >> greater_than_equal_to_results.csv