#!/bin/bash

tor21='www.Nytimes.com'
tor22='www.Blogspot.com'
tor23='www.paypal.com'
tor24='www.Wordpress.com'
tor25='www.Espn.com'
tor26='www.Wikia.com'
tor27='www.Wikileaks.org'
tor28='www.Imdb.com'
tor29='www.Balkanleaks.eu'
tor30='www.Unileaks.org'
tor31='www.Globaleaks.com'
tor32='www.Liveleak.com'
tor33='www.Globalwitness.org'
tor34='www.Wikispooks.com'
tor35='www.Officeleaks.com'
tor36='www.Publeaks.nl'
tor37='www.Aljazeera.com/investigations'
tor38='www.apple.com'
tor39='www.adobe.com'
tor40='www.canva.com'

# Number of webpages 21-40
Nw_start=21     
Nw_end=40


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
