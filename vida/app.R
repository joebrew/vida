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

source('global.R')

# UI --------------------------------------------------------------
ui <-
  navbarPage(
    title = 'Verbal autopsy standardization tool',
    theme = shinytheme("flatly"),
    
    # tabsetPanel(
    tabPanel('Tool',
             fluidRow(
               column(4,
                      h3("Upload your data here"),
                      fileInput('file1', 'A .csv file with row 1 as the header',
                                accept=c('text/csv', 
                                         'text/comma-separated-values,text/plain', 
                                         '.csv')),
                      
                      radioButtons('sep', 'Separator',
                                   c(Comma=',',
                                     Semicolon=';',
                                     Tab='\t'),
                                   ','),
                      checkboxInput('header', 'Header', TRUE),
                      helpText('Note that header-less data is not recommended, as it will have to employ fuzzy matching of values only.'),
                      h3('Choose your translation strategy'),
                      radioButtons('strategy', 'Translation strategy',
                                   choices = c(Fuzzy='fuzzy',
                                     Direct='direct'),
                                   selected = 'direct'),
                      selectInput('source_standard', 'Source standard',
                                  choices = c('WHO 2016',
                                              'WHO 2012',
                                              'WHO 2007'),
                                  selected = 'WHO 2012'),
                      selectInput('destination_standard', 'Destination standard',
                                  choices = c('WHO 2016',
                                              'WHO 2012',
                                              'WHO 2007',
                                              'Human-speak'),
                                  selected = 'WHO 2016'),
                      tags$hr(),
                      sliderInput('fuzzy_acceptable',
                                  'What is your fuzziness threshold?',
                                  min=1,
                                  max=100,
                                  step=1,
                                  value = 30),
                      br(), br(),
                      
                      br(), br(),
                      downloadButton('download_pdf_from_rmd',
                                     'Download PDF from Rmd'),
                      br(), br()
                      
               ),
               
               column(8,
                      
                      h2(downloadLink('download_csv', 'Download translated data')),
                      h3('Input data preview'),
                      dataTableOutput('table_1'),
                      # leafletOutput("interactive_map"),
                      # includeMarkdown("includes/include.md"),
                      # plotOutput('user_plot'),
                      h3('Output data preview'),
                      dataTableOutput('table_2')
                      # dataTableOutput('user_table'),
                      # dataTableOutput("point_table")
                      
               ))),#,
    tabPanel('About',
             p('Some text'))
    #          includeMarkdown('includes/about.md'))
    )


# SERVER ----------------------------------------------------------
server <-
  
  function(input, output){
    
    input_data <- reactive({
      inFile <- input$file1
      
      if (is.null(inFile))
        return(NULL)
      
      read_csv(inFile$datapath)
    })
    
    output_data <- reactive({
      gambia_translated
      # inFile <- input$file1
      # 
      # if (is.null(inFile))
      #   return(NULL)
      # 
      # gambia_translated
    })
    
    output$download_csv <- downloadHandler(
      filename = paste('data-', Sys.Date(), '.csv', sep=''),
      content = function(file) {
        x <- output_data()
        write_csv(x, file)
      }
    )
    
    output$table_1 <- renderDataTable({
      head(input_data())
    })
    
    output$table_2 <- renderDataTable({
      head(gambia_translated)
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


# Run the app
shinyApp(ui = ui, server = server)