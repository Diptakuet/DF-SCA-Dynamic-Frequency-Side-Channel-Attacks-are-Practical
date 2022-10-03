#!/bin/bash

web1='www.360.cn/'
web2='www.adobe.com/'
web3='aliexpress.com/'
web4='amazon.com/'
web5='apple.com/'
web6=' baidu.com/'
web7='bestbuy.com/'
web8='blogspot.com/'
web9='canva.com/'
web10='chase.com/' 
web11='csdn.net/'
web12='diply.com/'
web13='ebay.com/'
web14='facebook.com/'
web15='force.com/'
web16='google.com/'
web17='huanqiu.com/'
web18='indeed.com/'
web19='intuit.com/'
web20='jd.com/'

# Number of webpages 1-20
Nw_start=1
Nw_end=20     

Nm=100    # Number of measurement per website
Ns=1000   # Number of samples  

for ((i=$Nw_start; i<=$Nw_end; i++))
do
  for ((j=1; j<=$Nm; j++))
  do
    web='web'$i
    taskset -c 1 google-chrome ${!web} &             
    for ((k=1; k<=$Ns; k++))
    do 
      Freq_CPU=$(cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq)
      echo $Freq_CPU
      sleep 0.01s;
    done
    wmctrl -c "Google Chrome" &
    sleep 10s;
  done
done
