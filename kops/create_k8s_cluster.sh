#!/bin/bash

TF_OUTPUT=$(cd ../tf/vpc && terraform output -json)

NODE_COUNT="$(echo ${TF_OUTPUT}   | jq -r .node_count.value)"
ZONES="$(echo ${TF_OUTPUT}        | jq -r .zones.value)"
NODE_SIZE="$(echo ${TF_OUTPUT}    | jq -r .node_size.value)"
MASTER_SIZE="$(echo ${TF_OUTPUT}  | jq -r .master_size.value)"
BUCKET_NAME="$(echo ${TF_OUTPUT}  | jq -r .kops_s3_bucket.value)"
VPC_ID="$(echo ${TF_OUTPUT}       | jq -r .vpc_id.value)"
DNS_ZONE="$(echo ${TF_OUTPUT}     | jq -r .public_dns_zone_id.value)"
NETWORK_CIDR="$(echo ${TF_OUTPUT} | jq -r .vpc_cidr.value)"
CLUSTER_NAME="$(echo ${TF_OUTPUT} | jq -r .k8s_cluster_name.value)"

export CLUSTER_NAME="${CLUSTER_NAME}"
export KOPS_STATE_STORE="s3://${BUCKET_NAME}"

kops create cluster $CLUSTER_NAME \
  --node-count $NODE_COUNT \
  --zones $ZONES \
  --node-size $NODE_SIZE \
  --master-size $MASTER_SIZE \
  --master-zones $ZONES \
  --vpc $VPC_ID \
  --network-cidr $NETWORK_CIDR \
  --dns-zone $DNS_ZONE \
  --networking calico \
  --topology private \
  --yes

  #--bastion="true" \

TIME=$(date +%T)
echo -e "\n Cluster Launch Time: ${TIME} \n"
echo -e "To make your life easier export environment variables:\n"
echo -e "export CLUSTER_NAME=\"${CLUSTER_NAME}\""
echo -e "export KOPS_STATE_STORE=s3://\"${BUCKET_NAME}\""
