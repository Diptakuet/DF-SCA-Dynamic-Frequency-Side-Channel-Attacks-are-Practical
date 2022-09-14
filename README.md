# DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical
We present DF-SCA, which is a software-based dynamic frequency side-channel attack on Linux and Android OS devices. We show that Dynamic Voltage and Frequency Scaling (DVFS) feature in modern systems can be utilized to perform website fingerprinting attacks for Google Chrome and Tor browsers on modern Intel, AMD, and ARM architectures. Moreover, we extract properties of keystroke patterns on frequency readings, that leads to 95% accuracy to distinguish the keystrokes from other activities on Android phones.

# Experimental Setup:
- ## Intel Comet Lake Microarchitecture
  * CPU Model: Intel(R) Core (TM) i7-10610U CPU @ 1.80GHz
  * OS: Ubuntu 20.04 LTS
  * Linux Kernel: 5.11.0-46-generic
  * Google Chrome version 85.0.4183.102
  * Tor browser version 10.5.10 
- ## Intel Tiger Lake Microarchitecture
  * CPU Model: Intel(R) Core (TM) i7-1165G7 @ 2.80GHz
  * OS: Ubuntu 20.04.4 LTS
  * Linux Kernel: 5.13.0-44-generic
  * Google Chrome version 101.0.4951.64
  * Tor browser version 10.5.10
- ## AMD Ryzen 5 Microarchitecture
  * CPU Model: AMD Ryzen 5 5500U CPU @ 1.70GHz
  * OS: Ubuntu 20.04.4 LTS
  * Linux Kernel: 5.13.0-44-generic
  * Google Chrome version 101.0.4951.64
  * Tor browser version 10.5.10
- ## ARM Cortex-A53 Microarchitecture
  * CPU Model: Four ARM Cortex-A53 and Four ARM Cortex-A73 cores
  * OS: Android 9
  * Google Chrome version 97.0.4692.98
  * Bank of America application version 21.11.04
- ## Additional 
  * Nvidia GeForce RTX 3090 GPU card
  * Software: MATLAB R2021a

# Data Collection:

For collecting CPU frequency for different websites follow the steps mentioned below:<br/>
- Checking the current scaling governor in the victim's device: <br/>
`cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_governor` <br/>
- For offline phase, the attacker can change the scaling governor in his device to match with the victim's device and collect data which will be utilized to train the ML model. The command for changing the current scalling governor to `ondemand` mode: 
`echo "ondemand" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor`<br/>
- Data collection: <br/>
`cd Data_Collection/`<br/>
`script -a <path/name.txt>`<br/>
`./data_chrome.sh`<br/> 
`exit`

In [data_chrome.sh](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/Data_Collection/data_chrome.sh) update the `url` for different websites. Following these instructions will save frequency traces of 100 measurements of a specific url in `name.txt` file. Each measurement will consists of 1000 samples with 0.01s resolution. The `data_chrome.sh` script needs to run 100 times for 100 different url links of webpages. The url liks of 100 webpages selected for Chrome browser are listed in [website_list_google_chrome.txt](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/Data_Collection/website_list_google_chrome.txt)

For tor browser scenario, replace the `./data_chrome.sh` by `./data_tor.sh` command. For tor browser, the number of samples is increased from 1000 to 3000 samples, as it requires more time to load the webpages. Similar to chrome browser, the [data_tor.sh](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/Data_Collection/data_tor.sh) script needs to be run for 100 times by updating the url of the webpages, which are listed in [website_list_tor.txt](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/Data_Collection/website_list_tor.txt)

After preprocessing the data, the final data for different devices are allocated to the appropriate folders.

# Website Fingerprinting:
Website fingerprinting is carried out on four different devices. The procedures and explanations will remain consistent for all of them. As example, we will explain the procedures for reproducing the result for AMD Ryzen 5. The directories are named based on the different microarchitectures, such as `AMD Ryzen 5`, `Intel Comet Lake`, `Intel Tiger Lake`, and `ARM Cortex A-73`.

