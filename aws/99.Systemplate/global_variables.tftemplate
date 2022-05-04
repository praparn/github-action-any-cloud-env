############################################################################################################
# Global Variable                                                                                          #
############################################################################################################

variable "access_key" {
    type = string
    description = "AWS access key input"
}

variable "secret_key" {
    type = string
    description = "AWS secret key input"
}

variable "region" {
    type = string
    default    = "ap-southeast-1"
    description = "Region for housing AWS environment (Default:ap-southeast-1 ) (https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html)"
}

variable "az1" { 
    type = string
    default    = "ap-southeast-1a"
    description = "Datacenter for housing AWS environment. This depend on regional selective (Default:ap-southeast-1a ) (https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html)"
}

variable "az2" {
    type = string
    default    = "ap-southeast-1b"
    description = "Datacenter for housing AWS environment. This depend on regional selective (Default:ap-southeast-1a ) (https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html)"
}

variable "az3" {
    type = string
    default    = "ap-southeast-1c"
    description = "Datacenter for housing AWS environment. This depend on regional selective (Default:ap-southeast-1a ) (https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html)"
}

variable "vpc_name" {
    type = string
    default    = "template-vpc"
    description = "Name of VPC (Virtual Private Cloud)"
}

variable "vpc_cidr" {
    type = string
    default = "10.200.0.0/16"
    description = "Network CIDR on VPC (The CIDR block size must have a size between /16 and /28 and Assign private ip as RFC1918)"
}

variable "vpc_public" {
    type = bool
    default = "true"
    description = "VPC is need to have public subnet or not (true/false). If this set to false. If will never create internet gateway/nat gateway/public subnet"
}

variable "route53_name" {
    type = string
    default = "template.local"
    description = "DNS (Route53) domain name for use as internal dns"
}

variable "subnet_private_1a_cidr" {
    type = string
    default = "10.200.10.0/24"
    description = "Network CIDR on Private Subnet Datacenter 1A (This network CIDR need to sub-range of vpc_cidr)"
}

variable "subnet_private_1b_cidr" {
    type = string
    default = "10.200.11.0/24"
    description = "Network CIDR on Private Subnet Datacenter 1B (This network CIDR need to sub-range of vpc_cidr)"
}

variable "subnet_private_1c_cidr" {
    type = string
    default = "10.200.12.0/24"
    description = "Network CIDR on Private Subnet Datacenter 1C (This network CIDR need to sub-range of vpc_cidr)"
}

variable "subnet_public_1a_cidr" {
    type = string
    default = "10.200.20.0/24"
    description = "Network CIDR on Private Subnet Datacenter 1A (This network CIDR need to sub-range of vpc_cidr)"
}

variable "subnet_public_1b_cidr" {
    type = string
    default = "10.200.21.0/24"
    description = "Network CIDR on Private Subnet Datacenter 1B (This network CIDR need to sub-range of vpc_cidr)"
}

variable "subnet_public_1c_cidr" {
    type = string
    default = "10.200.22.0/24"
    description = "Network CIDR on Private Subnet Datacenter 1C (This network CIDR need to sub-range of vpc_cidr)"
}

variable "cidr_block_rtb_private" {
    type = string
    default = "0.0.0.0/0"
    description = "Network route for default internet gateway (nat gateway) on private subnet"
}

variable "cidr_block_rtb_public" {
    type = string
    default = "0.0.0.0/0"
    description = "Network route for default internet gateway (internet gateway) on private subnet"
}

variable "vpn_gatewayenable" {
    type = bool
    default = false
    description = "Need to create VGW (virtual private gateway) to establish vpn site-to-site from VPC to other side or not ? (true/false)"
}

variable "vpn_publicip" {
    type = string
    default = "0.0.0.0"
    description = "Public ip address of participate gateway for create vpn site-to-site"
}

variable "iampolicy_ec2" {
    type = string
    default = "iampolicy-template-ec2"
    description = "Default IAM policy name for instance (EC2)"
}

variable "iamrole_ec2" {
    type = string
    default = "iamrole-template-ec2"
    description = "Default IAM Role name for instance (EC2)"
}

variable "iaminstanceprofile_ec2" {
    type = string
    default = "iaminstanceprofile-template-ec2"
    description = "Default instance profile for instance (EC2)"
}

############################################################################################################
# Global Tag Description Variable                                                                          #
############################################################################################################
# This session is use to input description "Tag" on each element on AWS for categories and budget explorer #
############################################################################################################

variable "tag_environment" {
    type = string
    default = "RD"
    description = "Environment of AWS categories (RD, DEV, SIT, UAT, STAGING, MOT, PRD, DR, OTHER)"
}

variable "tag_region" {
    type = string
    default = "Singapore"
    description = "Regional to housing environment (https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html)"
}

variable "tag_budget"{
    type = string
    default = "Template"
    description = "Categories of project name/department etc. This purpose for explore billing and charge back on each BU/Project"
}