# Website Fingerprinting on AMD Ryzen 5
## Google-Chrome Scenario:
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
- Offline phase:
  * The `CNN_1D.py` is executed to train a model using the data collected from AMD Ryzen 5. The pretrained model is saved as `Model1.h5`. 
  * To look at the accuracy on validation dataset, Run the Restored_model_val.py. It is to be noted that, GPU support with appropriate environment (tensorflow backened with keras) is required for executing the code.
     * `cd Chrome/ondemand/`
     * `./Restored_model_val.py`
 - Online phase:
   * Run the Restored_model_test.py to find out the accuracy on test dataset. This accuracy is reported on Table 2 of the paper.
     *  `./Restored_model_test.py`
   * For checking the performance of other models except for our proposed CNN, run the following code:
     * `./knn.py` <br/>
     * `./svm.py` <br/>
     * `./rf.py` <br/>
 - If anyone is interested to create a new pretrained model on the similar set up, then run the `CNN_1D.py` after updating the name of the model. Then, upate the name of the loaded model in `Restored_model_test.py`. However, It is to be noted that, for a newly created pretrained model, the accuracy will slightly differ than the one we reported in the paper. For reproducing the exact accuracy, we have attached the pretrained model here named `Model1.h5`.  
## Tor Browser Scenario:
For the Tor Browser scenario, the explanation remains same, as we have named the file in the same manner as Chrome Browser scenario for the convenience. Although the test accuracy on the Tor browser is comparatively lower than the Google Chrome scenario, we also provide the top 5 accuracy for Tor browser scenario, which corresponds to the accuracy rate at which the correct website belongs among the top 5 predictions of the ML model as presented in Table 2. For this part, we have modified the `Restored_model_test.py` which will automaitcally save the raw predictions for different classes. Hence, Similar to google-chrome, the following commands need to run for reproducing the result: <br/>
  * `cd Tor/`
  * `./Restored_model_val.py`
After running this python script, the test accuracy for Tor Browser will be printed out. In addition, the raw predictions for different classes will be saved as [Raw_Prediction_cnn.txt](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/AMD%20Ryzen%205/Tor/Raw_Prediction_cnn.txt). Later, for finding out the Top 5 score as reported in Table 2, run the MATLAB code `.m`




