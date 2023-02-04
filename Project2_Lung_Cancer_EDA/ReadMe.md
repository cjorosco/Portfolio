
### Lung Cancer EDA Project
											
											
The purpose of this project is to demonstrate several dataframe manipulation methods to include ingesting files into pandas dataframes using an API. Other dataframe transformation methods include merging two dataframe columns into a single column, converting datatypes, setting default values for NaN values, creating a pivot table, deriving new columns from existing data, and reshaping the dataframe from long to a wide format.

The code is written in Python version 3.8 and uses the Pandas libraries to manipulate the dataframes. Initally, an attempt was made to access the CDC DB using the Socrata API and the soapy wrapper provided on the CDC website , https://data.cdc.gov/stories/s/Overview-of-Enablement-Resources/kzjj-25rr/.  There was an error so the actual call to the endpoint uses the Requests library. The the URL for the endpoint is : 
'https://chronicdata.cdc.gov/resource/u9ek-bct3.json?&$limit=5000&yearstart=2010&question=Cancer of the lung and bronchus, mortality'.

The program is contained and exexuted within a Jupyter Notebook.  This file is Lung_Cancer_EDA_orosco.ipynb.  The file named Lung_Cancer_EDA_orosco.pdf is a copy of the notebook in PDF format.
