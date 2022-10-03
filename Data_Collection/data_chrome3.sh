#!/bin/bash

web41='www.usps.com'
web42='www.weibo.com'
web43='www.wellsfargo.com'
web44='www.hulu.com'
web45='www.ups.com'
web46='www.xinhuanet.com'
web47='www.yahoo.com'
web48='www.zhanqi.tv'
web49='www.zillow.com'
web50='www.zoom.com'
web51='www.instagram.com'
web52='www.whatsapp.com'
web53='www.bing.com'
web54='www.fandom.com'
web55='www.instructure.com'
web56='www.twitch.tv'
web57='www.walmart.com'
web58='www.imdb.com'
web59='www.espn.com'
web60='www.github.com'

# Webpage Number 41-60
Nw_start=41 
Nw_end=60   
 
Nm=100      # Number of measurement per website
Ns=1000     # Number of samples  

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
