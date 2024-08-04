# Revell.fitmultiMk
 
This repository contains the files for the project "Testing for heterogeneous rates of discrete character evolution on phylogenies" by Liam J. Revell, Klaus P. Schliep, D. L. Mahler, and T. Ingram.

Author for correspondence: Liam J. Revell (liam.revell@umb.edu)

Abstract: Many hypotheses in the field of phylogenetic comparative biology involve specific changes in the rate or process of trait evolution. This is particularly true of approaches designed to connect macroevolutionary pattern to microevolutionary process. We present a method designed to test whether the rate of evolution of a discrete character has changed in one or more clades, lineages, or time periods. This method differs from other related approaches (such as the 'covarion' model) in that the 'regimes' in which the rate or process is postulated to have changed are specified a priori by the user, rather than inferred from the data. Similarly, it differs from methods designed to model a correlation between two binary traits in that the regimes mapped onto the tree are fixed. We apply our method to investigate the rate of dewlap color and/or caudal vertebra number evolution in Caribbean and mainland clades of the diverse lizard genus Anolis. We find little evidence to support any difference in the evolutionary process between mainland and island evolution for either character. We also examine the statistical properties of the method more generally and show that it has acceptable type I error, parameter estimation, and power. Finally, we discuss some general issues of frequentist hypothesis testing and model adequacy, as well as the relationship of our method to existing models of heterogeneity in the rate of discrete character evolution on phylogenies.

Details on repository:

1. '\dewlap-analysis' contains data files and analysis code for the analysis of dewlap color evolution using the model. All files used are present in the folder, which also contains all R code (.Rmd) and a built R markdown file (.pdf) with figures and results. Analyses were undertaken using phytools 2.0.7 with R version 4.3.1.

2. '\hrm-analysis' contains data files and analysis code for an analysis of dewlap color evolution and caudal vertebra number evolution under the hidden-rates model of Beaulieu et al. (2013), as per reviewer request at JEB. All files used are present in the folder, which also contains all R code. Since this analysis was added in response to reviewer feedback, it was undertaken using phytools 2.3.1 and R version 4.4.1.

3. '\morph-analysis' contains data files and analysis code for the analysis of caudal vertebra number evolution using the model. All files used are present in the folder, which also contains all R code (.Rmd) and a built R markdown file (.pdf) with figures and results. Analyses were undertaken using phytools 2.0.7 with R version 4.3.1.

4. '\power-analysis' all analysis code and resultant data for the analysis of type I error and power the model. All files used are present in the folder, which also contains all R code (.Rmd) and a built R markdown file (.pdf) with figures and results. Analyses were undertaken using phytools 2.0.7 with R version 4.3.1.
