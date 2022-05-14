############################################################################################################
# Basic Variable Configuration                                                                             #
############################################################################################################
variable "rds_prefixname" {
    type = string
    default = "rdstemplate-std"
    description = "RDS's prefix name. This will use to setup prefix name of database and concat with number of member in database. Ex: mysqlpayment01rds. (DatabaseName must begin with a letter and contain only alphanumeric characters)."
}

variable "rds_engine" {
    type = string
    default = "mysql"
    description = "RDS engine to create (Ref:https://docs.aws.amazon.com/cli/latest/reference/rds/create-db-instance.html)"
    validation {
    condition     = contains(["mysql", "mariadb", "postgres","sqlserver-ee","sqlserver-se","sqlserver-ex","sqlserver-web"], var.rds_engine)
    error_message = "RDS engine is incorrect. Allow vaule is should be (mysql, mariadb, postgres, sqlserver-ee, sqlserver-se, sqlserver-ex, sqlserver-web)."
    }
}

variable "rds_version" {
  type = map
  description = "RDS engine version. By default system will choose lastest version for each engine type for you. This can customize by check detail on AWS RDS"
  default = {
    "mysql"        = "8.0.28"
    "mariadb"      = "10.6.7"
    "postgres"     = "14.1"
    "sqlserver-ee" = "15.00.4073.23.v1"
    "sqlserver-se" = "15.00.4073.23.v1"
    "sqlserver-ex" = "15.00.4073.23.v1"
    "sqlserver-web" = "15.00.4073.23.v1"
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

variable "rds_size" {
    type = number
    default = 30
    description = "Sizing of database in GB (30 - 800 GB)"
    validation {
    condition     = var.rds_size >= 30 && var.rds_size <= 800 && floor(var.rds_size) == var.rds_size
    error_message = "Database size accept in range : 30-800 GB."
  }
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

variable "rds_skip_final_snapshot" {
    type = bool
    default = false
    description = "In case of RDS had been destroy. Do you want AWS to skip final snapshot before terminate? (true/false). Default we recommend to set false for create final snapshot for safety"
}

############################################################################################################
# Advance Variable Configuration                                                                             #
############################################################################################################


############################################################################################################
# Local Tag Description Variable                                                                           #
############################################################################################################
variable "tag_category" {
  type = string
  default = "Database"
  description = "Category of element to create on AWS for database element wil define value as 'database'"
}