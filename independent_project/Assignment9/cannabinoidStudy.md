## Updated Analyses of *Cannabis* in Legal Markets: Federally Produced Data 
### Biological Question
The central question of this study asks: if current federally produced *Cannabis* data, utilized by the large majority of scientific studies, continues to contain data that does not reflect the current legal markets. 

### Context (intro)
With the legalization of medicinal and recreational *Cannabis* in various states across the US, one study sought to examine the cannabinoid content of plants readily available for purchase by adults in these states and to compare this data to federally produced data. 

Previous analyses performed showed that this analyses is expected to show that the National Institute of Drug Abuse (NIDA) does not reflect current cannabinoid content of products sold and consumed in states with legal *Cannabis*. 

Currently, cannabinoid tests performed for Colorado dispensaries do not provide cannabinoid content for cannabinoids testing >1% or those generally considered to be insignificant (e.g. cannabinoids without known medicinal or psychoactive properties). 

### Methods
 **Source of data:**

Original publication:

> Vergara, Daniela, L. Cinnamon Bidwell, Reggie Gaudino, Anthony Torres, Gary Du, Travis C. Ruthenburg, Kymron deCesare, Donald P. Land, Kent E. Hutchison, and Nolan C. Kane. 2017. "Compromised external validity: federally produced cannabis does not reflect legal markets." *Scientific Reports* 7 (April): 46528. [https://doi.org/10.1038/srep46528](https://www.nature.com/articles/srep46528)

Data package:
> Vergara, Daniela, L. Cinnamon Bidwell, Reggie Gaudino, Anthony Torres, Gary Du, Travis C. Ruthenburg, Kymron deCesare, Donald P. Land, Kent E. Hutchison, and Nolan C. Kane. (2017) Data from: "Compromised external validity: federally produced cannabis does not reflect legal markets." *Dryad Digital Repository*. [https://doi.org/10.5061/dryad.ms343.2](https://doi.org/10.5061/dryad.ms343.2)

Publicly available data:
> NIDA. _Marijuana Plant Material Available from the NIDA Drug Supply Program._ [https://http://www.drugabuse.gov/researchers/research-resources/nida-drug-supply-program-dsp/marijuana-plant-material-available-nida-drug-supply-program](https://http//www.drugabuse.gov/researchers/research-resources/nida-drug-supply-program-dsp/marijuana-plant-material-available-nida-drug-supply-program) (Date of access: 15/11/2015) (Year published: 2015).

**Data Production Methods**

 - *Original Data Package:* cannabinoid measurements were produced by Steep Hill Labs, Inc. during October to December of 2013 and January to September of 2014. Additionally, the data contains cannabinoid measurements produced by NIDA that were obtained from their website on November 15th, 2015. 
 - *Louisville Data:* additional cannabinoid data obtained from Louisville on April 30th, 2019, were taken from the current product list available for purchase at this location. As required by law, measurements of these cannabinoids were provided by a private entity selected by the dispensary owner prior to this analysis. 

**Data Size & Nature**

 - *Original Data Package:* the data package includes two plain text files with cannabinoid measurements from multiple varieties of *Cannbis sativa L.* available to consumers in four US cities (Denver, Oakland, Sacramento, and Seattle). These files were utilized in the original study for analyzing chemotypes (size: 276.5 kB) and for Principal Components Analysis (size: 92.59 kB).
 - *Louisville Data:* this data was created in a plain text file (size: 5 kB) with headers identical to the original data package for ease of merging. The data includes cannabinoid measurements for THC, CBD, and CBG. Additional cannabinoid content was unavailable, similar to many of the samples found in the raw data file used to analyze chemotypes found in the original data package.

*Note any special challenges from the data here*

**Original Data Analyses**
In order to analyze the cannabinoid composition information across the sites, tests that demonstrated ≥1% concentration for the specific cannabinoid under analysis were selected. Due to the absence of samples that produced <1% CBN and CBC, these two cannabinoids were excluded from the analysis.

*ANOVA*
A two-way ANOVA was then performed for each cannabinoid with location as a factor and a posterior post-hoc analysis using Tukey, except for THC-V where Bonferroni was used.  The cannabinoid range was determined using a box and whiskers plot to visualize the array, median, minimum, and maximum of each compound by location. Additionally samples producing >1% by mass for both THC and CBD were identified indicating functional copies of both THCA and CBDA-synthases, and THC:CBD ratios were calculated. The THC:CBD ratios were used to perform four F-tests comparing NIDA samples to samples from the other four locations. 

*Principle Components Analysis*
To further understand the variation between locations in their overall cannabinoid composition, Principal Components Analysis (PCA) was performed using the car package from R statistical software. For this analysis, all samples, including the ones that produced <1% cannabinoids, were used; however, both Denver and Seattle were excluded from the PCA due to the absence of CBN and CBC. The same dataset from the PCA was used to calculate k-means clustering to understand the number of partitions and their means given the data. 

*CBN Proportion Comparison*
Finally, with the three locations that contained CBN data, Sacramento, Oakland and NIDA, an ANOVA and a post-hoc analysis were performed to compare the proportion of CBN from the total cannabinoids. The original study used the R statistical framework to perform all analyses.

**Analyses Replication & Additional Analyses**
Prior to statistical analyses tests, Louisville cannabinoid data was merged with the dataset utilized for analyzing chemotypes. Due to lack of information on CBN 

*ANOVA + Louisville Dataset*




### Results and Conclusions
*This section will be completed after completion of the R code*
