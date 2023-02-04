
### Lung Cancer EDA Project
											
											
The purpose of this study is to demonstrate several dataframe manipulation methods to include ingesting files into pandas dataframes using an API. Other dataframe transformation methods include merging two dataframe columns into a single column, converting datatypes, setting default values for NaN values, creating a pivot table, deriving new columns from existing data, and reshaping the dataframe from long to a wide format.

The code is written in Python version 3.8 and uses the Pandas libraries to manipulate the dataframes.
The program accesses the data set on the Socrata DB endpoint at the link https://chronicdata.cdc.gov/resource/u9ek-bct3.json?yearstart=2010
and retrieves data from years 2010 - 2018. The URL for the data is:

'https://chronicdata.cdc.gov/resource/u9ek-bct3.json?&$limit=5000&yearstart=2010&question=Cancer of the lung and bronchus, mortality'.

The API is provided by the CDC and is available by installing the sodapy and importing the Socrata libraries.
The API is a RESTful API and uses the requests libraries
