#!/bin/bash

web 61='www.stackoverflow.com'
web 62='www.douban.com'
web 63='www.youtube.com'
web 64='www.mail.ru'
web 65='www.quora.com'
web 66='www.tumblr.com'
web 67='www.bbc.com'
web 68='www.medium.com'
web 69='www.dropbox.com'
web 70='www.godaddy.com'
web 71='www.imgur.com'
web 72='www.soundcloud.com'
web 73='www.discord.com'
web 74='www.booking.com'
web 75='www.rakuten.com'
web 76='www.yandex.ru'
web 77='www.vimeo.com'
web 78='www.etsy.com'
web 79='www.slideshare.net'
web 80='www.cloudflare.com'

# Webpage Number 61-80
Nw_start=61 
Nw_end=80   
 
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
