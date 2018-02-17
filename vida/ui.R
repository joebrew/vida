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


navbarPage(
  title = 'Verbal autopsy standardization tool',
  theme = shinytheme("united"),
  
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
                                selected = 'Human-speak'),
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
                    
             ))),#,
  tabPanel('About',
           h2('Vida'),
           p('Some text'))
  #          includeMarkdown('includes/about.md'))
)
