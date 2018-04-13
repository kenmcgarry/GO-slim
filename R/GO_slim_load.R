# GO_slim_functions.R
# 12/04/2018
library(ontologySimilarity)
library(ontologyIndex)
library(ontologyPlot)
library(GSEABase)

data(go)
data(gene_GO_terms)
data(GO_IC)

# reads in a goslim ontology (there are several) and returns a list of column names, used to annotate 
# the training matrix. Will comprise a GO term number, database type (MF,BF, CC), and short text description
getnames_goslim <- function(gslim){
  
 textfile <- get_ontology("C://R-files//GOslim//goslim_generic.obo")
 mf <- get_descendants(textfile, c("GO:0003674")) # MF terms
 bp <- get_descendants(textfile, c("GO:0008150")) # BP terms
 cc <- get_descendants(textfile, c("GO:0005575")) # CC terms
 cat("\nFound", length(mf) + length(bp) + length(cc), "terms.")  
 
 mf_prop <- vector(mode="character", length=length(mf))
 bp_prop <- vector(mode="character", length=length(bp))
 cc_prop <- vector(mode="character", length=length(cc))
 
 for (i in 1:length(mf)){
   temp <- get_term_property(ontology=textfile, property="ancestors", term=mf[i], as_names=TRUE)
   if(length(temp)==1)
     mf_prop[i] <- temp[1]
   if(length(temp)==2)
     mf_prop[i] <- temp[2]
   if(length(temp)==3)
     mf_prop[i] <- temp[3]
   if(length(temp)==4)
     mf_prop[i] <- temp[4]
 }
 
 for (i in 1:length(bp)){
   temp <- get_term_property(ontology=textfile, property="ancestors", term=bp[i], as_names=TRUE)
   if(length(temp)==1)
     bp_prop[i] <- temp[1]
   if(length(temp)==2)
     bp_prop[i] <- temp[2]
   if(length(temp)==3)
     bp_prop[i] <- temp[3]
   if(length(temp)==4)
     bp_prop[i] <- temp[4]
 }
 
 for (i in 1:length(cc)){
   temp <- get_term_property(ontology=textfile, property="ancestors", term=cc[i], as_names=TRUE)
   if(length(temp)==1)
     cc_prop[i] <- temp[1]
   if(length(temp)==2)
     cc_prop[i] <- temp[2]
   if(length(temp)==3)
     cc_prop[i] <- temp[3]
   if(length(temp)==4)
     cc_prop[i] <- temp[4]
 }
 
 mf <- paste(mf,":MF:",mf_prop,sep="")
 bp <- paste(bp,":BP:",bp_prop,sep="")
 cc <- paste(cc,":CC:",cc_prop,sep="")
 thenames <- c(mf,bp,cc)
 return(thenames) 
 
}

