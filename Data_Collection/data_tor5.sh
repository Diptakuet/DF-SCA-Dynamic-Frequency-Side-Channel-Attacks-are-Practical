#!/bin/bash

web81='www.vice.com'
web82='www.foxnews.com'
web83='www.9gag.com'
web84='www.slack.com'
web85='www.airbnb.com'
web86='www.telegram.org'
web87='www.forbes.com'
web88='www.roblox.com'
web89='www.globo.com'
web90='www.w3schools.com'
web91='www.flipkart.com'
web92='www.bankofamerica.com'
web93='www.fedex.com'
web94='www.scribd.com'
web95='www.mediafire.com'
web96='www.researchgate.net'
web97='www.softonic.com'
web98='www.rambler.ru'
web99='www.washingtonpost.com'
web100='www.theguardian.com'

# Webpage Number 81-100
Nw_start=81 
Nw_end=100  

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
