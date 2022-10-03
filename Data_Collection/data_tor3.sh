#!/bin/bash

tor41='www.indeed.com'
tor42='www.intuit.com'
tor43='www.jd.com'
tor44='www.qq.com'
tor45='www.target.com'
tor46='www.tiktok.com'
tor47='www.wellsfargo.com'
tor48='www.ups.com' 
tor49='www.zillow.com'
tor50='www.zoom.com'
tor51='www.instagram.com'
tor52='www.whatsapp.com'
tor53='www.fandom.com'
tor54='www.instructure.com'
tor55='www.twitch.tv'
tor56='www.walmart.com'
tor57='www.github.com'
tor58='www.stackoverflow.com'
tor59='www.douban.com'
tor60='www.mail.ru'

# Webpage Number 41-60
Nw_start=41 
Nw_end=60   

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
