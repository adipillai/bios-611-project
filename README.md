# README

## Introduction

This is where I introduce the dataset and the project. 

## Source data

### Environmental indicator data

The environmental indicator source data used in this analysis come from the United Nations Statistics Division (UNSD) / United Nations Environment Programme (UNEP) Questionairre on Environment Statistics and were downloaded via Kaggle: https://www.kaggle.com/ruchi798/global-environmental-indicators (last updated June 5, 2021). These data span many types of environmental indicators by country, including:     

	* Air and Climate     
	* Biodiversity     
	* Energy   
	* Forest      
	* Inland Water Resources     
	* Land and Agriculture     
	* Natural Disasters     
	* Waste     


## Analysis

This analysis takes three primary forms:

  **1. Indicator data trends by country**. This analysis is carried out in the shiny app, where a user can select a country and view many types of plots displaying indicator data trends.     
  
  **2. Indicator data trends between all countries**. Various analyses are carried out that search for indicator trends among all available countries.      
  
  **3. Prediction of happiness and GDP level from environmental indicator data**. Two elastic net predictive models were generated to predict high/low happiness level and high/low GDP level from environmental indicator.     
  
More detailed descriptions about the analyses for this project were carried out, along with summaries of their results, can be found in the project report (report.pdf).

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



