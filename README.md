# vida
VIDA VA data standardization

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


##################################


Thanks for the questions, and sorry it took a few days to get back to you.  I am still waiting on a response from the Kenya DSS group—it was my understanding that this data dictionary was comprehensive, but I would like for them to confirm.
 
We realized that although Mali is not currently entering their VA into a database, we actually do have a set of deaths that were entered for GEMS.  Since the instrument has not changed since that time, I am recommending that they resume data entry using the same schema.  Attached is a sample of what that will look like for the child and neonatal forms, along with the variable reference guides.  There is also a form that abstracts COD information from the medical chart, but I don’t know that you’re going to be able to use that with InterVA.  Getting data samples from The Gambia and Kenya will require a little bit of negotiation, but I’ll start working on it.
 
Finally, do you have a sense right now what fields you will be able to use in the automated coding?  Mali would prefer not to enter any data that they can’t use. 
 
Thanks for your help,

Wanted to give you an update. 
 
1)      It looks like the data dictionary that Kenya sent to me is only valid for their WHO forms; not for the forms they used before.  They sent me some additional data dictionaries for those forms, which are in .rep format, along with pdfs of the VA instrument.  Unless you’re some kind of regex pro, I think you’ll find those pretty hard to work with from a scripting point of view, but it’s what we have, unfortunately.  I’ve requested data samples, but haven’t received a response yet.

2)      Gambia sent me samples of each of their instruments.  You’ll find that each of the attached spreadsheets has three tabs, each of which is a separate form.  I have also attached the 2016 WHO VA forms; I’m not sure whether you already had these.
 
I’ll let you know when I hear something about Kenya’s data.