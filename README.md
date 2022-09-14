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
`cd ~`<br/>
`cd Data Collection/`<br/>
`script -a <path/name.txt>`<br/>
`./data_chrome.sh`<br/> 
`exit`

In [data_chrome.sh](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/Data%20Collection/data_chrome.sh) update the `url` for different websites. Following these instructions will save frequency traces of 100 measurements of a specific url in `name.txt` file. Each measurement will consists of 1000 samples with 0.01s resolution. The `data_chrome.sh` script needs to run 100 times for 100 different url links of webpages. The url liks of 100 webpages selected for Chrome browser are listed in [website_list_google_chrome.txt](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/Data%20Collection/website_list_google_chrome.txt)

For tor browser scenario, replace the `./data_chrome.sh` by `./data_tor.sh` command. For tor browser, the number of samples is increased from 1000 to 3000 samples, as it requires more time to load the webpages. Similar to chrome browser, the [data_tor.sh](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/Data%20Collection/data_tor.sh) script needs to be run for 100 times by updating the url of the webpages, which are listed in [website_list_tor.txt](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/Data%20Collection/website_list_tor.txt)

After preprocessing the data, the final data for different devices are allocated to the appropriate folders.
