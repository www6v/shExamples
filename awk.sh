#!/bin/bash

<<comment
   FS：指定每行文本的字段分隔符，默认为空格或制表位。 与-F一样
   NF：当前处理的行的字段个数。 
   NR：当前处理的行的行号（序数）。 
   $0：当前处理的行的整行内容。 
   $n：当前处理行的第 n 个字段（第 n 列）。 
   FILENAME：被处理的文件名。
   RS：数据记录分隔，默认为\n，即每行为一条记录。 
comment

## -F 指定分隔符
tail -1 /etc/passwd | awk -F ":" '{print $6}' 

## -v 指定变量和默认值
seq 1 10 > 1.txt 
awk -v "a=0" '{a+=$1;print a}' 1.txt | tail -1
awk -v "a=0" '{a+=$1}END{print a}' 1.txt 


## $NF代表最后一个字段
awk -F ":" 'NR==10{print $NF}' /etc/passwd

# FS指定分隔符
# 优先级写法
awk 'BEGIN{FS=":"}NR==2{print $1,$2}' 3.txt

# OFS一般与FS或者-F共同使用  
awk -F ":" 'NR==2{OFS="_";print $1,$2}' 3.txt
awk 'BEGIN{FS=":";OFS="-"}NR==2{print $1,$2,$3}' 3.txt


# RS指定结尾符一般与OFS配合
awk 'BEGIN{RS=""}{print $0}' 2.txt
awk 'BEGIN{RS=" "}{print $0}' 2.txt


# awk小技巧
#可以打印一个文件下有多少行
awk 'END{print NR}' /etc/passwd
#可以打印最后一行
awk 'END{print $0}' /etc/passwd 
#可以打印文件内最后一行有多少个字段
##如果文件内有分隔符，需要指定分隔符
awk -F ":" 'END{print NF}' /etc/passwd 

