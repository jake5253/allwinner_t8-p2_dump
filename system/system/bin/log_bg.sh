output=/data/local/boot_log
logtype_string=("all" "main" "radio" "events" "system" "crash" "security" "kernel" "kernel_raw");
if [ ! -d "$output" ]; then
    mkdir -p $output
fi

logtype=`getprop persist.sys.logtype`
if [ "$logtype" = "" ];then
    logtype=101
fi

logsize=`getprop persist.sys.logsize`
if [ "$logsize" = "" -o "$logsize" -gt 10 -o "$logsize" -lt 1 ];then
    logsize=5
fi

chmod 666 ${output}/*.log

for j in $(seq 1 `expr $logsize - 1`)
do
    for i in $(seq 0 8)
    do
        mv ${output}/`expr ${logsize} - ${j}`_${logtype_string[$i]}_log.log ${output}/`expr ${logsize} - ${j} + 1`_${logtype_string[$i]}_log.log
    done
done

for i in $(seq 0 8)
do
    bit=$((16#$logtype&$((1<<$i))))
    if [ $bit != 0 ]; then
        if [ $i == 8 ]; then
            cat /dev/kmsg >> ${output}/1_${logtype_string[$i]}_log.log &
        else
            logcat -b ${logtype_string[$i]} >> ${output}/1_${logtype_string[$i]}_log.log &
        fi
    fi
done

wait
