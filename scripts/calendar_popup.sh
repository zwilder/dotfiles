#!/bin/bash
#
# pop-up calendar for dzen
#
# based on (c) 2007, by Robert Manea
# http://dzen.geekmode.org/dwiki/doku.php?id=dzen:calendar
# modified by zwilder
#
 
TODAY=$(expr `date +'%d'` + 0)
MONTH=`date +'%m'`
YEAR=`date +'%Y'`

(
# echo '^bg(#222222)^fg(#FFFFFF)'`date +'%A %d %B %Y %n'`; echo
echo
\
## current month, hilight header and today
cal \
    | sed -re "s/^(.*[A-Za-z][A-Za-z]*.*)$/^fg(#CB4B16)^bg(#111111)\1/;s/(^|[ ])($TODAY)($|[ ])/\1^bg(#111111)^fg(#CB4B16)\2^bg(#111111)^fg(#A6A6A6)\3/"
 
## next month, hilight header
[ $MONTH -eq 12 ] && YEAR=`expr $YEAR + 1`
cal `expr \( $MONTH + 1 \) % 12` $YEAR \
    | sed -e 's/^\(.*[A-Za-z][A-Za-z]*.*\)$/^fg(#CB4B16)^bg(#111111)\1/'


sleep 4
) \
    | dzen2 -bg '#111111' -fg '#A6A6A6' -fn '-*-droid sans mono-*-*-*-*-*-90-*-*-*-*-*-*' -x 1206 -y 20 -w 160 -l 16 -sa c -e 'onstart=uncollapse;key_Escape=ungrabkeys,exit'
    #| dzen2 -fg '#6c6c6c' -bg '#222222' -fn '-*-fixed-*-*-*-*-12-*-*-*-*-*-*-*' -x 828 -y 730 -w 160 -l 18 -sa c -e 'onstart=uncollapse;key_Escape=ungrabkeys,exit'
