############################################################################################################
# Basic Variable Configuration                                                                             #
############################################################################################################
instance_prefixname = "templatedocker-std"

instances = 1

server_type = "docker"

instance_size = "non-prd-free"

volume_type_std = "gp3"

volume_size_boot_std = 10

instance_monitor = true

delete_on_termination = true

associate_public_ip_address = false