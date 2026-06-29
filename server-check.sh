#!/bin/bash

echo "========================================="
echo "       Linux Server Performance Stats"
echo "========================================="
echo "Hostname        : $(hostname)"
echo "Date            : $(date)"
echo

#############################
# CPU Usage
#############################

cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')

echo "========== CPU Usage =========="
printf "Total CPU Usage : %.2f%%\n" "$cpu_usage"
echo

#############################
# Memory Usage
#############################

read total used free <<< $(free -m | awk '/^Mem:/ {print $2, $3, $4}')

mem_percent=$(awk "BEGIN {printf \"%.2f\", ($used/$total)*100}")

echo "========== Memory Usage =========="
echo "Total Memory : ${total} MB"
echo "Used Memory  : ${used} MB"
echo "Free Memory  : ${free} MB"
echo "Usage        : ${mem_percent}%"
echo

#############################
# Disk Usage
#############################

disk_total=$(df -h / | awk 'NR==2 {print $2}')
disk_used=$(df -h / | awk 'NR==2 {print $3}')
disk_free=$(df -h / | awk 'NR==2 {print $4}')
disk_percent=$(df -h / | awk 'NR==2 {print $5}')

echo "========== Disk Usage =========="
echo "Total Disk : $disk_total"
echo "Used Disk  : $disk_used"
echo "Free Disk  : $disk_free"
echo "Usage      : $disk_percent"
echo

#############################
# Top 5 CPU Processes
#############################

echo "========== Top 5 Processes by CPU =========="
ps -eo pid,user,comm,%cpu --sort=-%cpu | head -6
echo

#############################
# Top 5 Memory Processes
#############################

echo "========== Top 5 Processes by Memory =========="
ps -eo pid,user,comm,%mem --sort=-%mem | head -6
echo

#############################
# Stretch Goals
#############################

echo "========== OS Version =========="
if [ -f /etc/os-release ]; then
    grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"'
fi
echo

echo "========== Uptime =========="
uptime -p
echo

echo "========== Load Average =========="
uptime | awk -F'load average:' '{print $2}'
echo

echo "========== Logged-in Users =========="
who
echo

echo "========== Failed Login Attempts =========="
if command -v lastb &>/dev/null; then
    lastb | head -5
else
    echo "lastb command not available."
fi

echo
echo "========================================="
echo "Report Completed"
echo "========================================="
