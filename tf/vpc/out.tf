output "vpc_id" {
    value = "${aws_vpc.k8s.id}"
    description = "VPC ID"
}

output "kops_s3_bucket" {
    value = "${var.kops_s3_bucket}"
    description = "FQDN of bucket"
}

output "vpc_cidr" {
    value = "${var.vpc_cidr}"
    description = "VPC Network CIDR"
}

output "k8s_cluster_name" {
    value = "${var.k8s_cluster_name}"
    description = "K8S Cluster Name"
}

output "zones" {
    value = "${var.zones}"
    description = "Availability Zones"
}

output "node_size" {
  value = "${var.node_size}"
  description = "Node Instance Type"
}

output "master_size" {
  value = "${var.master_size}"
  description = "Master Instance Type"
}


output "node_count" {
  value = "${var.node_count}"
}

//output "ssh_key_path" {
 // value = "${ssh_key_path}"
  //description = "SSH Public Key Path"
//}


//output "public_dns_zone_id" {
  //  value = "${aws_route53_zone.public.id}"
    //description = "DNS Zone ID"
//}

//output "private_dns_zone_id" {
  //  value = "${aws_route53_zone.private.id}"
  //  description = "DNS Zone ID"
//}
