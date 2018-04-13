# goslim_main.R
# Compare and contrast three different goslims ontologys for building classifiers.
#

memory.limit(1510241024*1024) # allocate RAM memory (15 GBs)
setwd("C:/R-files/GOstuff")  # now point to where the new code lives
#load("hybrid12thApril2018.RData")
#load("matrixdata.RData") # contains mmt and mcrap
source("GO_slim_functions.R")  # load in the functions required for this work. 

# FOR SOME REASON SYSTEM.FILE() HAS STOPPED WORKING - SO GIVE FILEPATH FOR ONTOLOGY THIS WAY.
###obo <- "C://R-files//GOslim//PANTHERGOslim.obo" # Dev
#obo <- "C://R-files//GOslim//goslim_plant.obo" # Developed by The Arabidopsis Information Resource
#obo <- "C://R-files//GOslim//goslim_metagenomics.obo" # Developed by Jane Lomax and InterPro
#obo <- "C://R-files//GOslim//goslim_candida.obo"  # Developed by Candida Genome Database
#obo <- "C://R-files//GOslim//goslim_generic.obo" # generic terms by GO consortium
#obo <- "C://R-files//GOslim//goslim_chembl.obo" # Chembl Drug Target developed by Mutowo and Lomax
### obo <- "C://R-files//GOslim//goslim_pir.obo" #Protein Info Resource by Darren Natale NEEDS DEBUGGING!!!

bigdata <- go_slim_annotation(c("APP","PPIG","APLP1","LRRC8A","CBR4"),obo)
