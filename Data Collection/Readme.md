# Data Collection:

For collecting CPU frequency for different websites follow the steps mentioned below:
`cd ~`<br/>
`cd Data Collection/`<br/>
`script -a <path/name.txt>`<br/>
<i>For google-chrome:<br/></i>
`./data_chrome.sh`<br/> 
<i>For Tor browser:<br/></i>
`./data_tor.sh`<br/>
`exit`

In [data_chrome.sh](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/Data%20Collection/data_chrome.sh) update the `url` for different websites. Following these instructions will save frequency traces of 100 measurements of a specific url in `name.txt` file. Each measurement will consists of 1000 samples with 0.01s resolution. The `data_chrome.sh` script needs to run 100 times for 100 different url links of webpages. The url liks of 100 webpages selected for Chrome browser are listed in [website_list_google_chrome.txt](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/Data%20Collection/website_list_google_chrome.txt)

For tor browser scenario, replace the `./data_chrome.sh` by `./data_tor.sh` command. For tor browser, the number of samples is increased from 1000 to 3000 samples, as it requires more time to load the webpages. Similar to chrome browser, the [data_tor.sh](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/Data%20Collection/data_tor.sh) script needs to be run for 100 times by updating the url of the webpages, which are listed in [website_list_tor.txt](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/Data%20Collection/website_list_tor.txt)

# Preprocessing Data:
