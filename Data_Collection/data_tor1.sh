#!/bin/bash

tor1='facebook.com'
tor2='amazon.com'
tor3='Google.com'
tor4='Netflix.com'
tor5='yahoo.us'
tor6='Wikipedia.org'
tor7='Aliexpress.com'
tor8='Bing.com'
tor9='Ebay.com'
tor10='reddit.com'
tor11='twitter.com'
tor12='Linkedin.com'
tor13='Live.com'
tor14='Diply.com'
tor15='Ntd.tv'
tor16='Cnn.com'
tor17='Pinterest.com'
tor18='Office.com'
tor19='microsoft.com'
tor20='chase.com'


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
