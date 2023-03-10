## Recidivism Prediction 

<img src="./recid.png" 
width="1000" height="300" border="10" />

### Objective:

The objective of this project is to predict the likelihood of an individual to repeat crime otherwise known as recidivism.  In the United States, 67.8% of all convicts will reoffend within 3 years (Recidivism of Prisoners Released in 30 States in 2005: Patterns From 2005 to 2010 - Update, n.d.). The motiviation for the project is to identify a model most accurate to predict recidivism in determining parole decisions.  The models chosen for the predictions are the Random Forest Classifier, AdaBoost, and Naive Bayes models.  

### Results:

Methods of analysis include leveraging historical data, machine learning, and predictive modeling to determine the probability of a convict to reoffend. Multiple models were evaluated, and performance was measured using accuracy rates. The best performing model achieved an accuracy rate of 66%. This result is good, but the gravity of decisions made on personal freedoms and requires a higher accuracy to implement the model for use. It is recommended that further information is collected and aggregated into the current data set to increase model accuracy. 

### Technical Specifications:

The program is written in Python 3.8 and uses Jupyter Notebooks as the Interactive Development Environment. The dataset is the 3-year Recidivism for Offenders Released from Prison from the Iowa Department of Corrections.  The data variables consist of offender demographics, offenses and the previoius recidivism reporting years.  The observations are data collected from 2010-2018 and contain 26,020 unique rows.  The program uses the Pandas libraries to perform exploration and Matplotlib and Seaborn to produce the plots. The Scikit-Learn libraries are used to build and fit the models.

### Files:

The project files are listed below.  Recidivism_Predict.ipynb is the Notebook with the code and the outputs.  The Recidivism_Predict_report.pdf is a report describing the background and motivation for the project, a description of the methods and analysis, and a discussion of the results with recommendations for further study.  Recid_Predict_Briefing.pdf is a copy of the Power Point briefing slides.  Lastly the Recidivism_Predict_notebook.pdf is a copy of the Notebook in PDF format. The 3-Year_Recidivism_for_Offenders_Released_from_Prison_in_Iowa.csv file is the project dataset.

* [Recidivism_Predict - Jupyter Notebook](./Recidivism_Predict.ipynb)
* [Recidivism_Predict_report - Report in PDF format](./Recidivism_Predict_report.pdf)
* [Recidivism_Predict_notebook - Jupyter Notebook in PDF format](./Recidivism_Predict_notebook.pdf)
* [Recid_Predict_Briefing - Briefing in PDF format](./Recid_Predict_Briefing.pdf)
* [3-Year_Recidivism_for_Offenders_Released_from_Prison_in_Iowa - Dataset](./3-Year_Recidivism_for_Offenders_Released_from_Prison_in_Iowa.csv)



### References:

Recidivism of Prisoners Released in 30 States in 2005: Patterns from 2005 to 2010 - Update. (n.d.). Bureau of Justice Statistics. https://bjs.ojp.gov/library/publications/recidivism-prisoners-released-30-states-2005-patterns-2005-2010-update

