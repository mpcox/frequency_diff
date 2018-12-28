# frequency_diff

The R code presented here calculates the probability that an observed allelic frequency differs from another given value.  These probabilities were used in:

Ricaut F-X, T Thomas, M Mormina, MP Cox, M Bellati, R Foley and MM Lahr. 2010. [Ancient Solomon Islands mtDNA: Assessing Holocene settlement and the impact of European contact](https://doi.org/10.1016/j.jas.2009.12.014). *Journal of Archaeological Science* 37: 1161-1170.

Ricaut FX, MP Cox, M Lacan, C Keyser, F Duranthon, B Ludes, J Guilaine and E Crubézy. 2012. [A time series of prehistoric mitochondrial DNA reveals western European genetic diversity was largely established by the Bronze age](https://doi.org/10.4236/aa.2012.21002). *Advances in Anthropology* 2: 14-23.







The [*gst_prime* function](gst_prime.R) is written in base R, and requires vaues for the number of subpopulations *k*, the average subpopulation heterozygosity *H<sub>S</sub>* and the total population heterozygosity *H<sub>T</sub>*.  Usage is:

gst_prime(*k*, *H<sub>S</sub>*, *H<sub>T</sub>*)

Example: a study population containing 14 subpopulations with average subpopulation heterozygosity of 0.953 and total population heterozygosity of 0.981 would return:

```
gst_prime(14, 0.953, 0.981)
0.6518016
```
