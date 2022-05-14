############################################################################################################
# Basic Variable Configuration                                                                             #
############################################################################################################
rds_engine = "postgres"

rds_prefixname = "pgking"

rds_instance_type = "db.t3.small"

rds_username = "sa" 

rds_password = "srds22w49hs1234"

rds_size = 55

rds_retention_period = 14

rds_backup_window = "02:00-03:00" //period for backup

rds_maintenance_window = "sun:03:00-sun:05:00" //period for maintenance

rds_skip_final_snapshot = false

############################################################################################################
# Advance Variable Configuration                                                                           #
############################################################################################################
