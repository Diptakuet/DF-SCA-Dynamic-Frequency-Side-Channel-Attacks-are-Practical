#!/bin/bash

tor1='www.facebook.com'
tor2='www.amazon.com'
tor3='www.Google.com'
tor4='www.Netflix.com'
tor5='www.yahoo.us'
tor6='www.Wikipedia.org'
tor7='www.Aliexpress.com'
tor8='www.Bing.com'
tor9='www.Ebay.com'
tor10='www.reddit.com'
tor11='www.twitter.com'
tor12='www.Linkedin.com'
tor13='www.Live.com'
tor14='www.Diply.com'
tor15='www.www.Ntd.tv'
tor16='www.Cnn.com'
tor17='www.Pinterest.com'
tor18='www.Office.com'
tor19='www.microsoft.com'
tor20='www.chase.com'


# Number of webpages 1-20
Nw_start=1
Nw_end=20   


Nm=100    # Number of measurement per website
Ns=3000   # Number of samples  

for ((i=$Nw_start; i<=$Nw_end; i++))
do
  for ((j=1; j<=$Nm; j++))
  do
    web='web'$i
    taskset -c 1 ./firefox --allow-remote &
    sleep 20s 
    taskset -c 1 ./firefox --allow-remote ${!web} &   
    for ((k=1; k<=$Ns; k++))
    do 
      Freq_CPU=$(cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq)
      echo $Freq_CPU
      sleep 0.01s;
    done
    killall firefox.real &
    sleep 15s;
  done
done
