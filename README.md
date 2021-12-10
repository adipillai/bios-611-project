# README

## Introduction

This short project involves the completion of exploratory data analysis on COVID-19 in India. This repository contains the source data, code, as well as the results of this analysis, all of which should be able to be accessable and viewable to anyone with the software Docker installed. 

## Source data

### COVID-19 India Statewise data

The COVID-19 India Statewise source data used in this analysis came from the Indian Government's citizen engagement platform, MyGov (https://www.mygov.in/covid-19) and the India statewise population data came from an Indian census website (https://www.indiacensus.net/). The dataset of interest was downloaded via Kaggle: https://www.kaggle.com/anandhuh/latest-covid19-india-statewise-data(last updated December 5, 2021). These data span many attributes / factors related to COVID-19 such as:

	* States/UTs - Names of Indian States and Union Territories     
	* Total Cases - Total number of confirmed cases
	* Active - Total number of active cases
	* Discharged - Total number of discharged cases   
	* Deaths - Total number of deaths
	* Active Ratio (%) - Ratio of number of active cases to total cases     
	* Discharge Ratio (%) - Ratio of number of discharged cases to total cases     
	* Death Ratio (%) - Ratio of number of deaths to total cases
	* Population - Population of State/UT


## Analysis

This analysis takes three primary forms:

  **1. COVID-19 Data by State**. This analysis is carried out in the shiny app, where a user can select a state and view geographical data trends in an interactive format.     
  
  **2. Exploratory data analysis**. Various analyses are run to investigate correlations and understand the relationship between parameters and factors       
  
  **3. Machine Learning methods**. DESCRIPTION of ML methods here...    
  
A more in-depth walk-through of the types of analyses carried out for this project, along with summaries of their results, can be found in the project report (report.pdf).

## Docker

To run the analysis, you will need to have Docker installed (https://docs.docker.com/get-docker/) as well as the ability to run Docker as your current user.
First, clone the git repo by running the following command in the terminal:
```
git clone https://github.com/adipillai/bios-611-project
```

Then, navigate to the `bios-611-project/` directory in the command line.     

**Build docker container**     

Before running anything, you will need to build the container with the following command:     
```
docker build . -t project-env
```     

**Run an Rstudio server**     

To run an Rstudio server, run the following command. Note that `password_you_choose` should be replaced with your own unique password before running.     

```
docker run -e PASSWORD=password_you_choose \
--rm \
-p 8787:8787 -p 8080:8080 \
-v $(pwd):/home/rstudio/project \
-t project-env
```     

Then, to connect to the machine on port 8787, enter localhost:8787 in your browser. Enter 'rstudio' as the username along with the unique password you created. You will need to navigate to the `project` directory by entering `setwd("~/project")` in the R console and `cd ~/project` in the Terminal.


## Makefile

All derived outputs used in the analysis of this project can be found in the Makefile.    

To utilize the Makefile to build output elements from the source data, first follow the instructions above to run an Rstudio instance. Then, follow the below instructions on how to use the Makefile.

**Make the Rshiny app**

This project contains an interactive Rshiny app that plots a variety of indicator trends for 190 different countries of interest selected via a drop-down menu. To run the Rshiny app, run the following command in your terminal:
```
PORT=8080 make shiny_app
```
Then, connect to the machine on port 8080 by entering localhost:8080 in your browser.

**Make the project report**    

The project report contains a summary of the analysis results and figures. To make the project report from the source data, run the following command in your terminal:
```
make report.pdf
```

**Make an individual file**     

To make an individual file of interest from the source data that is listed as a target in the Makefile, run the following command in your terminal, substituting `figures/paired_indicators.png` for the file of interest:     
```
make figures/paired_indicators.png
```

**Clean all derived data**

To clean all of the derived files (datasets, figures, etc.) from your repository, run the following command in your terminal:
```
make clean
```
This will permanently delete all derived data that is not the source data.



