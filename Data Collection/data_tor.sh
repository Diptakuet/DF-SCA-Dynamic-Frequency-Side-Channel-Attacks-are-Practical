#!/bin/bash

for j in {1..100};
do
  taskset -c 1 ./firefox --allow-remote &
  sleep 10s 
  taskset -c 1 ./firefox --allow-remote www.zoom.com &
  for i in {1..3000};
  do 
    Freq_CPU=$(cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq)
    echo $Freq_CPU
    sleep 0.01s
  done
  killall firefox.real &
  sleep 15s;
done


<<COMMENTS
sleep 30s;

for j in {1..100};
do
  taskset -c 1 ./firefox --allow-remote &
  sleep 10s 
  taskset -c 1 ./firefox --allow-remote www.zillow.com &
  for i in {1..3000};
  do 
    Freq_CPU=$(cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq)
    echo $Freq_CPU
    sleep 0.01s
  done
  killall firefox.real &
  sleep 15s;
done



sleep 30s;

for j in {1..100};
do
  taskset -c 1 ./firefox --allow-remote &
  sleep 10s 
  taskset -c 1 ./firefox --allow-remote www.zoom.com &
  for i in {1..3000};
  do 
    Freq_CPU=$(cat /sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq)
    echo $Freq_CPU
    sleep 0.01s
  done
  killall firefox.real &
  sleep 15s;
done


<<COMMENTS
tor1: facebook.com
tor2: amazon.com
tor3: Google.com
tor4: Netflix.com
tor5: yahoo.us
tor6: Wikipedia.org
tor7: Aliexpress.com
tor8: Bing.com
tor9: Ebay.com
tor10: reddit.com
tor11: twitter.com
tor12: Linkedin.com
tor13: Live.com
tor14: Diply.com
tor15: Ntd.tv
tor16: Cnn.com
tor17: Pinterest.com
tor18: Office.com
tor19: microsoft.com
tor20: chase.com
tor21: Nytimes.com
tor22: Blogspot.com
tor23: paypal.com
tor24: Wordpress.com
tor25: Espn.com
tor26: Wikia.com
tor27: Wikileaks.org
tor28: Imdb.com
tor29: Balkanleaks.eu
tor30: Unileaks.org
tor31: Globaleaks.com
tor32: Liveleak.com
tor33: Globalwitness.org
tor34: Wikispooks.com
tor35: Officeleaks.com
tor36: Publeaks.nl
tor37: Aljazeera.com/investigations
tor38: apple.com
tor39: adobe.com
tor40: canva.com
tor41: indeed.com
tor42: intuit.com
tor43: jd.com
tor44: qq.com
tor45: target.com
tor46: tiktok.com
tor47: wellsfargo.com
tor48: ups.com 
tor49: zillow.com
tor50: zoom.com



Web1: www.360.cn/
Web2: www.Baidu.com/
Web3: www.csdn.net/
Web4: www.Instagram.com/
Web5: www.Okezone.com/
Web6:  Sohu.com/
Web7:  Tribunnews.com/
Web8:  Wikipedia.org/
Web9:  Zoom.us/
Web10: Aliexpress.com/
web 11: Bing.com
web 12: Ebay.com
web 13: Jd.com
web 14: Naver.com
web 15: Qq.com 
web 16: Taobao.com
web 17: Twitch.tv
web 18: Xinhuanet.com
web 19: Alipay.com
web 20: Blogger.com
web 21: Facebook.com
web 22: Live.com
web 23: Netflix.com
web 24: Reddit.com
web 25: Tianya.cn
web 26: Vk.com
web 27: Yahoo.com
web 28: Amazon.com 
web 29: China.com.cn
web 30: Google.com
web 31: Microsoft.com ##
web 32: Office.com
web 33: Sina.com.cn
web 34: Tmall.com
web 35: Weibo.com
web 36: Youtube.com
COMMENTS
