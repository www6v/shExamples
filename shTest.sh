#!/bin/bash

## 变量截取
a=12345678
echo ${a:5} 
echo ${a:3:4}
echo ${a:2:-1}
echo ${a:2:-2}

## $ [] 与$(()) 整数运算
a=5; b=7; c=2
echo $(( a+b*c ))
echo $(( (a+b)/c ))
echo $(( (a*b)%c))

