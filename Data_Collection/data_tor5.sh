#!/bin/bash

tor81='www.roblox.com'
tor82='www.globo.com'
tor83='www.w3schools.com'
tor84='www.flipkart.com'
tor85='www.fedex.com'
tor86='www.scribd.com'
tor87='www.mediafire.com'
tor88='www.researchgate.net'
tor89='www.softonic.com'
tor90='www.rambler.ru'
tor91='www.washingtonpost.com'
tor92='www.theguardian.com'
tor93='www.cloudflare.com'
tor94='www.wordpress.org'
tor95='www.gravatar.com'
tor96='www.brandbucket.com'
tor97='www.who.int'
tor98='www.dailymotion.com'
tor99='www.nature.com'
tor100='www.time.com'

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
