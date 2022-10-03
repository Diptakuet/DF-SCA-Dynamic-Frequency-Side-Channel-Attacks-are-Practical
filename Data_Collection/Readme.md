# Data Collection:

For collecting CPU frequency for different websites follow the steps mentioned below:<br/>
- Checking the current scaling governor in the victim's device: <br/>
`cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_governor` <br/>
- For offline phase, the attacker can change the scaling governor in his device to match with the victim's device and collect data which will be utilized to train the ML model. The command for changing the current scalling governor to `ondemand` mode: <br/>
`echo "ondemand" | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor`<br/>
- Data collection for Chrome Browser: In this study, we have collected 100 energy consumption measurements for each 100 different websites ([Website list]((https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/Data%20Collection/website_list_google_chrome.txt)). We are going to record 100 individual measurements of 20 websites at a single run and save it in a single csv file. The `data_chrome1.sh` is written to record data for the first 20 websites and will be saved in `web1_20.csv` file. Similarly, the `data_chrome2.sh` is responsible for collecting data for the next 20 websites and will be saved in `web21_40.csv` file. By following the commnands mentioned below, five csv file will be created and saved in the directory which we will call raw data. 

  `cd ~`<br/>
  `cd Data Collection/`<br/>
  `script -a web1_20.csv`<br/>
  `./data_chrome1.sh`<br/> 
  `exit`<br/> 
  `script -a web21_40.csv`<br/>
  `./data_chrome2.sh`<br/> 
  `exit`<br/>
  `script -a web41_60.csv`<br/>
  `./data_chrome3.sh`<br/> 
  `exit`<br/>
  `script -a web61_80.csv`<br/>
  `./data_chrome4.sh`<br/> 
  `exit`<br/>
  `script -a web81_100.csv`<br/>
  `./data_chrome5.sh`<br/> 
  `exit`<br/>

- Preprocessing: Once the data collection is completed, the next step is to pre-process the data. Each csv file contains data for 20 websites and each website has 100 measurements with 1000 samples per measurement. The [Data_process.m](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/Data_Collection/Data_process.m) reads the collected raw data, perfomrs pre-processing and split it among training, validation, and test dataset.
By running `Data_process.m` in MATLAB, the processed data will be saved in the `Data` directory. This processed data will be feed into the predictions model for the later experimentations.

- Data collection for Tor Browser:
The procedure remains same for Tor Browser as well. For Tor Browser scenario, follow the commands below: <br/>
  `cd ~`<br/>
  `cd Data Collection/`<br/>
  `script -a tor1_20.csv`<br/>
  `./data_tor1.sh`<br/> 
  `exit`<br/> 
  `script -a tor21_40.csv`<br/>
  `./data_tor2.sh`<br/> 
  `exit`<br/>
  `script -a tor41_60.csv`<br/>
  `./data_tor3.sh`<br/> 
  `exit`<br/>
  `script -a tor61_80.csv`<br/>
  `./data_tor4.sh`<br/> 
  `exit`<br/>
  `script -a tor81_100.csv`<br/>
  `./data_tor5.sh`<br/> 
  `exit`<br/>

It is to be noted that, we have collected 3000 samples per measurement for Tor Browser as it takes compratively more time to load the webpages in the Tor Browser. The [website list](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/Data_Collection/website_list_tor.txt) for the Tor browser scenario is also different than chrome browser as some of the webpages does not work in Tor browser due to various restrictions. 

- Preprocessing: For preprocessing the raw data, run the  [Data_process_tor.m](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/Data_Collection/Data_process%20_tor.m) file in MATLAB, which will create the processed data and will save in the `Data` directory as before.


After preprocessing the data, the final data for different devices are allocated to the appropriate folders.
