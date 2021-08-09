FILE_SYSTEM=""
DIRECTORY=""
FILE_PATTERN=""

MEMORY_USAGE=`df | grep -i ${FILE_SYSTEM} | awk '{print $5}' | sed "s/%$//"`

echo $MEMORY_USAGE
#check for memory use
if [ $MEMORY_USAGE -gt 80 ]
then
   `find $DIRECTORY -type f -name $FILE_PATTERN -mtime +35 exec rm -f {};`
    #remove file more than 35 days modification time
   `find $DIRECTORY -type f -name $FILE_PATTERN -mtime +7 –mtime -35 exec gzip {} \;`
    #zip file in 7 to 35 days range
else
   echo "Memory is under Threshold"
fi
