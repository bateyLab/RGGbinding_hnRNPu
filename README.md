# RGGbinding_hnRNPu
## Bioinformatic G-quadruplex analysis of pureCLIP data of hnRNPu
   The code shown in this repository was used to analize the overlap between hnRNPu binding sites in the transcriptome and genomic G-quadruplexes

### Data sources
# Check that this is correct!
hnRNPu eCLIP data was obtained from: [ENCFF408HQB](https://www.encodeproject.org/files/ENCFF408HQB/) and [ENCFF039XQD](https://www.encodeproject.org/files/ENCFF408HQB/)
RG4 ChIP-seq data was obtained from: GSE77282
[GSE77282_KPDS_hits.bed.gz](https://ftp.ncbi.nlm.nih.gov/geo/series/GSE77nnn/GSE77282/suppl/GSE77282_KPDS_hits.bed.gz)

### File descriptions
[**bedloop.sh**](https://github.com/bateyLab/RGGbinding_hnRNPu/blob/main/bedloop.sh) - used to generate BED files of the same size as hnRNPu pureCLIP data from random regions of the transcriptome.

[**bedloop_int.sh**](https://github.com/bateyLab/RGGbinding_hnRNPu/blob/main/bedloop_int.sh) - used to measure the intersection of all random BED files with RG4 sites to provide a null distribution of the number of intersections with G4s expected if there was no correlation.

[**InvivoGQs_Final_Script.R**](https://github.com/bateyLab/RGGbinding_hnRNPu/blob/main/InvivoGQs_Final_Script.R) -used to calculate the sinificance of null distribution of no. of G4 intersection sites vs. hnRNPu overlap with G4 sites

[**pqsfinder_randomReigons_scipt.R**](https://github.com/bateyLab/RGGbinding_hnRNPu/blob/main/pqsfinder_randomReigons_scipt.R) - sequence prediction of G4 formation 
