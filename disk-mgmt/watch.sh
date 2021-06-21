#!/bin/bash
#set -ex

IFS=$'\r\n' list=($(cat /disk-list))
for node in $(seq ${#list[*]}); do
     
    KEY=${list[$node-1]%%:*}
    VALUE=${list[$node-1]#*:}
    #KEY[$node-1]="${KEY[$node-1]}${KEY[$node-1]:+,}$VALUE"
    #printf "%s likes to %s.\n" "$KEY" "$VALUE"
    if [ "Ready"=~"$(kubectl get node "$KEY" | awk 'NR>1 {print $2}')" ]
       then
       #echo "$KEY";
       gcloud compute instances list --filter="$KEY" --project $PROJECT_NAME --format="value(disks[].deviceName)" | grep -o "$VALUE"
       ATTACHED=$?
       if [ $ATTACHED -eq 0 ]
         then
          echo "disk $VALUE is attached to $KEY"
       else
         gcloud compute instances attach-disk $KEY --disk=$VALUE --device-name=$VALUE --zone=us-central1-a
       fi  
    else
       continue  
    fi
    
done    



   
    