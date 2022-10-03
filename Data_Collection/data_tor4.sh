#!/bin/bash

tor61='www.quora.com'
tor62='www.tumblr.com'
tor63='www.bbc.com'
tor64='www.medium.com'
tor65='www.dropbox.com'
tor66='www.godaddy.com'
tor67='www.imgur.com'
tor68='www.soundcloud.com'
tor69='www.discord.com'
tor70='www.booking.com'
tor71='www.yandex.ru'
tor72='www.vimeo.com'
tor73='www.etsy.com'
tor74='www.slideshare.net'
tor75='www.vice.com'
tor76='www.foxnews.com'
tor77='www.9gag.com'
tor78='www.slack.com'
tor79='www.telegram.org'
tor80='www.forbes.com'

# Webpage Number 61-80
Nw_start=61 
Nw_end=80   


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
