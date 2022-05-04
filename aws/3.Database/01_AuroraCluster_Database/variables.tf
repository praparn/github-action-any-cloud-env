############################################################################################################
# Basic Variable Configuration                                                                             #
############################################################################################################
variable "rds_prefixname" {
    type = string
    default = "rdsaurora-std"
    description = "RDS's prefix name. This will use to setup prefix name of database and concat with number of member in database. Ex: aurorapayment-std-99. (DatabaseName must begin with a lower case letter and contain only alphanumeric characters)."
}

variable "rds_replicas" {
    type = number
    default = 1
    description = "Total number of replicas of member in database (1 - 3)"
    validation {
    condition     = var.rds_replicas >= 1 && var.rds_replicas <= 3 && floor(var.rds_replicas) == var.rds_replicas
    error_message = "Replicase number is accept in range : 1-3."
  }
}

variable "rds_instance_type" {
    type = string
    default = "db.t3.small"
    description = "Define RDS sizing for create database (Ref: https://aws.amazon.com/th/rds/instance-types/)"
    validation {
    condition     = contains(["db.t3.small", "db.t3.medium", "db.t3.large", "db.t4g.medium", "db.t4g.large", "db.r6g.large", "db.r6g.xlarge","db.r6g.2xlarge","db.m5d.large","db.m5d.xlarge","db.m5d.2xlarge"], var.rds_instance_type)
    error_message = "RDS type variable is incorrect. Allow vaule is should be (db.t3.small, db.t3.medium, db.t3.large, db.t4g.medium, db.t4g.large, db.r6g.large, db.r6g.xlarge,db.r6g.2xlarge,db.m5d.large,db.m5d.xlarge,db.m5d.2xlarge)."
    }
}

variable "rds_username" {
    type = string
    default = "sa"
    description = "RDS's username (aka: sa of database)"
}

variable "rds_password" {
    type = string
    default = "srds22w49hs1234"
    description = "RDS's password"
}

variable "rds_retention_period" {
    type = number
    default = 14
    description = "RDS number of backup retention day. RDS will enable backup by default. Select how many days for your retention periods."
    validation {
    condition     = var.rds_retention_period >= 1 && var.rds_retention_period <= 14 && floor(var.rds_retention_period) == var.rds_retention_period
    error_message = "Accepted retention perios is : 1-14."
  }
}

variable "rds_backup_window" {
    type = string
    default = "02:00-03:00"
    description = "RDS backup period time. During this maintenance period. RDS may slow response. Should be select period for less user operate"
    validation {
    condition     = contains(["01:00-02:00", "02:00-03:00", "03:00-04:00", "04:00-05:00", "05:00-06:00"], var.rds_backup_window)
    error_message = "RDS backup windows is incorrect. Allow vaule is should be (01:00-02:00, 02:00-03:00, 03:00-04:00, 04:00-05:00, 05:00-06:00)."
    }
}

variable "rds_maintenance_window" {
    type = string
    default = "sun:03:00-sun:05:00"
    description = "RDS maintenance period time. This will manage by AWS for upgrade version of fix some patch. We should setup period that database can schedule for downtime"
    validation {
    condition     = contains(["sat:02:00-sat:04:00", "sat:03:00-sat:05:00", "sun:02:00-sun:04:00", "sun:03:00-sun:05:00"], var.rds_maintenance_window)
    error_message = "RDS maintenance periods is incorrect. Allow vaule is should be (sat:02:00-sat:04:00, sat:03:00-sat:05:00, sun:02:00-sun:04:00, sun:03:00-sun:05:00)."
    }
}

variable "rds_public_access" {
    type = bool
    default = false
    description = "RDS's flag for public access or not (true/false). We strongly recommend for never open public access except you know risk and what are you try to do!!!"
}

variable "rds_skip_final_snapshot" {
    type = bool
    default = false
    description = "In case of RDS had been destroy. Do you want AWS to skip final snapshot before terminate? (true/false). Default we recommend to set false for create final snapshot for safety"
}

############################################################################################################
# Advance Variable Configuration                                                                             #
############################################################################################################
variable "rds_aurora_engine" {
    type = string
    default = "aurora-mysql"
    description = "Define Aurora engine type"
    validation {
    condition     = contains(["aurora", "aurora-mysql", "aurora-postgresql"], var.rds_aurora_engine)
    error_message = "Aurora engine type variable is incorrect. Allow vaule is should be (aurora, aurora-mysql, aurora-postgresql)."
    }
}

variable "rds_aurora_version" {
    type = string
    default = "2.10.2"
    description = "Define Database version (This depend on which engine that we select). Please reference on KB: (mysql: https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraMySQL.Updates.html) (postgresql: https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/AuroraPostgreSQL.Updates.html)"
    validation {
    condition     = contains(["2.10.2", "2.10.1", "2.10.0", "2.09.3", "2.09.2", "2.09.1", "2.09.0", "3.01.0", "3.01.1", "3.02.0", "13.6", "13.5", "13.4", "13.3", "13.3", "12.10"], var.rds_aurora_version)
    error_message = "Aurora engine version variable is incorrect. Allow vaule is should be (mysql: (2.10.2, 2.10.1, 2.10.0, 2.09.3, 2.09.2, 2.09.1, 2.09.0, 3.01.0, 3.01.1, 3.02.0), postgresql: (13.6, 13.5, 13.4, 13.3, 13.3, 12.10))."
    }
}

variable "rds_aurora_encrypt" {
    type = bool
    default = false
    description = "Flag for encryption Aurora database or not (true/false)"
}

############################################################################################################
# Local Tag Description Variable                                                                           #
############################################################################################################
variable "tag_category" {
  type = string
  default = "Database"
  description = "Category of element to create on AWS for database element wil define value as 'database'"
}