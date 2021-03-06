#!/usr/bin/env python
# coding: utf-8 

import numpy as np
import pandas as pd

import os
#os.environ["CUDA_VISIBLE_DEVICES"]="-1"

from sklearn.metrics import f1_score

from sklearn.neighbors import KNeighborsClassifier
from sklearn import metrics
from sklearn.metrics import roc_auc_score
from sklearn.metrics import roc_curve

n_neighbors=5

x_train=pd.read_csv('Data/X_train_100.csv',header=None)
y_train=pd.read_csv('Data/Y_train_100.csv',header=None)
x_test=pd.read_csv('Data/X_test_100.csv',header=None)
y_test1=pd.read_csv('Data/Y_test_100.csv',header=None)

mean=x_train.mean()
std=x_train.std()
x_train=(x_train-mean)/std
x_test=(x_test-mean)/std
y_test1.columns=['y']
y_train.columns=['y']

knn = KNeighborsClassifier(n_neighbors=n_neighbors)
knn.fit(x_train, y_train['y'].values)
y_pred = knn.predict(x_test)
print("KNN:")
print(y_pred)
print(metrics.accuracy_score(y_test1['y'].values, y_pred))
print("F1-Score: ",f1_score(y_test1['y'].values,y_pred,average='macro'))
'''
result1 = metrics.classification_report(y_test1['y'].values, y_pred)
print("Classification Report: \n",result1)
'''

'''
ROC_AUC = roc_auc_score(y_test1['y'], y_pred)
print("The ROC AUC score is %.5f" % ROC_AUC )


# calculate roc curves

knn_fpr, knn_tpr, _ = roc_curve(y_test1['y'], y_pred)
'''
