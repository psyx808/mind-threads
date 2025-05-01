#!/bin/bash 

d="/home/$USER/.mind" 
f="$d/$(date +'%y/%m/%d')" 
m="$d/$(date +'%y/%m')"  

case "$1" in
  -a) 
    xdotool key Ctrl+End;xdotool type i &
    [ -e $d ] || mkdir $d  
    [ ! -d "$m" ] && mkdir -p "$m"
    nvim $f
    xdotool type "i"
  ;;
  *)
   for file in $(find $d -type f|sort); do
     echo -e "\e[96m$file"|sed "s,/home/$USER/.mind/,,"
     echo -e "$(cat $file|sed '/./s/^/\\e[92m-\\e[0m /')\n" 
  done
  ;;
esac
