# Buildroot-SDR
Buildroot modules used for SDR and ADSB, directed for use on RaspberryPi. 

This is an external pack for [Buildroot](https://buildroot.org/). It is intended to build a base image suitable for NetBooting. My current personal build (to be shared in a different repo later) runs aprox 16M (6.7 after gzip) including:
- busybox
- uclibc
- ntpd 
- dropbear
- uchdpc
- nginx (might be replaced later with something smaller?)
- collectd
- dump1090-mutability
- strace (for debugging)
- rtl_sdr tools
- fr24feed (Flightradar24)
- bash (for fr24feed, see below)

```
16248832 May 18 13:49 rootfs.cpio
 6924676 May 18 13:49 rootfs.cpio.gz
```

## Simple start 

1. Clone/Install BuildRoot
2. Clone this repository in a seperate directory
3. Add this repo to buildroot by using [external customization](https://buildroot.org/downloads/manual/manual.html#outside-br-custom)

## Working

### dump1090-mutability 

This works with RTL devices, and provides json stat files to /usr/share/dump1090 - It also provides a symlink from /usr/share/dump1090 for use with nginx

This is specifically the mutability fork of dump1090

#### Optionals
- nginx

### flightradar24

This will pull ADSB traffic from dump1090 and send to flightradar24 - note, the API key is hard coded and needs to be set. 

#### Dependancies
- bash

#### Buggies 
- Shells out to bash to run ping and hostname, this is stupid and bad. This also means bash is a requirement, and hostname will always fail since busybox hostname isn't the same as regular hostname

## Not Working

### RRD/Collectd for stats from dump1090

In order to collect stats from dump1090, the dump1090-tools uses python. In order to get these stats into collectd, the python bindings are compiled into collectd. Unfortunatly, this doesn't currently work in Buildroot. 

#### Options
- Make python bindings work in build root
-- This isn't trivial. Started down this rabbit hole and found a blocker
-- This would require python and it's bindings increasing the size of the image
- Build a pure C plugin for collectd that can be added and compiled
-- Non-trivial as it requires C programming
-- This is a better option as it wouldn't require python adding to the size of the image

### FlightAware / PiAware

PiAware is FlighAwares tools to send data to their systems. It is TCL based and would require TCL interpreter be added to the image. Secondly, they have a `tcllauncher` project that is used to launch the program. tcllauncher is currently the stumbling block for this project as it did not build cleanly. 

#### Options
- Get `tcllauncher` building and continue down the rabbit hole
-- Unknown requirements to make this work
-- This requires the TCL packages be installed, adding to the size of the image
- Build a C or GO option 
-- This would require reverse engineering how to communicate with FlightAware
-- C and GO are both cross-platform, this means a smaller binary would be made instead of interpreted languages

## Future

Items to work on for the future include
- Make the build smaller: The goal is netboot, so smaller is better
- Fix the not-working items from above
- Make it easier to config

### Configs

The goal here is to have a list of places that might store configs. The question becomes, where and how do you access them.

- SDCard - These go bad, so remote deployments become a pain if they go bad
- Network - This is a good option, but how do you identify where to get the configs
-- HTTP
-- TFTP
