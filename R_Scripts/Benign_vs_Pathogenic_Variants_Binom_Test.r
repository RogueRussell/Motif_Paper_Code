# Given data for the counts at a given position - example here is for position 19 of ERSEI
benign_variants <- 35  # Benign count at position 19
total_benign <- 92   # Total benign count
total_variants <- 133 # Total number of variants across motif
length <- 19 #length of motif

chance_of_benign <- total_benign/total_variants #chance of a variant being benign
chance_of_position <- 1/length #chance of a variant at a given position
chance_of_benign_at_position <- chance_of_benign*chance_of_position #chance that a variant is benign and at a given position

#perform binomial test
result <- binom.test(x=benign_variants ,n=total_variants, p=chance_of_benign_at_position, alternative = c('greater'))


#correct for multiple testings of number of positions in each motif
p <- result$p.value
print(p.adjust(p, method = 'bonferroni', n=length))
