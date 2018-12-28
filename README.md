# frequency_diff

The R code presented here calculates the probability that an observed allelic frequency differs from another given value.  These probabilities were used in:

Ricaut F-X, T Thomas, M Mormina, MP Cox, M Bellati, RA Foley and M Mirazón Lahr. 2010. [Ancient Solomon Islands mtDNA: Assessing Holocene settlement and the impact of European contact](https://doi.org/10.1016/j.jas.2009.12.014). *Journal of Archaeological Science* 37: 1161-1170.

Ricaut FX, MP Cox, M Lacan, C Keyser, F Duranthon, B Ludes, J Guilaine and E Crubézy. 2012. [A time series of prehistoric mitochondrial DNA reveals western European genetic diversity was largely established by the Bronze age](https://doi.org/10.4236/aa.2012.21002). *Advances in Anthropology* 2: 14-23.

This [Monte Carlo function](frequency_diff_probabilities.R) is written in base R, and requires vaues for the number of iterations, a baseline frequency to compare against, and the frequency and sample size of an observed allele in the test population.  Random draws from the binomial are used to determine the density function of frequencies consistent with the  frequency and sample size of the observed allele.  The baseline frequency is then tested to see where it falls within this distribution.  An optional argument returns the simulated frequency density.

Usage is:

frequency_diff(*iterations*, *baseline.frequency*, *test.frequency*, *test.samplesize*, *return.sims=FALSE*)

Example: 

Consider the example of the B4a1a1 mitochondrial DNA allele.  In one region, the frequency has been reported as 0.670.  In a new sample, the observed frequency is 8/17 (= 0.471).  To test this observation with 10,000 iterations, the R function would be called as:

```
frequency_diff(10000, 0.670, 8/17, 17)
```

The function returns:

```
Confidence intervals:

95% CI
0.261 0.692 

99% CI
0.204 0.753 

99.9% CI
0.149 0.815 

Probabilities:

sims < baseline frequency
0.959 

sims ≤ baseline frequency
0.96 

sims = baseline frequency
0.000826 

sims ≥ baseline frequency
0.0408 

sims > baseline frequency
0.0399 
```

Allele B4a1a1 has an observed frequency of 0.471 with estimated 95% confidence intervals of 0.261–0.692.  Only 4.1% of simulations had a frequency greater than or equal to the reported baseline frequency of 0.670.  Therefore, the observed frequency (0.471) is lower than the reported frequency (0.670) with probability P = 0.0408.

If desired, the density of simulated frequencies can be returned using:

```
density <- frequency_diff(10000, 0.670, 8/17, 17, return.sims=TRUE)
hist(density, ylab="density", xlab="simulated frequency")
```

Note that these densities are not normally distributed and become strongly asymmetrical as observed frequencies approach the boundary conditions of 0 and 1.
