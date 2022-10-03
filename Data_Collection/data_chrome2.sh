#!/bin/bash

web21='www.linkedin.com'
web22='www.live.com'
web23='www.msn.com'
web24='www.naver.com'
web25='www.netflix.com'
web26='www.ntdtv.com'
web27='www.nytimes.com'
web28='www.office.com'
web29='www.okezone.com'
web30='www.paypal.com'
web31='www.pinterest.com'
web32='www.qq.com'
web33='www.reddit.com'
web34='www.sohu.com'
web35='www.spotify.com'
web36='www.taobao.com'
web37='www.target.com'
web38='www.tiktok.com'
web39='www.tmall.com'
web40='www.twitter.com'

# Number of webpages 21-40
Nw_start=21     
Nw_end=40


Nm=100    # Number of measurement per website
Ns=1000   # Number of samples  

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
