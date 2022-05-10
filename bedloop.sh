#!/bin/sh
for ii in $(seq 1064); do
  seedVar= $((15+${ii}))
  bedtools random -l 55 -n 323 -g human.hg38.genome -seed ${seedVar} > RandomBeds/rdm${ii}.bed
  bedtools getfasta -fi hg38.fa -fo RandomFasta/rdm${ii}.fa -bed RandomBeds/rdm${ii}.bed
done