The `Data Collection` directory contains the relevant script for collecting CPU frequency data based on the Algorithm 1 presented in the paper.

The `Universal ML` directory contains the code from which Table 5 is generated to prove the concept of universal ML explained in Section 9: Discussion. 

In the following section, we will explain the case study for AMD Ryzen 5. The procedures will remain same for other microarchitectures as mentioned earlier.

`cd AMD_Ryzen_5/`<br/>

## Google-Chrome Scenario:
The website fingerprinting is tested with six different scaling governors avaialable in our device. The default scaling governor of AMD Ryzen 5 is ondemand. The folders are named based on the scaling governors. As example, we will explain the scanario of deafult scaling governor ondemand. The explanation will be consistent with other governors as well. <br/>
- [ondemand](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/tree/main/AMD_Ryzen_5/Chrome/ondemand)
  * [Data](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/tree/main/AMD_Ryzen_5/Chrome/ondemand/Data): The final preprocessed data splitted among train, validation, and test.<br/>
    * [X_train_100.csv](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/AMD_Ryzen_5/Chrome/ondemand/Data/X_train_100.csv): CPU frequency traces of 80 measurements from every 100 websites that constitutes the train dataset. Each row refers to the 1000 samples/measurement (Shape: 8000x1000). <br/>
    * [Y_train_100.csv](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/AMD_Ryzen_5/Chrome/ondemand/Data/X_train_100.csv): Labels of the train data (Shape: 8000x100). <br/>
    * [X_val_100.csv](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/AMD_Ryzen_5/Chrome/ondemand/Data/X_train_100.csv): CPU frequency traces of 10 measurements from every 100 websites that constitutes the validation dataset. Each row refers to the 1000 samples/measurement (Shape: 1000x1000). <br/>
    * [Y_val_100.csv](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/AMD_Ryzen_5/Chrome/ondemand/Data/X_train_100.csv): Labels of the validation data (Shape: 1000x100). <br/>
    * [X_test_100.csv](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/AMD_Ryzen_5/Chrome/ondemand/Data/X_train_100.csv): CPU frequency traces of  the rest 10 measurements from every 100 websites that constitutes the test dataset which will be used in online phase. Each row refers to the 1000 samples/measurement (Shape: 1000x1000). <br/>
    * [Y_test_100.csv](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/AMD_Ryzen_5/Chrome/ondemand/Data/X_train_100.csv): Labels of the test data (Shape: 1000x100). <br/>

  * [CNN_1D.py](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/AMD_Ryzen_5/Chrome/ondemand/CNN_1D.py): The CNN model trained during the offline phase for website fingerprinting. It takes the train and validation data as input and make the prediction. After the training complete, the model is saved as [Model1.h5](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/AMD_Ryzen_5/Chrome/ondemand/Model1.h5).
  * [Restored_model_val.py](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/AMD_Ryzen_5/Chrome/ondemand/Restored_model_val.py): The pretrained CNN model which is saved as `Model1.h5`, is loaded to make a prediction on the validation dataset. 
  * [Restored_model_test.py](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/AMD_Ryzen_5/Chrome/ondemand/Restored_model_test.py): The pretrained CNN model which is saved as `Model1.h5`, is loaded to make a prediction on the test dataset. This script is used to evaluate the performance of the prediction model during the online phase.
  * [knn.py](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/AMD_Ryzen_5/Chrome/ondemand/knn.py), [rf.py](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/AMD_Ryzen_5/Chrome/ondemand/rf.py), [svm.py](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/AMD_Ryzen_5/Chrome/ondemand/knn.py): The performance of the prediction model is tested with other ML algorithm-based model, such as Kth nearest neighbour (KNN), Random forest (RF), and Support Vector Machine (SVM).


