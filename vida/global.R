library(shiny)
library(shinythemes)
library(knitr)
library(rmarkdown)
library(dplyr)
library(ggplot2)
library(sp)
library(leaflet)
library(RColorBrewer)
library(readxl)


# Read in depth form from gambia
gambia_in_depth <- read_excel('data/Neonate Form Sample Data_Gambia Site.xlsx')

# Read the dictionary
gambia_dictionary <- read_excel('data/Gambia Site VA Data Dictionary_INDEPTH CRFs.xlsx',
                                skip = 2)

# Replace columns with dict equivalent
gambia_translated <- gambia_in_depth

# Replace values of columns
for(j in 1:ncol(gambia_translated)){
  this_column <- names(gambia_translated)[j]
  if(this_column %in% gambia_dictionary$Variable){
    if(!is.na(gambia_dictionary$ValueList[gambia_dictionary$Variable == this_column])){
      # Get dictionary
      the_dict <- 
        gambia_dictionary$ValueList[gambia_dictionary$Variable == this_column]
      # Turn into a dataframe
      x <- unlist(strsplit(the_dict, ';'))
      dict_df <- data.frame(matrix(x, ncol = 2, byrow = TRUE))
      names(dict_df) <- c('old', 'new')
      dict_df$old <- as.numeric(dict_df$old)
      # Get old values
      old <- gambia_translated %>%
        dplyr::select_(this_column)
      names(old) <- 'old'
      old$old <- as.numeric(old$old)
      # Join new values
      new <- left_join(old, dict_df)
      # Replace
      gambia_translated[,this_column] <-
        new$new
    }
  }
}

# Replace column names
for(j in 1:ncol(gambia_translated)){
  this_column <- names(gambia_translated)[j]
  if(this_column %in% gambia_dictionary$Variable){
    names(gambia_translated)[j] <-
      gambia_dictionary$Question[gambia_dictionary$Variable == this_column]
  }
}
