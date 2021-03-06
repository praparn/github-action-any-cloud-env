############################################################################################################
# Global Variable Configuration                                                                            #
############################################################################################################
region = "ap-southeast-1"

az1 = "ap-southeast-1a"

az2 = "ap-southeast-1b"

az3 = "ap-southeast-1c"

vpc_name = "template-vpc"

vpc_public = true

vpc_cidr = "10.200.0.0/16"

route53_name = "template.local"

subnet_private_1a_cidr = "10.200.10.0/24"

subnet_private_1b_cidr = "10.200.11.0/24"

subnet_private_1c_cidr = "10.200.12.0/24"

subnet_public_1a_cidr = "10.200.20.0/24"

subnet_public_1b_cidr = "10.200.21.0/24"

subnet_public_1c_cidr = "10.200.22.0/24"

cidr_block_rtb_private = "0.0.0.0/0"

cidr_block_rtb_public = "0.0.0.0/0"

vpn_gatewayenable = false

vpn_publicip = "0.0.0.0" //Transit Public IP Address

iampolicy_ec2 = "iampolicy-template-ec2"

iamrole_ec2 = "iamrole-template-ec2"

iaminstanceprofile_ec2 = "iaminstanceprofile-template-ec2"

############################################################################################################
# Global Tag Description Variable                                                                          #
############################################################################################################

tag_environment = "RD"

tag_region = "ap-southeast-1"

tag_budget = "Template"
