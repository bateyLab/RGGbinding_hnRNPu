#Lad libraries
library(pqsfinder)
library(Biostrings)
library(ggplot2)
library(tidyr)


#read fasta file into R as DNAStringSet
dna <- readDNAStringSet("hU_Final323Peaks_25slop.fasta", format = "fasta")
#check that you imported the correct number of sequences
length(dna)

winners <- vector()
numWinners <- 0

for(ii in 1:length(dna)) {
  pqs <- pqsfinder(dna[[ii]], strand = '+', min_score = 25)
  dss <- as(pqs, "DNAStringSet")
  if (length(pqs@elementMetadata@listData[["score"]]) > 0) {
    numWinners <- numWinners +1
    winners[numWinners] <- ii
  }
}

# empty vector for null distribution
numRandomWinnersVec <- vector()
# Number of permutations
perm <- 1064

# Score random regions
for(jj in 1:perm) {
  randomWinners <- vector()
  numRandomWinners <- 0
  filemame <-paste("RandomFasta/rdm", jj, ".fa", sep = "")
  rand <- readDNAStringSet(filemame, format = "fasta")
  for(ii in 1:length(rand)) {
    pqs <- pqsfinder(rand[[ii]], strand = '+', min_score = 25)
    dss <- as(pqs, "DNAStringSet")
    if (length(pqs@elementMetadata@listData[["score"]]) > 0) {
      numRandomWinners <- numRandomWinners +1
      randomWinners[numRandomWinners] <- ii
    }
  }
  numRandomWinnersVec[jj] <- numRandomWinners
}

# check for normality
shapiro.test(numRandomWinnersVec)
# calculate p-value
(sum(numRandomWinnersVec > numWinners)+1)/perm

#plot results
ggplot(as.data.frame(numRandomWinnersVec)) +
  geom_histogram(aes(x = numRandomWinnersVec, y = ..density..), color = "#67a9cf", fill = "#d1e5f0")+
  #geom_function(fun = dnorm, args = list(mean = mean(numRandomWinnersVec), sd = sd(numRandomWinnersVec)), color = "#2166ac")+
  geom_vline(xintercept = numWinners, color = "#b2182b", size = 1.3)+
  theme_classic()#+


print("Number of predicted GQ's: " )
print(numWinners)
print("Predicted GQ rows:")
print(winners)
print("Distribution of random GQ's: " )
print(numRandomWinnersVec)

