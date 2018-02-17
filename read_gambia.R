library(tidyverse)
library(readxl)
gambia <- read_excel('dictionaries/Gambia/Gambia Site VA Data Dictionary_INDEPTH CRFs.xlsx', skip = 1)
make_long <- function(df){
  if(is.na(df$ValueList)){
    out <- data_frame(variable = df$Variable,
                      question = df$Question,
                      answer_code = NA,
                      answer_meaning = NA)
  } else {
    values <- strsplit(df$ValueList, ';')
    values <- unlist(values)
    codes <- values[1:length(values) %% 2 == 1]
    meanings <- values[1:length(values) %% 2 == 0]
    new_rows <- list()
    for(i in 1:length(codes)){
      new_rows[[i]] <- data_frame(variable = df$Variable,
                                  question = df$Question,
                                  answer_code = codes[i],
                                  answer_meaning = meanings[i])
    }
    out <- bind_rows(new_rows)
  }
  return(out)
}
results <- list()
for(i in 1:nrow(gambia)){
  message(i)
  results[[i]] <- make_long(gambia[i,])
}
results <- bind_rows(results)
old_names <- names(results)
names(results) <- paste0('gambia_', names(results))
results$kenya_variable <- results$kenya_answer_code <- NA

write_csv(results, '~/Desktop/dict.csv')
