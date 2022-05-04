############################################################################################################
# Basic Variable Configuration                                                                             #
############################################################################################################
instance_prefixname = "templatek8spublicmultiple-std"

instances_per_az = 1

server_type = "kubernetes"

instance_size = "non-prd-free"

volume_type_std = "gp3"

volume_size_boot_std = 10

instance_monitor = true

delete_on_termination = true

associate_public_ip_address = true