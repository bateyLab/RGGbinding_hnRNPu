#!/bin/sh
#bedtoolspath=/c/users/abby/documents/bedtoolsinstall/bedtools2
#genomefa=/mnt/c/Users/Otto/Desktop/RGG_Project/hU_CLIP_Data/PureClip/PureCLIP_WorkSpace
for ii in $(seq 1064); do
  bedtools intersect -wa -s -u -a RandomBeds/rdm${ii}.bed -b RG4-Seq_K+PDS-Hits_hg38_filtered.bed.txt > RandomInts/rdm_int${ii}.bed
done
