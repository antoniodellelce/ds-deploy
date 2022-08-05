#!/bin/bash

# Install docker && configure "docker swarm"
# docker swarm here is just used to run a service (survive restart)

echo "LOGS: list all active processes"
ps -ef

# but before just wait for any possible other yum to finish its work
echo "LOGS: wait for yum"

sleep_cnt=5
cnt=0   # must be initialized or the first time  the if condition will have an error

while [ -f /var/run/yum.pid ]
do
   echo "LOGS: another yum is running: sleeping for $sleep_cnt"
   sleep $sleep_cnt

   [ $cnt -gt 0 ] && { echo "LOGS: sleep $cnt times."; }
   let cnt="(( $cnt + 1))"

   [ $cnt -gt 100 ] && { echo "LOGS: slept over 100 times: giving up"; break; }
done

echo "LOGS: going to start docker install and configuration at date: $(date)"

yum update -y &&
amazon-linux-extras install docker &&
service docker start &&
systemctl enable docker &&
docker swarm init &&
docker service create  -p 80:8080 --name hello ghcr.io/antoniodellelce/testbackend:latest

rc=$?

[ $rc != 0 ] && {
  echo "LOGS: Configuration failed"
}

exit $rc
