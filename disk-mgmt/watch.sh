#!/bin/bash
#set -ex

NewNode()
{

NEWNODEKEY=$(kubectl get node | head -n $(($2+1)) | awk 'NR>1 {print $1}')
echo "Attaching Disk:$VALUE to NODE:$NEWNODEKEY"
gcloud compute instances attach-disk $NEWNODEKEY --disk=$VALUE --device-name=$VALUE --zone=us-central1-c
echo "Updating disk-list"
sed -i -e"s/$3/$NEWNODEKEY/g" /new-disk-list
echo "Updating configmap"
kubectl create configmap my-config --from-file=/new-disk-list
echo " Patching the cspc component"
CSPC=
kubectl get cspc $4 -n openebs -o yaml | sed "/kubernetes.io\/hostname: $3/s/$3/$NEWNODEKEY/" | kubectl replace -f -

}
cp disk-list new-disk-list
IFS=$'\r\n' list=($(cat /new-disk-list))
for node in $(seq ${#list[*]}); do
    COUNTER=0
    KEY=${list[$node-1]%%:*}
    VALUE=${list[$node-1]#*:}
    DISK=${VALUE%%:*}
    CSPC=${VALUE#*:}
    #CSPC=${list[$node-1]#*:}
    #KEY[$node-1]="${KEY[$node-1]}${KEY[$node-1]:+,}$VALUE"
    #printf "%s likes to %s.\n" "$KEY" "$VALUE"
    kubectl get node "$KEY"
    Node_PRESENT=$?
    if [[ "Ready"=~"$(kubectl get node "$KEY" | awk 'NR>1 {print $2}')" ]] && [[ $Node_PRESENT -eq 0 ]]
       then
       echo "$KEY";
       gcloud compute instances list --filter="$KEY" --project $PROJECT_NAME --format="value(disks[].deviceName)" | grep -o "$DISK"
       ATTACHED=$?
       if [[ $ATTACHED -eq 0 ]]
         then
          echo "disk $DISK is attached to $KEY"
       else
         gcloud compute instances attach-disk $KEY --disk=$DISK --device-name=$DISK --zone=us-central1-c
         echo "disk attaching"  
       fi
    elif [[ $Node_PRESENT -ne 0 ]]
     then
     COUNTER=$((COUNTER+1))
     NewNode $DISK $COUNTER $KEY $CSPC
    else
      continue  
    fi
    
done    



   
    