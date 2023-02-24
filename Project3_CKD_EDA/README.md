## Chronic Kidney Disease Prevalence and Awareness EDA

<img src="./CKD.png" 
 width="600" height="400" border="10" />

### Objective:

Data shows that Chronic Kidney Disease (CKD) is on the rise and affects 1 out 3 adults with diabetes and 1 out of 5 adults with high blood pressure (Chronic Kidney Disease (CKD) Surveillance System, n.d.-b). But CKD doesn’t seem to have the same kind of wide-spread attention as diabetes and high blood pressure. With the progression of CKD comes worsening health problems that go beyond those of just diabetes and heart disease. The CDC claims that heart disease is the leading cause of death for people aged 45 and older (Heart Disease | cdc.gov, 2022). Therefore, the Chronic Kidney Disease Prevalence and Awareness EDA project atttempts to answer the following:

* Should Chronic Kidney Disease (CKD) be considered a major leading caus of death considering the population increase in diabetes and hypertension which themselves are the 2 leading contributors to CKD.
* What are the prevalence and awareness levels of CKD in the general population?
* What is the reason, if any, for the disparity between the prevalence level and awareness level?

### Results:

The project is an analysis of several datasets to include data files from the CDC Surveillance System, (Chronic Kidney Disease (CKD) Surveillance System, n.d.-b), datasets from the CDC Stats by States, (NCHS Pressroom - Stats of the States, n.d.), CDC National Health Center Statistics (NHANES - About the National Health and Nutrition Examination Survey, n.d.), Comorbidity in Chronic Kidney Disease (MacRae et al., 2020), and Trends in Referral Patterns to Nephrologists (Ghimire et al., 2022).  The project consists of an analysis of the prevalence and awareness levels predominately using the data from the NHANES dataset.  The Diabetes prevalences show an increase of 2.5% from 2009 - 2020. Whereas Hypertension rates have increased by 3.7 percent during the same timeframe. As for CKD, using the All-Stages values, there has been an increase of 12% from 2009 – 2020. For Stage 4 (eGFR 15-29) there has been an increase of 12% from 2009 – 2020 by itself. There a 5 stages of CKD, with Stage 5 indicating the need for dialysis or a kidney transplant.
Awareness levels for CKD with Diabetes and Hypertension comorbidities have increased on average by 10%. Even though the prevalence of CKD increases, the awareness rates are still below 28% for those with Diabetes and Hypertension comorbidities. Considering these two diseases are the greatest risk factors for CKD and their prevalence is increasing, this should increase the prevalence of CKD.

CKD, Diabetes, and Hypertension are still increasing yet the awareness levels remain less than 30%. It was difficult finding substantial datasets or studies to account for the disparities between the prevalence and awareness levels. Although there are several sources for CKD information to include the CDC, National Institute of Diabetes and Digestive Diseases, and the National Kidney Foundation, these sites did not provide any data or studies referencing the reasons for the low awareness levels. In fact, the sites acknowledge the low levels and do provide educational material. A Canadian study identified trends of primary care referrals to nephrologists for CKD patients and found the referral rates did increase (Ghimire et al., 2022). Yet the referral rates were still considered below recommended rates. Questions for further investigation:

* Are high risk patients being referred to nephrologists?
* Is the cost of specialized healthcare too expensive?
* Is the medical community not taking an aggressive role in CKD management?


### Technical Specifications:

The program is written in Python 3.8 and uses the Pandas libraries for the Data Cleaning and Exploration.  The program uses Matplotlib, Plotly, and Seaborn to produce the graphs and plots. A Jupyter Notebook contains the code with the output. 


### Files:

This repo contains 12 files.  CKD_EDA_notebook is the notebook with the code.  CKD_EDA_Report is a formal paper presenting the problem, the methods, the analysis, and the results of the EDA project.  The CKD_EDA_Briefing is a PDF version of the Power Point briefing of the report. There are 8 data sets for this and ech is listed below.

* [CKD_EDA_Briefing - in PDF format](./CKD_EDA_Briefing.pdf)
* [CKD_EDA_Report - in PDF format](./CKD_EDA_Report.pdf)
* [CKD_EDA_notebook - Jupyter Notebook](./CKD_EDA_notebook.ipynb)
* [CKD_EDA_notebook - Notebook in a PDF format](./CKD_EDA_notebook.pdf)

#### Datasets

* [ckd_deaths - CKD Deaths By State](./ckd_deaths.csv)
* [ckd_prev - CKD Prevalence By eGFR Stage](./ckd_prev.xlsx)
* [ckd_rates - CKD Awareness Levels](./ckd_rates.xlsx)
* [dd_aware - Diabetes and Hypertension Awareness Levels](./dd_aware.xlsx)
* [DD_data_table - Diabetes Death Rates by State](./DD_data_table.csv)
* [HD_death_rates_states - Heart Disease Death Rates by State](./HD_death_rates_states.csv)
* [nhanes_chars - NHANES Characteristics dataset](./nhanes_chars.xlsx)
* [state_data - CKD Death Rates by State By County](./state_data.xlsx)


### References:

* Chronic Kidney Disease (CKD) Surveillance System. (n.d.-b). https://nccd.cdc.gov/ckd/default.aspx
* Heart Disease | cdc.gov. (2022, September 1). Centers for Disease Control and Prevention. https://www.cdc.gov/heartdisease/index.htm
* NCHS Pressroom - Stats of the States. (n.d.). https://www.cdc.gov/nchs/pressroom/stats_of_the_states.htm
* NHANES - About the National Health and Nutrition Examination Survey. (n.d.). https://www.cdc.gov/nchs/nhanes/about_nhanes.htm
* MacRae, C., Mercer, S. W., Guthrie, B., & Henderson, D. (2020). Comorbidity in chronic kidney disease: a large cross-sectional study of prevalence in Scottish primary care. British Journal of General Practice, 71(704), e243–e249. https://doi.org/10.3399/bjgp20x714125
* Ghimire, A., Ye, F., Hemmelgarn, B., Zaidi, D., Jindal, K. K., Tonelli, M. A., Cooper, M., James, M. T., Khan, M., Tinwala, M. M., Sultana, N., Ronksley, P. E., Muneer, S., Klarenbach, S., Okpechi, I. G., & Bello, A. K. (2022). Trends in nephrology referral patterns for patients with chronic kidney disease: Retrospective cohort study. PLOS ONE, 17(8), e0272689. https://doi.org/10.1371/journal.pone.0272689
