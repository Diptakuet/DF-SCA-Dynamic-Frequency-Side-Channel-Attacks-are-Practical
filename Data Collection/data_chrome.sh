#!/bin/bash

Nm=100     # Number of measurement per website
Ns=1000    # Number of samples

for ((i=1; i<=$Nm; i++))
do
  taskset -c 1 google-chrome <url> &           # update url for different websites, e.g., www.twitter.com/     
  for ((j=1; j<=$Ns; j++))
  do 
    Freq_CPU=$(cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq)
    echo $Freq_CPU
    sleep 0.01s;
  done
  wmctrl -c "Google Chrome" &
  sleep 10s;
done
