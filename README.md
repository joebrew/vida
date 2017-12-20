# vida
VIDA VA data standardization

## Objective

Create a data dictionary which maps the column names AND coded response values from two different datasets so that they can be combined.

## Datasets 

- Gambia neonate (the `Neonate_VA` tab in `Gambia Site VA Data Dictionary_INDEPTH CRFs.xlsx`)
- Kenya (the `va data dictionary` tab in `Kenya VA DICTIONARY.xlsx`)

## Product  

This `kenya_answer` and `kenya_variable` columns in [this spreadsheet](https://docs.google.com/spreadsheets/d/1V5UnXJTeQtKVay8PDxzNjzI4d1DzwOqcn763oFfD740/edit?usp=sharing) will be filled out.

## Method  

Open the Kenya data (the `va data dictionary` tab in `Kenya VA DICTIONARY.xlsx`) and try to find the equivalent variables and answer codes. When found, fill out the `kenya_variable` and `kenya_answer_code` columns in the above linked spreadsheet. When not found, write `TRUE` in the `no_equivalent` column.

====================

(Don't read below this line)

# Old stuff

## Objective

The objective of this project is to take verbal autopsy data from 3 different countries with multiple data formats and to standardize to the 2016 WHO VA format.

## Data sources

There are 3 data sources

### Mali

From GEMS to the present, Mali has used only the 2007 WHO VA form.  This form has not been entered into any database.  Mali plans to transition to the 2016 WHO VA form before the summer, at which point data will be captured in the OpenHDS system.  Some of Mali’s VA data was coded by physicians as part of GEMS, but it will have to be entered into a database to undergo automated coding.  Because no data dictionary exists yet, I haven’t included any documents for Mali.
 
### The Gambia  
 
The Gambia site has used three forms:

1. 2008 – 2013: INDEPTH Network VA form (a custom non-WHO form)
2. 2013 – 2017: 2012 WHO VA form
3. Feb 2017: 2016 WHO form 
 
They currently have a backlog of verbal autopsies (including deaths that happened >1 year ago) that they plan to conduct with the 2016 WHO instrument.  In the attached folder you will find the instruments and data dictionaries for the first two forms they used.  The data dictionary for the 2016 form has not been developed yet.
 
### Kenya 
 
The Kenya site has used four forms:
 
1. 2002 – 2007: customized INDEPTH form.  
2. 2007 – 2009: WHO SAVVY form
3. 2009 – 2013: 2007 WHO 
4. 2013 to now, Kenya has used the 2012 WHO form.  


### KENYA MEETING
- Kenya might switch to 2016 WHO, but definitely not this year.
- Gambia is currently doing 2012 and 2016; will end 2012, but not yet.
- Mali will switch to 2016 WHO form at end of June.
- Mali: from 2012 to 2015, stopped (no data). re-started dec 1 2015 (but deaths were from may 2015)
- Mali: follow-up with Quique to get adjudication data ()
    - Build redcap form for Mali 2007
    
### QUESTIONS
- Has Kenya switched / will they switch to 2016 WHO format?
	- AR: they should be updating their form, talk to Alan Audi (cc Richard)
- Sarwar / Jahangir: have they given data to Anna?
- Did Mali indeed switch to 2016 WHO at end of June? I need example of this.
	- Write to Uma re: this
- Redcap app for Mali 2007; I've started building with ODK. Is that okay?
- Mali data entry app: 
	- Send ODK xml forms and server configuration documentation to Uma.

### Karen
- Quique suggestion: adjudicate all cases and controls, and 10% of DSS