#!/bin/bash
#set -ex

NewNode()
{

NEWNODEKEY=$(kubectl get node | head -n $(($2+1)) | awk 'NR>1 {print $1}')
echo "Attaching Disk:$VALUE to NODE:$NEWNODEKEY"
gcloud compute instances attach-disk $NEWNODEKEY --disk=$VALUE --device-name=$VALUE --zone=us-central1-a
echo "Updating disk-list"
sed -i "s/$3/$NEWNODEKEY/g" /disk-list
echo "Updating configmap"
kubectl create configmap my-config --from-file=/disk-list
echo "TODO Patch the csi component"
}

IFS=$'\r\n' list=($(cat ./disk-list))
for node in $(seq ${#list[*]}); do
    COUNTER=0
    KEY=${list[$node-1]%%:*}
    VALUE=${list[$node-1]#*:}
    #KEY[$node-1]="${KEY[$node-1]}${KEY[$node-1]:+,}$VALUE"
    #printf "%s likes to %s.\n" "$KEY" "$VALUE"
    kubectl get node "$KEY"
    Node_PRESENT=$?
    if [[ "Ready"=~"$(kubectl get node "$KEY" | awk 'NR>1 {print $2}')" ]] #&& [ ]
       then
       echo "$KEY";
       #gcloud compute instances list --filter="$KEY" --project $PROJECT_NAME --format="value(disks[].deviceName)" | grep -o "$VALUE"
       ATTACHED=$?
       if [[ $ATTACHED -eq 0 ]]
         then
          echo "disk $VALUE is attached to $KEY"
       else
         gcloud compute instances attach-disk $KEY --disk=$VALUE --device-name=$VALUE --zone=us-central1-a
         echo "disk attaching"  
       fi
    elif [[ $Node_PRESENT -eq 0 ]]
     then
     COUNTER=$((COUNTER+1))
     NewNode $VALUE $COUNTER $KEY
    else
      continue  
    fi
    
done    



   
    