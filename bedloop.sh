#!/bin/sh
#bedtoolspath=/c/users/abby/documents/bedtoolsinstall/bedtools2
#genomefa=~/winhome/Documents/Crystallography_paper/CHIPdataGQ/hg19.fa
for ii in $(seq 1064); do
  seedVar= $((15+${ii}))
#  echo bedtools random -l 52 -n 10 -g $bedtoolspath/genomes/human.hg38.genome
#  bedtools random -l 52 -n 1064 -g $bedtoolspath/genomes/human.hg38.genome > /tmp/rdm.bed
  bedtools random -l 55 -n 323 -g human.hg38.genome -seed ${seedVar} > RandomBeds/rdm${ii}.bed
#  echo bedtools getfasta -fi $genomefa -fo /tmp/rdm${ii}.fa -bed /tmp/rdm.bed
  bedtools getfasta -fi hg38.fa -fo RandomFasta/rdm${ii}.fa -bed RandomBeds/rdm${ii}.bed
done
