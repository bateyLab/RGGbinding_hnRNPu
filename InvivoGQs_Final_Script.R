#load libraries
library(regioneR)
library(ggplot2)

#Variable for no. Permutations
perm <- 1064
#pre-allocate vector for no. intersections of random regions with hnRNPu sites
num_int <- vector()
#Load bed file of hnRNPu-GQ binding sites 
Original <- toGRanges("hU_Final323Peaks_25slop.bed")

#Loop to read in number of hnRNPu site intersections with random regions (from bedloop_int.sh)
for(jj in 1:perm) {
  filename <-paste("RandomInts/rdm_int", jj, ".bed", sep = "")
  random <- toGRanges(filename)
  num_int[jj] <- length(random)
}
#calculate P-value
(sum(num_int > length(Original))+1)/perm

#Plot histogram
ggplot(as.data.frame(num_int)) +
  geom_histogram(aes(x = num_int), color = "#4575b4", fill = "#91bfdb")+
  geom_vline(xintercept = length(Original), color = "#d73027", size = 1.3)+
  xlab("# of predicted G-Qs")+
  ylab("frequency")+
  theme_classic()
