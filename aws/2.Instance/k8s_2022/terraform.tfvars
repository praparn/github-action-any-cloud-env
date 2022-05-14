############################################################################################################
# Basic Variable Configuration                                                                             #
############################################################################################################
instance_prefixname = "k8spraparn_2022"

instances_per_az = 1

server_type = "kubernetes"

instance_size = "non-prd-large"

volume_type_std = "gp3"

volume_size_boot_std = 30

instance_monitor = true

delete_on_termination = true

associate_public_ip_address = true