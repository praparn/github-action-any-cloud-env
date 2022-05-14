############################################################################################################
# Basic Variable Configuration                                                                             #
############################################################################################################
variable "s3_name" {
    type = string
    default = "QWSAEEDREDWERDWERDWER"
    description = "S3 bucket name (3 - 63 character). Please check reference (https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html)"

}

variable "s3_acl" {
    type = string
    default = "private"
    description = "Define access control list (acl) for operate with S3. Strongly recommend to operate as private"
    validation {
    condition     = contains(["private", "public-read", "public-read-write", "aws-exec-read", "authenticated-read", "log-delivery-write"], var.s3_acl)
    error_message = "S3 acl variable is incorrect. Allow vaule is should be (private, public-read, public-read-write, aws-exec-read, authenticated-read, and log-delivery-write)."
    }
}

variable "s3_acceleration" {
    type = string
    default = "Enabled"
    description = "Enable S3 acceleration for guide faster geolocation (Ref:https://docs.aws.amazon.com/AmazonS3/latest/userguide/transfer-acceleration.html)"
    validation {
    condition     = contains(["Enabled", "Suspended"], var.s3_acceleration)
    error_message = "S3 acceleration is incorrect (Enabled, Suspended)."
    }
}

############################################################################################################
# Local Tag Description Variable                                                                           #
############################################################################################################
variable "tag_category" {
  type = string
  default = "bucket"
  description = "Category of element to create on AWS for bucket element wil define value as 'bucket'"
}