# Data Collection:

For collecting CPU frequency for different websites follow the steps mentioned below:
`cd ~`<br/>
`cd Data Collection/`<br/>
`script -a <path/name.txt>`<br/>
`data.sh`<br/>
`exit`

In [data.sh](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/Data%20Collection/data.sh) update the `url` for different websites. Following these instructions will save frequency traces of 100 measurements of a specific url in `name.txt` file. Each measurement will consists of 1000 samples with 0.01s resolution. The `data.sh` script needs to run 100 times for 100 different url links of webpages.
It is to be noted that, the script only works for chrome browser in all our setup.

The url liks of 100 webpages selected for Chrome browser are listed in [website_list_google_chrome.txt](https://github.com/Diptakuet/DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical/blob/main/Data%20Collection/website_list_google_chrome.txt)

# Preprocessing Data:
