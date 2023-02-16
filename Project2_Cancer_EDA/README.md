
## Project2 Lung Cancer and Cancer Deaths EDA Project

<img src="./Cancer.jpeg" 
 width="240" height="200" border="10" />

### Objective:
																			
The purpose of this projects is to demonstrate several dataframe manipulation methods to include ingesting files into pandas dataframes using an API and reading data from a Sqlite Database. Other dataframe transformation methods include merging two dataframe columns into a single column, converting datatypes, setting default values for NaN values, creating a pivot table, deriving new columns from existing data, reshaping the dataframe from long to a wide format, and combining tables and dataframes.

The project consists of 3 seperate Jupyter Notebooks each with different purposes. The Lung_Cancer_EDA_notebook file demonstrates connecting to a data source using an API and reading the data into dataframe.  The dataframe under goes data cleaning, imputing missing values, and reshaping the dataframe to create new columns.  The Lung_Cancer_EDA_DB_notebook expands upon the methods exercised in the previous notebook to add accessing data through  sql cursors to a Sqlite Database.  In this notebook, 3 different sqlite database tables are merged into 1 table and read into a dataframe.  The dataframe is later split into 3 different dataframes.  Lastly, the notebook demonstrates the creation of scatterplots, histograms, line plot, and bar plots. 

The Cancer_EDA_notebook is a demonstration of conducting data cleaning and wrangling and reshaping the dataframe to aggregate columns to compute the means.  Additionally, this notebook has code that creates histograms to compare and contrast data for each State.  Lastly, the notebooks contains code for computing the Zscores for Expected Deaths, Observed Deaths, and Potentially Excess Deaths.

### Technical Specifications:

The code is written in Python version 3.8, Jupyter notebooks, and uses the Pandas libraries to manipulate the dataframes. The Lung_Cancer_EDA uses an API for data retrieval. An attempt was made to access the CDC DB using the Socrata API and the soapy wrapper provided on the CDC website , https://data.cdc.gov/stories/s/Overview-of-Enablement-Resources/kzjj-25rr/.  There was an error so the actual call to the endpoint uses the Requests library. The the URL for the endpoint is: 
'https://chronicdata.cdc.gov/resource/u9ek-bct3.json?&$limit=5000&yearstart=2010&question=Cancer of the lung and bronchus, mortality'.

The data for all 3 notebooks came from (State Cancer Profiles > Death Rates Table, n.d.). 

### Files:

There are 2 notebooks for this project. 

* [Lung_Cancer_EDA_notebook](./Lung_Cancer_EDA_notebook.ipynb) 
* [Lung_Cancer_EDA_notebook in PDF format](./Lung_Cancer_EDA_notebook.pdf)
* [Lung_Cancer_EDA_DB_notebook](./Lung_Cancer_EDA_DB_notebook.ipynb)
* [Lung_Cancer_EDA_DB_notebook in PDF format](./Lung_Cancer_EDA_DB_notebook.pdf)
* [Cancer_Deaths_EDA_notebook](./Cancer_Deaths_EDA_notebook.ipynb)
* [Cancer_Deaths_EDA_notebook in PDF format](./Cancer_Deaths_EDA_notebook.pdf)

### References:

State Cancer Profiles > Death Rates Table. (n.d.). https://statecancerprofiles.cancer.gov/deathrates/index.php?stateFIPS=00

