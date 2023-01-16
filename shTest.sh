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


## ()与{}的区别
## ()只是把一串命令重新开一个子shell进行执行，不影响当前shell环境；
## {}对一串命令在当前shell执行,影响当前shell环境
var=test
echo $var
(var=notest;echo $var)
echo $var
{ var=notest;echo $var;}
echo $var



## ==与=的区别
## == 可用于判断变量是否相等，= 除了可用于判断变量是否相等外，还可以表示赋值。
## = 与 == 在 [ ] 中表示判断(字符串比较)时是等价的
s1="foo"
s2="foo"
[ $s1=$2 ] && echo "equal"
[ $s1==$2 ] && echo "equal"
## 在 (( )) 中 = 表示赋值， == 表示判断(整数比较)，它们不等价
((n=5))
echo $n
((n==5)) && echo "equal"

