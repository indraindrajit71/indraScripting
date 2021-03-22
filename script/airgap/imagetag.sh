#!/bin/bash
cd 2.1.0
images=(
    mayadata/cluster-register:2.1.0.ee
    prom/prometheus:v1.7.1
    mayadataio/maya-init:v1.11.1
    mayadataio/cstorpoolauto:v1.11.10
    mayadata/dmaas-agent:2.1.0.ee
    mayadataio/dmaas-operator-amd64:v0.1.0-ee
    mayadataio/maya-fluentd:v1.11.20
    quay.io/coreos/kube-state-metrics:v1.5.0
    k8s.gcr.io/addon-resizer:1.8.3
    quay.io/coreos/kube-state-metrics:v1.5.0
    mayadata/maya-io-agent:2.1.0.ee
    mayadata/openebs-manager:2.1.0.ee
    mayadataio/openebs-upgrade:v1.11.28
    quay.io/prometheus/node-exporter:v0.18.1
    openebs/monitor-pv:0.2.0
    velero/velero:v1.4.0
    mayadata/status-agent:2.1.0.ee
    mayadata/upgrade-controller:2.1.0.ee
    openebs/velero-plugin:1.11.0
    velero/velero-plugin-for-aws:v1.1.0
    velero/velero-plugin-for-gcp:v1.1.0
    mayadataio/scope:v1.11.2293
    mysql:5.7
    gcr.io/google-samples/cassandra:v13
    gcr.io/google-samples/xtrabackup:1.0
    amazon/opendistro-for-elasticsearch:1.1.0
    alpine:3.6
    quay.io/cortexproject/distributor:master-590e72c6
    quay.io/cortexproject/ingester:master-590e72c6
    consul:0.7.1
    postgres:9.6
    memcached:1.4.25
    quay.io/cortexproject/querier:master-590e72c6
    quay.io/cortexproject/ruler:master-590e72c6
    quay.io/cortexproject/table-manager:master-590e72c6
    quay.io/kubernetes-ingress-controller/nginx-ingress-controller:0.27.1
    k8s.gcr.io/defaultbackend-amd64:1.5
    registry.mayadata.io/maya-kibana:2.1.0-ee
    registry.mayadata.io/maya-chatops:2.1.0-ee
    registry.mayadata.io/vendor:2.1.0-ee
    registry.mayadata.io/alertstore:2.1.0-ee
    registry.mayadata.io/alertstore-tablemanager:2.1.0-ee
    registry.mayadata.io/alertstore-tablemanager:2.1.0-ee
    registry.mayadata.io/cloud-agent:2.1.0-ee
    registry.mayadata.io/cortex-configs:2.1.0-ee
    registry.mayadata.io/maya-init:1.0.0
    registry.mayadata.io/maya-io-server:2.1.0-ee
    registry.mayadata.io/maya-ui:2.1.0-ee
    registry.mayadata.io/elasticsearch:2.1.0-ee
    registry.mayadata.io/graph-reporter:2.1.0-ee
    registry.mayadata.io/maya-grafana:2.1.0-ee
    registry.mayadata.io/maya-init:2.1.0-ee
    registry.mayadata.io/elastalert:2.1.0-ee
    registry.mayadata.io/cortex-alertmanager:2.1.0-ee
    registry.mayadata.io/curator:2.1.0-ee
    mayadataio/migrate-amd64:1.12.1-ee
    mayadataio/upgrade-amd64:1.12.1-ee
    mayadataio/moac:0.2.0-ee
    mayadataio/mayastor-grpc:0.2.0-ee
    mayadataio/mayastor:0.2.0-ee
    mayadataio/monitor-pv:0.2.0-ee
    mayadataio/node-disk-exporter-amd64:0.8.2-ee
    mayadataio/node-disk-operator-amd64:0.8.2-ee
    mayadataio/node-disk-manager-amd64:0.8.2-ee
    mayadataio/zfs-driver:0.9.0-ee
    mayadataio/cstor-webhook-amd64:2.1.0-ee
    mayadataio/cstor-pool-manager-amd64:2.1.0-ee
    mayadataio/cstor-volume-manager-amd64:2.1.0-ee
    mayadataio/cspc-operator-amd64:2.1.0-ee
    mayadataio/cvc-operator-amd64:2.1.0-ee
    mayadataio/cstor-csi-driver:2.1.0-ee
    mayadataio/snapshot-provisioner:2.1.0-ee
    mayadataio/snapshot-controller:2.1.0-ee
    mayadataio/openebs-k8s-provisioner:2.1.0-ee
    mayadataio/jiva:2.1.0-ee
    mayadataio/jiva-operator-amd64:2.1.0-ee
    mayadataio/jiva-csi:2.1.0-ee
    mayadataio/velero-plugin:2.1.0-ee
    mayadataio/provisioner-localpv:2.1.0-ee
    mayadataio/admission-server:2.1.0-ee
    mayadataio/m-upgrade:2.1.0-ee
    mayadataio/m-exporter:2.1.0-ee
    mayadataio/cstor-volume-mgmt:2.1.0-ee
    mayadataio/cstor-pool-mgmt:2.1.0-ee
    mayadataio/m-apiserver:2.1.0-ee
    mayadataio/cstor-istgt:2.1.0-ee
    mayadataio/cstor-pool:2.1.0-ee
    mayadataio/linux-utils:2.1.0-ee
    quay.io/k8scsi/csi-resizer:v0.4.0
    quay.io/k8scsi/csi-snapshotter:v2.0.1
    quay.io/k8scsi/snapshot-controller:v2.0.1
    quay.io/k8scsi/csi-provisioner:v1.6.0
    quay.io/k8scsi/csi-attacher:v2.0.0
    quay.io/k8scsi/csi-cluster-driver-registrar:v1.0.1
    quay.io/k8scsi/csi-attacher:v2.0.0
    quay.io/k8scsi/csi-cluster-driver-registrar:v1.0.1
    quay.io/k8scsi/csi-provisioner:v1.6.0
    quay.io/k8scsi/csi-resizer:v0.4.0
    quay.io/k8scsi/csi-snapshotter:v2.0.1
    quay.io/k8scsi/csi-node-driver-registrar:v1.0.1
)
for i in "${images[@]}"; do
    count=$(tr -dc '/' <<<"$i" | awk '{ print length; }')
    tmp=$(echo $i | cut -f"$(($count+1))" -d/)
    if [[ ! -z "$count" ]];then
    #tmp=$(echo $i | cut -f"$(($count+1))" -d/)
    docker load --input ./${tmp}.tar
    new_tag="$1/""${tmp}"

    docker tag  "${i}" "${new_tag}"

    else

    docker load --input ./${tmp}.tar

    new_tag="$1/""${tmp}"

    docker tag  "${i}" "${new_tag}"

    fi
done
