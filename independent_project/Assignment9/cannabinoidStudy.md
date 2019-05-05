## Updated Analyses of *Cannabis* in Legal Markets: Federally Produced Data Does Not Reflect Products Currently Consumed
### Biological Question
The central question of this study asks: if current federally produced *Cannabis* data, utilized by the large majority of scientific studies, continues to contain data that does not reflect the current legal markets. 

### Context (intro)
With the legalization of medicinal and recreational *Cannabis* in various states across the US, one study sought to examine the cannabinoid content of plants readily available for purchase by adults in these states and to compare this data to federally produced data. 

Previous analyses performed by Vergara *et. al.*, give the assumption that this analyses is expected to show the data obtained from the National Institute of Drug Abuse (NIDA) does not reflect current cannabinoid content of products sold and consumed in states with legal *Cannabis*. I intend on reinforcing this analyses using cannabinoid data obtained from a current dispensary operating in Louisville, Colorado. 


### Methods
 **Source of data:**

Original publication:

> Vergara, Daniela, L. Cinnamon Bidwell, Reggie Gaudino, Anthony Torres, Gary Du, Travis C. Ruthenburg, Kymron deCesare, Donald P. Land, Kent E. Hutchison, and Nolan C. Kane. 2017. "Compromised external validity: federally produced cannabis does not reflect legal markets." *Scientific Reports* 7 (April): 46528. [https://doi.org/10.1038/srep46528](https://www.nature.com/articles/srep46528)

Data package:
> Vergara, Daniela, L. Cinnamon Bidwell, Reggie Gaudino, Anthony Torres, Gary Du, Travis C. Ruthenburg, Kymron deCesare, Donald P. Land, Kent E. Hutchison, and Nolan C. Kane. (2017) Data from: "Compromised external validity: federally produced cannabis does not reflect legal markets." *Dryad Digital Repository*. [https://doi.org/10.5061/dryad.ms343.2](https://doi.org/10.5061/dryad.ms343.2)

Publicly available data:
> NIDA. _Marijuana Plant Material Available from the NIDA Drug Supply Program._ [https://http://www.drugabuse.gov/researchers/research-resources/nida-drug-supply-program-dsp/marijuana-plant-material-available-nida-drug-supply-program](https://http//www.drugabuse.gov/researchers/research-resources/nida-drug-supply-program-dsp/marijuana-plant-material-available-nida-drug-supply-program) (Date of access: 15/11/2015) (Year published: 2015).

Louisville Dispensary Data: 
> This data is considered internal data used solely by the dispensary that sells the specific *Cannabis* strains from which the cannabinoid measurements came. This data was gathered with the dispensary's express permission.

**Data Production Methods**

 - *Original Data Package:* cannabinoid measurements were produced by Steep Hill Labs, Inc. during October to December of 2013 and January to September of 2014. Additionally, the data contains cannabinoid measurements produced by NIDA that were obtained from their website on November 15th, 2015. 
 - *Louisville Data:* additional cannabinoid data obtained from Louisville on April 30th, 2019, were taken from the current product list available for purchase at this location. As required by law, measurements of these cannabinoids were provided by a private entity selected by the dispensary owner prior to this analysis. 

**Data Size & Nature**

 - *Original Data Package:* the data package includes two plain text files with cannabinoid measurements from multiple varieties of *Cannbis sativa L.* available to consumers in four US cities (Denver, Oakland, Sacramento, and Seattle). These files were utilized in the original study for analyzing chemotypes (size: 276.5 kB) and for Principal Components Analysis (size: 92.59 kB).
 - *Louisville Data:* this data was created in a plain text file (size: 5 kB) with headers identical to the original data package for ease of merging. The data includes cannabinoid measurements for THC, CBD, and CBG. Additional cannabinoid content was unavailable, similar to many of the samples found in the raw data file used to analyze chemotypes found in the original data package.

> *Note: some of the unexpected challenges from this replication were noticing that there was, in fact, an [R script]([https://github.com/KaneLab/Bioinformatics-Scripts/blob/master/scientific_reports_code.Rmd](https://github.com/KaneLab/Bioinformatics-Scripts/blob/master/scientific_reports_code.Rmd)) written for this study with little time to develop a sound analysis, this being due to personal issues. Complications with the data included the R script being organized poorly and little explanation as to what parts of the code went with specific results. In terms of the Louisville data: currently, cannabinoid tests performed for Colorado dispensaries do not provide cannabinoid content for cannabinoids testing >1% or those generally considered to be insignificant (e.g. cannabinoids without known medicinal or psychoactive properties). * 

**Original Data Analyses**
In order to analyze the cannabinoid composition information across the sites, tests that demonstrated ≥1% concentration for the specific cannabinoid under analysis were selected. Due to the absence of samples that produced <1% CBN and CBC, these two cannabinoids were excluded from the analysis. The original study used the R statistical framework to perform all analyses.

*ANOVA*
A one-way ANOVA was then performed for each cannabinoid with location as a factor and a posterior post-hoc analysis using Tukey. The cannabinoid range was determined using a box and whiskers plot to visualize the array, median, minimum, and maximum of each compound by location. 

**Analyses Replication**
I replicated the analyses performed in the original study with respect to the information available for the Louisville location. All analyses were performed using the statistical software, R Studio in conjunction with the R programming language. Due to lack of information on CBN, THCv, and CBC for the Louisville location, analyses of these cannabinoids were not performed. 

*Part I - Set Up*
It was necessary to convert all three plain text files to comma-separated values files to be read into R. To include the Louisville dataset in the original dataset, the chemotype data and the Louisville data were merged. 

*Part II - Mean Cannabinoids by Location* 
I analyzed the average cannabinoids for CBD, THC and CBG by location to compare the differences in the data from 

*Part III - Sample Sizes by Location*
Total sample size was determined for each location along with the total sample size for samples testing greater than 1%.

*Part IV - One-way ANOVA's & Post-hoc Analyses: Samples >1%*
Samples determined to include greater than 1% cannabinoid content for CBD, THC and CBG were used to analyze whether there were significant differences in these cannabinoids between locations. A one-way ANOVA was performed to produce a p-value and a Tukey Honestly Significant Difference test compared locations paired to each other to isolate the comparisons of greatest interest.

*Part V - Plotting Using ggplot2*
The R package ggplot2 was used to create graphical data. CBG was excluded from this piece of my analyses as it was determined to be of little significance in part IV.

### Results and Conclusions

*Part II - Mean Cannabinoids by Location* 

|                  | Louisville  | Denver | NIDA | Oakland | Sacramento | Seattle |
| ----------- | ----------- | ----------- | ----------- |----------- |----------- | ----------- |
| CBD         | 1.091%      | 0.408%      | 3.550%      | 1.356%      | 1.407%      | 0.422%      |
| THC         | 19.103%     | 14.240%     | 3.443%      | 13.841%     | 15.947%     | 19.047%     |
| CBG		  | 0.066%      | 0.516%      | 0.217%      | 0.472%      | 0.815%      | 0.591%      |

 - The psychoactive cannabinoid THC shows to have high percentages throughout the legal market locations whereas, the NIDA dataset is the lowest in this category.
 - Louisville data shows to have the median CBD content of the samples with NIDA continuing to surpass all other locations.
 - Louisville lacked strains with >1% CBG content showing CBG is less significant compared to CBD and THC. This may even reveal a trend in the cultivation methods.

*Part III - Sample Sizes by Location*
Total sample sizes for each location are as follows:
 - Louisville - 76
 - Denver - 1141
 - NIDA - 98
 - Oakland - 755
 - Sacramento - 981
 - Seattle - 103

|  *Samples >1%*                 | Louisville | Denver | NIDA | Oakland | Sacramento | Seattle |
| ----------- | ----------- | ----------- | ----------- |----------- |----------- | ----------- |
| CBD         | 11      | 42      | 56      | 110      | 101      | 4      |
| THC         | 74     | 1112     | 64      | 692     | 952     | 103     |
| CBG		  | 3      | 98      | 1      | 481      | 259      | 12      |

 - The Louisville sample size was unfortunately small compared to the sample sizes at other locations and was lacking most in the >1% CBG content. 

*Part IV - One-Way ANOVA's & Post-hoc Analyses: Samples >1%*
 1. CBD: p = <2e-16; significant
 2. THC: p = <2e-16; significant
 3. CBG: p = 0.576; insignificant

*Part V - Plotting Using ggplot2*
Results of Tukey analyses for CBD
![Results of Tukey Analyses - CBD](https://github.com/catiehen/compbio_git_repo/blob/master/independent_project/Assignment9/tukeyCBD.jpeg?raw=true)


Results of Tukey Analyses - THC
![Results of Tukey Analyses - THC](https://github.com/catiehen/compbio_git_repo/blob/master/independent_project/Assignment9/tukeyTHC.jpeg?raw=true)




The Louisville sample size was unfortunately small compared to the sample sizes at other locations. This however, continued to reinforce the original question revealing that NIDA data does not reflect the current products being sold and consumed in legal markets. 