### Instruction to run
- Offline phase:
  * The `CNN_1D.py` is executed to train a model using the data collected from AMD Ryzen 5. The pretrained model is saved as `Model1.h5`. 
  * To look at the accuracy on validation dataset, Run the Restored_model_val.py. It is to be noted that, GPU support with appropriate environment (tensorflow backened with keras) is required for executing the code.
     * `cd Chrome/ondemand/`<br/>
     * `./Restored_model_val.py`<br/>
 - Online phase:
   * Run the Restored_model_test.py to find out the accuracy on test dataset. This accuracy is reported on Table 2 of the paper.
     *  `./Restored_model_test.py`<br/>
   * For checking the performance of other models except for our proposed CNN, run the following code:
     * `./knn.py` <br/>
     * `./svm.py` <br/>
     * `./rf.py` <br/>
 - If anyone is interested to create a new pretrained model on the similar set up, then run the `CNN_1D.py` after updating the name of the model. Then, upate the name of the loaded model in `Restored_model_test.py`. However, It is to be noted that, for a newly created pretrained model, the accuracy will slightly differ than the one we reported in the paper. For reproducing the exact accuracy, we have attached the pretrained model here named `Model1.h5`.  
## Tor Browser Scenario:
For the Tor Browser scenario, the explanation remains same, as we have named the file in the same manner as Chrome Browser scenario for the convenience. Although the test accuracy on the Tor browser is comparatively lower than the Google Chrome scenario, we also provide the top 5 accuracy for Tor browser scenario, which corresponds to the accuracy rate at which the correct website belongs among the top 5 predictions of the ML model as presented in Table 2. For this part, we have modified the `Restored_model_test.py` which will automaitcally save the raw predictions for different classes. Hence, Similar to google-chrome, the following commands need to run for reproducing the result: <br/>
  * `cd Tor/`<br/>
  * `./Restored_model_val.py`<br/>
After running this python script, the test accuracy for Tor Browser will be printed out. In addition, the raw predictions for different classes will be saved as [Raw_Prediction_cnn.txt](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/AMD_Ryzen_5/Tor/Raw_Prediction_cnn.txt). Later, for finding out the Top 5 score as reported in Table 2, run the MATLAB code `confidance_score.m`.

For ML models other than CNN (For example: SVM), run `./svm.py`. This will provide the accuracy as well as save the raw predictions as [Raw_prediction_svm.txt](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/AMD_Ryzen_5/Tor/Raw_prediction_svm.txt). Update the `confidance_score.m` by replacing the `Raw_Prediction_cnn.txt` file with `Raw_Prediction_svm.txt`. Run the `confidance_score.m` to get the Top 5 score for the Tor Browser.

It is to be noted that, for Tor Browser scenario, we have carried out the experiment only for the default scaling governor of the device.

## Universal ML Model for different CPU models 
In the previous experiment, we trained separate ML models for Intel, AMD, and ARM architectures to obtain the highest website fingerprinting accuracy. However, it is still unclear whether it is possible to replace the individual ML models with a universal ML model trained with the CPU frequency data from several micro-architectures. Thus, an attacker can use a combined ML model without requiring to know the exact targeted microarchitecture for website fingerprinting. For this purpose, initially, we combined the CPU frequency data collected with powersave governor from both Intel Tiger Lake and Intel Comet Lake architectures to train a universal CNN model and evaluated the performance of the universal model with the test
data. The [Intel combined](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/tree/main/Universal_ML/Intel_combined) directory incorporates the relevant data and codes.

`cd Universal_ML/Intel_combined/` <br/>
`./Restored_model_test.py` <br/>

Later, we added the CPU frequency data set from the AMD Ryzen 5 architecture collected from ondemand governor and created a universal cross-architecture ML model. The [Intel_amd_combined](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/tree/main/Universal_ML/Intel_amd_combined) directory incorporates the relevant data and codes.  

`cd Universal_ML/Intel_amd_combined/` <br/>
`./Restored_model_test.py` <br/>

All the results are reported in Table 5 of the paper.

