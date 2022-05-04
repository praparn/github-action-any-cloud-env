############################################################################################################
# Automatic Variable Generate by System  (Don't Touch this Area)                                           #
############################################################################################################
variable "vpc_id" {
    type = string
    description = "VPC ID (System AutoGenerate)"
}

variable "route53_zoneid" {
    type = string
    description = "Route53 Zone ID (System AutoGenerate)"
}

variable "subnet_public_1a" {
    type = string
    description = "Subnet ID for Public Zone 1A (System AutoGenerate)"
}

variable "subnet_public_1b" {
    type = string
    description = "Subnet ID for Public Zone 1B (System AutoGenerate)"
}

variable "subnet_public_1c" {
    type = string
    description = "Subnet ID for Public Zone 1C (System AutoGenerate)"
}

variable "subnet_private_1a" {
    type = string
    description = "Subnet ID for Private Zone 1A (System AutoGenerate)"
}

variable "subnet_private_1b" {
    type = string
    description = "Subnet ID for Private Zone 1B (System AutoGenerate)"
}

variable "subnet_private_1c" {
    type = string
    description = "Subnet ID for Private Zone 1C (System AutoGenerate)"
}

variable "rds_subnet_name" {
    type = string
    description = "Subnet RDS (System AutoGenerate)"
}

variable "cache_subnet_name" {
    type = string
    description = "Subnet RDS (System AutoGenerate)"
}