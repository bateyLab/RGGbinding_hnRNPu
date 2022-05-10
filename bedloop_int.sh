#!/bin/sh
for ii in $(seq 1064); do
  bedtools intersect -wa -s -u -a RandomBeds/rdm${ii}.bed -b RG4-Seq_K+PDS-Hits_hg38_filtered.bed.txt > RandomInts/rdm_int${ii}.bed
done
