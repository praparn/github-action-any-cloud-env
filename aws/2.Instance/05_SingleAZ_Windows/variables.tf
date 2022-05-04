############################################################################################################
# Local Variable Configuration                                                                             #
############################################################################################################
variable "instance_prefixname" {
  type = string
  default = "EC2InstanceTemplate-std"
  description = "Instance's prefix name. This will use to setup prefix name of instance and concat with number of instance. Ex: apache-std-99"
}

variable "instances" {
  type = number
  default = 1
  description = "Total number of instance to create on this task (1 - 20). In case you need to create with huge number. AWS will have service quota by default. So please check on KB: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-resource-limits.html before operate"
  validation {
    condition     = var.instances >= 1 && var.instances <= 10 && floor(var.instances) == var.instances
    error_message = "Instances number is accept in range : 1-10."
  }
}

variable "instance_monitor" {
  type = bool
  default = true
  description = "Flag for turnon monitoring for instance (true/false)"
}

variable "delete_on_termination" {
  type = bool
  default = true
  description = "Flag for delete ebs disk when terminate instance or not (true/false)"
}

variable "server_type" {
  type = string
  default = "stdlinux"
  description = "Define instance type for selective AMI to operate. This will be check map vaule with variable 'ami' again"
  validation {
    condition     = contains(["stdlinux", "docker", "kubernetes", "windows", "other"], var.server_type)
    error_message = "Server type variable is incorrect. Allow vaule is should be (stdlinux, docker, kubernetes, windows, other)."
  } 
}

variable "ami" {
  type = map
  description = "AMI image id for reference to create instance (Template will use ubuntu base as default)"
  default = {
    "stdlinux"   = "ami-04d9e855d716f9c99" //Ubuntu Server 22.04 LTS (HVM)
    "docker"     = "ami-01581ffba3821cdf3" //Ubuntu Server 20.04 LTS (HVM)
    "kubernetes" = "ami-01581ffba3821cdf3" //Ubuntu Server 20.04 LTS (HVM)
    "windows"    = "ami-0d04ad531fe42fe59" //Windows_Server-2019-English-Full-Base-2022.04.13
    "other"      = "ami-04d9e855d716f9c99" //Ubuntu Server 22.04 LTS (HVM)
  }
}

variable "instance_size" {
  type = string
  default = "non-prd-free"
  description = "Define instance sizing profiling for create instance. This will be check map vaule with variable 'instance_type' again"
  validation {
    condition     = contains(["non-prd-free", "non-prd-tiny", "non-prd-small", "non-prd-std", "non-prd-large", "prd-std", "prd-mega", "prd-extreme"], var.instance_size)
    error_message = "Server type variable is incorrect. Allow vaule is should be (non-prd-free, non-prd-tiny, non-prd-small, non-prd-std, non-prd-large, prd-std, prd-mega, prd-extreme)."
  } 
}

variable "instance_type" {
  type = map
  description = "Instance type of EC2 for create. (Template will consideration only non-prd and prd environment with AMD processor for cost saving. You can adjust this as required)(Ref: https://aws.amazon.com/th/ec2/instance-types/)"
  default = {
    "non-prd-free"  = "t2.micro"
    "non-prd-tiny"  = "t3a.micro"
    "non-prd-small" = "t3a.small"
    "non-prd-std"   = "t3a.medium"
    "non-prd-large" = "t3a.large"
    "prd-std"       = "m6a.large"
    "prd-mega"      = "m6a.xlarge"
    "prd-extreme"   = "m6a.2xlarge"
  }
}

variable "associate_public_ip_address" {
  type = bool
  default = false
  description = "Need to assign public ip address (ENI) for this instance or not. Please note this vaule is relate subnet define on EC2 need to change from private to public also. For do this is not well architecture and need to adjust subnet by yourself."
}

variable "volume_type_std" {
  type = string
  default = "gp3"
  description = "Instance volume type (EBS). The template will try to select fastest volume (gp3). Ref:(https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-volume-types.html)"
}

variable "volume_size_boot_std" {
  type = number
  default = 10
  description = "Sizing of volume when create with instance (GB)"
  validation {
    condition     = var.volume_size_boot_std >= 30 && var.volume_size_boot_std <= 800 && floor(var.volume_size_boot_std) == var.volume_size_boot_std
    error_message = "Accepted disk size is : 30-800."
  }
}

############################################################################################################
# Local Tag Description Variable                                                                           #
############################################################################################################
variable "tag_category" {
  type = string
  default = "Instance"
  description = "Category of element to create on AWS for instance element wil define value as 'instance'"
}