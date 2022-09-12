#!/bin/bash

for j in {1..100};                                          # Number of measurement = 100
do
  taskset -c 1 ./firefox --allow-remote &
  sleep 10s 
  taskset -c 1 ./firefox --allow-remote <url> &             # Update the url, e.g, www.zoom.com
  for i in {1..3000};                                       # Number of samples = 3000
  do 
    Freq_CPU=$(cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq)
    echo $Freq_CPU
    sleep 0.01s                                             # Sampling rate = 0.01s
  done
  killall firefox.real &
  sleep 15s;
done
