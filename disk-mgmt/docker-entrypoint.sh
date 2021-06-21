#!/bin/bash
set -e
while true; do 
  if [ -z "$SERVICE_ACCOUNT_KEY" ]; then
   
    echo "service ACCOUNT KEY is required"
    continue
  else
     echo "SERVICE_ACCOUNT_KEY Found";
     break 
     
  fi

  if [ -z "$PROJECT_NAME" ]; then
     echo "Project name  is required";
     continue
  else 
     echo "Project name  Found"
     break
  fi

done


echo $SERVICE_ACCOUNT_KEY > key.json 
gcloud auth activate-service-account --key-file=key.json
gcloud config set project $PROJECT_NAME
export GOOGLE_APPLICATION_CREDENTIALS="/key.json"

# Start the run once job.
echo "Docker container has been started"

declare -p | grep -Ev 'BASHOPTS|BASH_VERSINFO|EUID|PPID|SHELLOPTS|UID' > /container.env

# Setup a cron schedule
echo "SHELL=/bin/bash
BASH_ENV=/container.env
* * * * * /watch.sh >> /var/log/cron.log 2>&1
# This extra line makes it a valid cron" > scheduler.txt

crontab scheduler.txt
cron -f