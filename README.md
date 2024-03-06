# eSports Round winner prediction disciminant analysis logistic regression

## Overview:
This project was part of an machine learning introduction course during my Bachelor's degree, where I tried to predict the outcome of rounds in the game Counter-Strike: Global Offensive comparing the ML-algorithms discriminant analysis against logistic regression.

## Technologies used:
- **Data preprocessing:** Python (NumPy, Pandas, scikit-learn, Matplotlib & Seaborn)
- **Machine Learning analysis**:  R (MASS, tidyverse, dplyr, pROC)
- **Paper writing:** LaTeX


## Lessons learned:
- Math behind ML-Algorithms 
- Data wrangling using Python ML-Libraries
- Application of ML-Algorithms as well as comparing them against each other using an confuction matrix & accuracy
- How to write a scientific paper using LaTeX

## Dataset:
For this study, I used a dataset, which was published by Skybox Esports Techonologies (https://skybox.gg/). This company uses Artificial Intelligence to collect data during matches in CSGO to provide insights and performance analysis for teams and fans. The dataset presents a collection of 700 demos (recorded games) of competitive matches in tournaments in 2019 and 2020. As mentioned before, one match in CSGO contains 16 to 30 rounds, with each round having a maximum duration of 1 minute and 55 seconds. 

The dataset has been cleaned before being published. The Skybox team has filtered unnecessarily data from warm-up rounds and restart rounds. The Skybox Esports Technologies Team has collected snapshots of data from the 700 demos each 20 seconds until the end of an round. This gives us a number of snapshots (observations) of 122411. All snapshots are i.i.d in the sense that they each describe the state of a round and can therefore be treated individually. Although multiple snapshots can be taken from the same round. Every snapshot from the original dataset consists 97 variables.
