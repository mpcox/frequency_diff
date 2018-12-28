# calculate probability of allelic frequency differences by resampling

frequency_diff <- function(iterations, baseline.frequency, test.frequency, test.samplesize, return.sims=FALSE){

	# globals
	rounding           <- 3
	range              <- round(seq(0, 1, by=0.001), digits=rounding)

	baseline.frequency <- round(baseline.frequency, digits=rounding)
	test.frequency     <- round(test.frequency, digits=rounding)
	
	# iterate over frequency range 0 to 1
	sims  <- vector()
	for(i in 1:length(range)){
		
		sample <- rbinom(iterations, test.samplesize, range[i]) / test.samplesize
		match  <- which(round(sample + 0.000000001, digits=rounding) == test.frequency)
		# rounding fixes IEC rounding protocol (often a problem as not implemented in Excel)
		
		if( length(match) == 0 ) { next }
		
		sims <- c(sims, rep(range[i], length(match)) )
	}

	# report values
	cat("Confidence intervals:\n\n")
	cat("95% CI\n")
	cat(quantile(sims, c(0.025,0.975)), "\n\n")

	cat("99% CI\n")
	cat(quantile(sims, c(0.005,0.995)), "\n\n")

	cat("99.9% CI\n")
	cat(quantile(sims, c(0.0005,0.9995)), "\n\n")

	cat("Probabilities:\n\n")
	cat("sims < baseline frequency\n")
	cat(signif(length(which(sims < baseline.frequency))  / length(sims), digits = rounding), "\n\n")
	
	cat("sims ≤ baseline frequency\n")
	cat(signif(length(which(sims <= baseline.frequency)) / length(sims), digits = rounding), "\n\n")
	
	cat("sims = baseline frequency\n")
	cat(signif(length(which(sims == baseline.frequency)) / length(sims), digits = rounding), "\n\n")
	
	cat("sims ≥ baseline frequency\n")
	cat(signif(length(which(sims >= baseline.frequency)) / length(sims), digits = rounding), "\n\n")
	
	cat("sims > baseline frequency\n")
	cat(signif(length(which(sims > baseline.frequency))  / length(sims), digits = rounding), "\n\n")
	
	# return sims
	if(return.sims == TRUE){
		return(sims)
	}

}

frequency_diff(100000, 0.670, 8/17, 17)

