#!/bin/bash

#Passing in two arugments. One for date (4 digits) and one for time (##:##:##(AM or PM)).
#Need to read *schedule files to search by date and time.
#$1 will represent the time arguement passed in ##:##:##XM format (12:00:00PM) and $2 the four digit date in MMDD formate (0310)  

echo "The work time entered: " $1 " and the day entered: " $2
FILEDATE=$2
echo $FILEDATE"_Dealer_schedule - file to be searched."

awk -F" " '{print $1 $2" " $5" " $6}' $FILEDATE* | grep -i -0 "$1" 

#awk -F" " '{print $1 $2" " $5" " $6}' $FILEDATE* > Dealer_Name_Time
#awk -F" " '{print $1 $2" " $5" " $6}' *schedule > Dealer_Name_Time
#grep -i -0 "$1" Dealer_Name_Time > diditmakeit ----this worked
#awk -F" " '{print $1 $2" " $5" " $6}' *schedule > pass_test
#grep -i -0 "$1" "$2" $1*schedule
#grep -i -0 "$1" $FILEDATE* > temptestfile #nothing writing to file. Not sure if reading file 
#grep -i -0 "$1" pass_test > diditmakeit
#grep -i "$1" "$2" "$1"*schedule 

#awk -F" " '{print $1, $2" " $5" " $6}' *schedule
#grep -i -0 "08:00:00AM" Four_Field_List >> Dealer_working_during_losses
#grep -i -0 "02:00:00PM" Four_Field_List >> Dealer_working_during_losses 
#grep -i "billy jones" Dealer_working_during_losses | wc -l >> Dealer_working_during_losses


exit
