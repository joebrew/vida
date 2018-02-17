# Libraries
library(shiny)
library(shinythemes)
library(knitr)
library(rmarkdown)
library(dplyr)
library(ggplot2)
library(sp)
library(leaflet)
library(RColorBrewer)
library(readr)


function(input, output){
  source('global.R')
  
  
  input_data <- reactive({
    inFile <- input$file1
    
    if (is.null(inFile))
      return(NULL)
    
    read_csv(inFile$datapath)
  })

  output_data <- reactive({
    inFile <- input$file1
    if (is.null(inFile)){
      return(NULL)
    } else {
      return(gambia_translated)
    }
  })
  
  
  output$download_csv <- downloadHandler(
    filename = paste('data-', Sys.Date(), '.csv', sep=''),
    content = function(file) {
      x <- output_data()
      write_csv(x, file)
    }
  )
  
  output$table_1 <- renderDataTable({
    inFile <- input$file1
    if (is.null(inFile))
      return(NULL)
    head(input_data())
  })
  
  output$table_2 <- renderDataTable({
    inFile <- input$file1
    if (is.null(inFile))
      return(NULL)
    x <- output_data()
    head(x)
    x <- data.frame(x)
    x <- x[,!grepl('na', tolower(names(x)))]
    # head(gambia_translated)
    # head(gambia_in_depth)
    head(x)
  })
  
  # # Render PDF from Rmd
  # output$download_pdf_from_rmd <- downloadHandler(
  #         filename = function() {
  #                 paste0('Report_.pdf')
  #         },
  #         content = function(file) {
  #                 src <- normalizePath('includes/report.Rmd')
  #                 owd <- setwd(tempdir())
  #                 on.exit(setwd(owd))
  #                 file.copy(src, 'report.Rmd', overwrite = TRUE)
  #                 library(rmarkdown)
  #                 out <- render('report.Rmd',pdf_document())
  #                 file.rename(out, file)
  #         }
  # )
  
}
