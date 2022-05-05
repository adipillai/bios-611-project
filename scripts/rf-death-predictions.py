import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import sklearn


data6 =pd.read_csv("derived_data/amended_cleaned_rf.csv");

features=["total_cases", "active", "discharged"];
X=data6[features];
y = data6.deaths;

from sklearn.model_selection import train_test_split;
X_train,X_test,y_train,y_test = train_test_split(X,y);

from sklearn.metrics import mean_absolute_error;
from sklearn.ensemble import RandomForestRegressor;

my_model=RandomForestRegressor(max_leaf_nodes=5,max_depth=5,random_state=0);

my_model.fit(X_train,y_train);

preds=my_model.predict(X_train);

mae = print(mean_absolute_error(y_train, preds));

preds=my_model.predict(X_test);

mae_test = print(mean_absolute_error(y_test, preds));


expected_deaths= 4788.191661111112;

expected_deaths;

expected_deaths_usingRFR=preds.mean();

expected_deaths_usingRFR;


bar_data = {'Deaths':expected_deaths, 'Expected Deaths Predicted Using RFR':expected_deaths_usingRFR};

bar_one = list(bar_data.keys());
bar_two = list(bar_data.values());




fig = plt.figure(figsize = (10, 5));

plt.bar(bar_one, bar_two, color =['black','blue'],
        width = 0.4);
 
plt.xlabel("Comparision");
plt.ylabel("Number of expected deaths");
plt.title("Covid-19 Random Forest Death Prediction");

plt.savefig("figures/rf-death-predictions.png",dpi=400);




