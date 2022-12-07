# MFRF [![](https://img.shields.io/badge/Issues-%2B-brightgreen.svg)](https://github.com/GuLinLin-JMU/MFRF/issues) [![](https://img.shields.io/badge/Release-v1.1.0-important.svg)](https://github.com/GuLinLin-JMU/MFRF/commits/master) [![](https://img.shields.io/badge/license-GPL3.0-blue.svg)](https://github.com/GuLinLin-JMU/MFRF/blob/master/LICENSE)<br>

## *[M](https://github.com/GuLinLin-JMU/MFRF/)ixed [F](https://github.com/GuLinLin-JMU/MFRF/)ast [R](https://github.com/GuLinLin-JMU/MFRF/)andom [F](https://github.com/GuLinLin-JMU/MFRF/)orest*<br>

![](https://halobi.com/wp-content/uploads/2016/08/r_logo.png "R logo")
![](https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSvCvZWbl922EJkjahQ5gmTpcvsYr3ujQBpMdyX-YG99vGWfTAmfw "linux logo")
![](https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcS3RzhXKSfXpWhWhvClckwi1Llj1j3HvjKpjvU8CQv4cje23TwS "windows logo")

## Brief introduction <br>
Genetic association studies have yielded a wealth of biological discoveries. 
What’s more, the large data sets represent an important way to move beyond 
simple genome wide association studies(GWAS) with great potential. However, 
modern data acquisition based on high-throughput technology is often facing 
the problem of missing data. Missing value imputation offers a solution to 
this problem. Here we address the central issue of missing phenotypes in 
genetic association studies(such as UK Biobank dataset). We herein propose 
a new method which can accomplish non-parametric missing value imputation 
for genetic studies and use a mixed fast random forest algorithm to fit 
the model, named MFRF. What’s more, MFRF does not need genotype dataset, 
and thus is computational fast. MFRF exhibits attractive computational 
efficiency and can cope with large data.

## Version and download <br>
* [Version 0.1.0](https://github.com/GuLinLin-JMU/MFRF/archive/master.zip) -First version released on November, 20th, 2022<br>
## User Manual <br>
* Link: [User Manual](https://github.com/GuLinLin-JMU/MFRF/blob/master/MFRF_User_Manual.pdf)
## The function details of MFRF <br>
```
Table of Contents            
│
├ MFRF                              # Efficient and accurate phenotype imputation in millions of individuals for increasing GWAS power.
│ ├ Usage                          
│ │ ├                               # MFRF(xmis, Total_maxiter = 20, maxiter = 20, num.trees = 100, mtry = floor(sqrt(ncol(xmis))),
│ │ ├                                      initialLinearEffects = 0, ErrorTolerance = 0.001, targetID = NULL, missing_size = 500, 
│ │ ├                                      seed = NULL, replace = TRUE, decreasing = TRUE, verbose = TRUE, sampsize = NULL, 
│ │ └                                      max.depth = NULL, xtrue = NA)
│ ├ Arguments
│ │ ├ xmis                          # A vector, matrix or data frame with missing values.
│ │ ├ Total_maxiter                 # Stop after how many iterations.(default = 20)
│ │ ├ maxiter                       # The maximum iteration times of mixed fast random forest.(default = 10)       
│ │ ├ num.trees                     # How many trees are grown in the mixed fast random forest.(default = 100)
│ │ ├ mtry                          # How many variables should be tried randomly at each node.
│ │ ├ initialLinearEffects          # The initial values for linear effects. (default = 0)
│ │ ├ ErrorTolerance                # The tolerance for log-likelihood.(default = 0.001)
│ │ ├ targetID                      # The columns of the target trait, and used only for cross-validation operation.(default = NULL)
│ │ ├ missing_size                  # The missing values size of settings in target trait, and used only for cross-validation operation.(default = 500)
│ │ ├ seed                          # Random seed. Default is NULL, which generates the seed from R. Set to 0 to ignore the R seed.
│ │ ├ replace                       # (boolean) If TRUE bootstrap sampling (with replacements)is performed, else subsampling (without replacements).
│ │ ├ decreasing                    # (boolean) If TRUE the columns are sorted with decreasing amount of missing values.
│ │ ├ verbose                       # (boolean) If TRUE then missForest returns error estimates, runtime and if available true error during iterations.
│ │ ├ sampsize                      # List of size(s) of sample to draw.
│ │ ├ max.depth                     # Maximal tree depth. A value of NULL or 0 (the default) corresponds to unlimited depth, 1 to tree stumps (1 split per tree).
│ │ └ xtrue                         # The complete data(a vector, matrix or data frame).
│ ├ Value                           # Return a list, the list contains:
│ │ ├ ximp	                        # The imputed data(a vector, matrix or data frame).
│ │ ├ score	                        # Score of the imputed for the target trait.
│ │ ├ value                         # Oberved phenotypic values and imputed phenotypic values of MFRF (a data frame).
│ └ └ bias                          # Bias after linear fitting of oberved phenotypic values and imputed phenotypic values of MFRF.
│ 
├ MFRF.Eval                         # The function is the correlation between these imputed phenotypes and their true hidden values.
│ ├ Usage
│ │ └                               # MFRF.Eval (ximp, xmis, xtrue)
│ ├ Arguments
│ │ ├ ximp                          # The imputed data(a vector, matrix or data frame).
│ │ ├ xmis                          # A vector, matrix or data frame with missing values.
│ │ └ xtrue                         # The complete data(a vector, matrix or data frame).
│ └ Value                           # Return the correlation coefficient between the real values and the imputed values.
│ 	                        
├ prodNA                            # The function to produce missing values in a given and data set completely at random.
│ ├ Usage                          
│ │ └                               # prodNA(x, noNA, seed)
│ ├ Arguments
│ │ ├ x                             # A vector, matrix or data frame.
│ │ ├ noNA                          # Proportion of missing values to add to x. In case x is a data frame, noNA can also be a vector of probabilities per column or a named vector (see examples).
│ │ └ seed                          # An integer seed.
│ └ Value                           # Return a vector, matrix or data frame with missing values.
│
├ sim_G                             # Simulated Genome Relationship Matrix.
│ ├ Usage                         
│ │ └                               # sim_G( N, k, fam_size) 
│ ├ Arguments  
│ │ ├ N                             # The number of individuals and must be a positive integer.
│ │ ├ k                             # Coefficient of kinship and the value ranges from 0 to 1.
│ │ └ fam_size                      # The size of the family, fam_size must be a positive integer and must divide N.
│ └ Value                           # Return Genome Relationship Matrix.
│
├ sim_pheno                         # Simulated phenotype.
│ ├ Usage                         
│ │ └                               # sim_pheno(N=N, P=P, K=G, h2=rep(0.6, P), B, E)
│ ├ Arguments  
│ │ ├ N                             # The number of individuals.
│ │ ├ P                             # The number of phenotypes.
│ │ ├ K                             # A genome relational matrix.
│ │ ├ h2                            # The heritability of each phenotype in individuals.
│ │ ├ B                             # Genetic covariance. (allow the missing).
│ │ └ E                             # Environmental or residual covariance.(allow the missing)
│ └ Value                           # Return Simulated phenotype.
│
├ imputeUnivariate                  # Fills missing values of a vector, matrix or data frame by sampling with replacement from the non-missing values. For data frames, this sampling is done within column.
│ ├ Usage                         
│ │ └                               # imputeUnivariate (xmis, v = NULL, seed = NULL)
│ ├ Arguments
│ │ ├ xmis                          # A vector, matrix or data frame with missing values.
│ │ ├ v                             # A character vector of column names to impute (only relevant if x is a data frame). The default NULL imputes all columns.
│ │ └ seed                          # An integer seed.
└ └ Value                             
```
## INPUT
### Phenotype file
The file contain a header row, which may represents the trait names. The missing values should be denoted by NA. 
Notice that only the numeric values are allowed and the characters will not be recognized. However, if a phenotype 
takes only values of 0, 1 (or only two levels), ***`MFRF`*** would consider it to be a case-control trait, 
and the predicted value could be directly interpreted as the probability of being a case. <br>
> `Pheno.txt` <br>
| Trait1 | Trait2 | Trait3 | Trait4 | Trait5 | Trait6 | <br>
| :---: | :---: |  :---: |  :---: |  :---: | :---: | <br>
| 0.214992 | 0.524991 | NA | 1 | NA | -0.285427 | <br>
| -0.974543 | -0.874542 | NA | 0 | NA | -2.333531 | <br>
| 0.105909 | 0.395909 | NA | 1 | NA | 0.046818 |<br>
| NA | NA | -0.678533 | NA | NA | NA |<br>
| 0.146318 | NA | -0.914243 | NA | -0.774443 | NA |<br>
| ... | ... | ... | ... | ... | ... |<br>
| NA | 0.145609 | NA | 0 | NA | 0.720009 |<br>

## Running build-in data <br>
```R
> library("MFRF")
> data(ukb)
> head(ukb)
   ID_23111.0.0   ID_23115.0.0   ID_30020.0.0   ID_30840.0.0   ID_30850.0.0     ID_50.0.0   ID_30660.0.0   ID_30690.0.0
1  -13.07400974   -12.47319542    0.588613265   -2.574249616    6.532921148   9.798340249   -0.765743678    0.059914511
2  -2.483186418   -1.393727485   -1.493932449   -1.648425872   -6.097557807   0.010440626   -0.534436706    0.264419892
3   3.318953906    3.761264938   -0.532976741    3.474977473   -4.591645791  -0.557710801    0.993769937   -0.688824646
4   8.660696095    8.388324362    0.746899563   -3.341995972   -4.485148772   -4.41061568   -0.640711383    2.931062553
5    13.5960061    13.10111325   -1.558483568   -3.551238007   -5.724882243  -2.582869264        NA        -1.551938619
> ukb.mis <- ukb
> MFRF.imp <- MFRF(ukb.mis, Total_maxiter = 20, maxiter = 20, num.trees = 100, mtry = floor(sqrt(ncol(ukb.mis))), 
>                  initialLinearEffects = 0, ErrorTolerance = 0.001, targetID = 7, missing_size = 500, seed = 123, 
>                  replace = TRUE, decreasing = TRUE, verbose = TRUE, sampsize = NULL, max.depth = NULL, xtrue = NA) 
```

## The R script to correct for fixed effects <br>
**Note:** Please attention that NAs are not allowed in the **pca.txt**,  and all individuals should be in the same order with phenotype file.
```bash
$ Rscript zzz.R phenotype.txt pca.txt /path/MFRF_work_path/
```

## How to access help <br>
If users have any bugs or issues or any suggestions are available, feel free to contact:<br>
:yum: **Linlin Gu:** linlin-gu@outlook.com <br>
:yum: **Prof. Ming Fang:** fangming618@126.com <br>

## Citation <br>
