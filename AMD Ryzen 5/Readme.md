# Website Fingerprinting on AMD Ryzen 5
## Google-Chrome Scenario:
`cd Chrome/` <br/>
The website fingerprinting is tested with six different scaling governors avaialable in our device. The default scaling governor of AMD Ryzen 5 is ondemand. The folders are named based on the scaling governors. As example, we will explain the scanario of deafult scaling governor ondemand. The explanation will be consistent with other governors as well. <br/>
- [ondemand](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/tree/main/AMD%20Ryzen%205/Chrome/ondemand)
  * [Data](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/tree/main/AMD%20Ryzen%205/Chrome/ondemand/Data): The final preprocessed data splitted among train, validation, and test.<br/>
    * [X_train_100.csv](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/AMD%20Ryzen%205/Chrome/ondemand/Data/X_train_100.csv): CPU frequency traces of 80 measurements from every 100 websites that constitutes the train dataset. Each row refers to the 1000 samples/measurement (Shape: 8000x1000). <br/>
    * [Y_train_100.csv](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/AMD%20Ryzen%205/Chrome/ondemand/Data/X_train_100.csv): Labels of the train data (Shape: 8000x100). <br/>
    * [X_val_100.csv](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/AMD%20Ryzen%205/Chrome/ondemand/Data/X_train_100.csv): CPU frequency traces of 10 measurements from every 100 websites that constitutes the validation dataset. Each row refers to the 1000 samples/measurement (Shape: 1000x1000). <br/>
    * [Y_val_100.csv](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/AMD%20Ryzen%205/Chrome/ondemand/Data/X_train_100.csv): Labels of the validation data (Shape: 1000x100). <br/>
    * [X_test_100.csv](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/AMD%20Ryzen%205/Chrome/ondemand/Data/X_train_100.csv): CPU frequency traces of  the rest 10 measurements from every 100 websites that constitutes the test dataset which will be used in online phase. Each row refers to the 1000 samples/measurement (Shape: 1000x1000). <br/>
    * [Y_test_100.csv](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/AMD%20Ryzen%205/Chrome/ondemand/Data/X_train_100.csv): Labels of the test data (Shape: 1000x100). <br/>

  * [CNN_1D.py](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/AMD%20Ryzen%205/Chrome/ondemand/CNN_1D.py): The CNN model trained during the offline phase for website fingerprinting. It takes the train and validation data as input and make the prediction. After the training complete, the model is saved as [Model1.h5](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/AMD%20Ryzen%205/Chrome/ondemand/Model1.h5).
  * [Restored_model_val.py](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/AMD%20Ryzen%205/Chrome/ondemand/Restored_model_val.py): The pretrained CNN model which is saved as `Model1.h5`, is loaded to make a prediction on the validation dataset. 
  * [Restored_model_test.py](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/AMD%20Ryzen%205/Chrome/ondemand/Restored_model_test.py): The pretrained CNN model which is saved as `Model1.h5`, is loaded to make a prediction on the test dataset. This script is used to evaluate the performance of the prediction model during the online phase.
  * [knn.py](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/AMD%20Ryzen%205/Chrome/ondemand/knn.py), [rf.py](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/AMD%20Ryzen%205/Chrome/ondemand/rf.py), [svm.py](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/AMD%20Ryzen%205/Chrome/ondemand/knn.py): The performance of the prediction model is tested with other ML algorithm-based model, such as Kth nearest neighbour (KNN), Random forest (RF), and Support Vector Machine (SVM).


# Instruction to run
- Checking the current scaling governor in the victim's device:
`cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_governor` <br/>
- For offline phase, the attacker can change the scaling governor in his device to match with the victim's device and collect data which will be utilized to train the ML model. The command for changing the current scalling governor to `ondemand` mode: 
`echo "ondemand" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor`<br/>



