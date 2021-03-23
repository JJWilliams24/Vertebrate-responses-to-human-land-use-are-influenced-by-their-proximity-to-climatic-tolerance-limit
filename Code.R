#Code to run the main models from Williams, J.J. & Newbold T. (2021) Vertebrate responses to human land use are influenced by their 
# proximity to climatic tolerance limits, Diversity and Distributions

#title: Vertebrate responses to human land use are influenced by their proximity to climatic tolerance limits
#author: Jessica J Williams
#date: 23/03/2021
#contact email: jessica.williams.16@ucl.ac.uk

library(StatisticalModels)

############################

#Abundance (given presence) model 

#Load in abundance data

AbData <- readRDS("Abundance_data_for_Williams_and_Newbold_Diversity_and_Distributions.rds")

#Run model 

Abmodel <- GLMER(modelData = AbData, responseVar = "LogAbund",
                 fitFamily = "gaussian", 
                 fixedStruct = "LandUse+poly(stand_dist,1)+GZ:poly(StandMaxTemp,1)+LandUse:poly(StandMinTemp,1)+LandUse:poly(StandMaxTemp,1)+LandUse:poly(StandMinPrecip,1)+LandUse:GZ+GZ:poly(StandMinPrecip,1)+LandUse:poly(StandMaxTemp,1):GZ+LandUse:poly(StandMinPrecip,1):GZ+GZ+poly(StandMaxTemp,1)+poly(StandMinTemp,1)+poly(StandMinPrecip,1)",
                 randomStruct = "(1|SS)+(1|SSBS)+(1|Best_guess_binomial)")

############################

#Probability of occurrence model 

#load in occurrence data

Occdata <- readRDS("Occurrence_data_for_Williams_and_Newbold_Diversity_and_Distributions.rds")

#Run model 

Occmodel <- GLMER(modelData = Occdata, responseVar = "JW_Occ",
                  fitFamily = "binomial", fixedStruct = "LandUse+poly(StandMaxPrecip,1)+poly(stand_dist,1)+LandUse:poly(StandMaxTemp,1):GZ+LandUse:poly(StandMinTemp,1):GZ+LandUse:poly(StandMinPrecip,1):GZ+poly(StandMaxTemp,1):GZ+LandUse:GZ+poly(StandMinTemp,1):GZ+poly(StandMinPrecip,1):GZ+LandUse:poly(StandMaxTemp,1)+LandUse:poly(StandMinTemp,1)+LandUse:poly(StandMaxPrecip,1)+LandUse:poly(StandMinPrecip,1)+GZ:poly(StandMaxPrecip,1)+LandUse:poly(stand_dist,1)+poly(StandMaxTemp,1)+GZ+poly(StandMinTemp,1)+poly(StandMinPrecip,1)",
                  randomStruct = "(1|SS)+(1|SSBS)+(1|Best_guess_binomial)")

