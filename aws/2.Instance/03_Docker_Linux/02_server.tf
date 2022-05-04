resource "aws_instance" "ec2" {
  count                  = var.instances
  ami                    = lookup(var.ami, var.server_type)
  instance_type          = lookup(var.instance_type, var.instance_size)
  availability_zone      = var.az1
  monitoring             = var.instance_monitor
  key_name               = "${var.vpc_name}-keypair"
  subnet_id              = var.subnet_private_1a
  vpc_security_group_ids = [aws_security_group.instance_secgroup.id]
  associate_public_ip_address = var.associate_public_ip_address
  user_data = <<-EOF
                              #!/bin/bash
                              curl https://raw.githubusercontent.com/praparn/sourcesetup/master/standard_docker_201012.sh > /tmp/setup.sh
                              chmod +x /tmp/setup.sh
                              /tmp/setup.sh
                              EOF
  root_block_device {
    volume_type           = var.volume_type_std
    volume_size           = var.volume_size_boot_std
    delete_on_termination = var.delete_on_termination
  }
  tags = {
      Name = "${var.instance_prefixname}-${count.index+1}"
      Environment = var.tag_environment
      Region      = var.tag_region
      Budget      = var.tag_budget
      Categories  = var.tag_category
  }
}