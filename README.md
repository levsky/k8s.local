## k8s.local

###  This package helps:
- create VPC and Internet Gateway 
- provision HA k8s.local 3 node cluster   

Note: No external DNS domain registration needed

### Prerequisites
- terraform version - 0.10.8
- kops version - 1.15.0
- kubectl version - 1.16.3
- jq version - 1.5.1
- change every accurnce of 'levsky' to something else, e.g "my-f-cluster"

###  Cluster configuration:
```
- ./tf/vpc/terraform.tvars
```

### Provisioning steps:
1. Create terraform state backet
```
cd ./tf/state
terraform init
terraform plan
terraform apply
```
2. Create VPC
```
cd ./tf/vpc
terraform init
terraform plan
terraform apply
```
3. Create cluster
```
cd ./kops/
/bin/bash create_k8s_cluster.sh
```
4. Wait 10...15 minutes

5. Validate cluster
```
export CLUSTER_NAME="levsky.k8s.local"
export KOPS_STATE_STORE=s3://"levsky-kops-state"

kops validate cluster
```
### Create Bastion for SSH access
```
1. Add bastion instance group to cluster configuration
kops create instancegroup bastions --role Bastion \
--subnet utility-us-west-2a \
--name ${CLUSTER_NAME}  \
--edit="false" 
```
2. Create bastion host by updating cluster
```
kops update cluster ${CLUSTER_NAME} --yes
```
3. Wait 5...10 minutes, till "waiting good weather at see" add your key (in .bash_profile, .bashrc) 
```
ssh-add ~/.ssh/id_rsa > /dev/null 2>&1

```
4. Add forwarding in .ssh/config (first line)
```
ForwardAgent yes
```

5. Find bastion ELB SSH end-point
```
aws elb --output=table describe-load-balancers|grep DNSName.\*bastion|awk '{print $4}'
```
6. ssh to bastion host
```
ssh admin@bastion-***-k8s-local-***.us-west-2.elb.amazonaws.com
```
