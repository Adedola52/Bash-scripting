#! /bin/bash

log="/home/taibatabowaba/Desktop/data_pipeline/logs/summary.log"
in_log="/home/taibatabowaba/Desktop/data_pipeline/logs/preprocess.log"

if
grep -Ei "ERROR|failed" $in_log;
then
echo "$(date '+%Y-%m-%d %H:%M:%S'): Error found during preprocessing" > $log
else
echo "$(date '+%Y-%m-%d %H:%M:%S'): No Error found during preprocessing" > $log
fi
