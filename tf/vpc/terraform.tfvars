tf_state_bucket     = "levsky-tf-state"
tf_state_bucket_key = "tf-vpc-k8s"
region              = "us-west-2"
vpc_name            = "k8s"
vpc_cidr            = "10.1.0.0/20"
kops_s3_bucket      = "levsky-kops-state"
k8s_cluster_name    = "levsky.k8s.local"
node_size           = "t3.medium"
master_size         = "t3.medium"
zones               = "us-west-2a,us-west-2b,us-west-2c"
node_count          = 3

//ssh_key_path        = "~/.ssh/id_rsa.kubernetes.pub"