#!/bin/sh

rtl_433 -C si -F "influx://192.168.10.169:8086/write?db=rtl&p=rtl&u=rtl" -F "mqtt://192.168.10.169:1883,user=rtl,pass=rtl