# DF-SCA-Dynamic-Frequency-Side-Channel-Attacks-are-Practical
We present DF-SCA, which is a software-based dynamic frequency side-channel attack on Linux and Android OS devices. We show that Dynamic Voltage and Frequency Scaling (DVFS) feature in modern systems can be utilized to perform website fingerprinting attacks for Google Chrome and Tor browsers on modern Intel, AMD, and ARM architectures. Moreover, we extract properties of keystroke patterns on frequency readings, that leads to 95% accuracy to distinguish the keystrokes from other activities on Android phones.

# Experimental Setup:
- ## Intel Comet Lake Microarchitecture
  * CPU Model: Intel(R) Core (TM) i7-10610U CPU @ 1.80GHz
  * OS: Ubuntu 20.04 LTS
  * Linux Kernel: 5.11.0-46-generic
  * Google Chrome version 85.0.4183.102
  * Tor browser version 10.5.10 
- ## Intel Tiger Lake Microarchitecture
  * CPU Model: Intel(R) Core (TM) i7-1165G7 @ 2.80GHz
  * OS: Ubuntu 20.04.4 LTS
  * Linux Kernel: 5.13.0-44-generic
  * Google Chrome version 101.0.4951.64
  * Tor browser version 10.5.10
- ## AMD Ryzen 5 Microarchitecture
  * CPU Model: AMD Ryzen 5 5500U CPU @ 1.70GHz
  * OS: Ubuntu 20.04.4 LTS
  * Linux Kernel: 5.13.0-44-generic
  * Google Chrome version 101.0.4951.64
  * Tor browser version 10.5.10
- ## ARM Cortex-A53 Microarchitecture
  * CPU Model: Four ARM Cortex-A53 and Four ARM Cortex-A73 cores
  * OS: Android 9
  * Google Chrome version 97.0.4692.98
  * Bank of America application version 21.11.04
- ## Additional 
  * Nvidia GeForce RTX 3090 GPU card
  * MATLAB R2021a
