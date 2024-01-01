resource "aws_instance" "server_duplicated" {
  count = 3
  instance_type = var.instance_types[count.index]
  ami = "ami-0eb11ab33f229b26c"
  associate_public_ip_address = true

  root_block_device {
    delete_on_termination = true
    volume_size = 20
    volume_type = "gp2"
  }

  tags = {
    Name = "My Server ${count.index + 1}"
  }
}

resource "aws_instance" "server_foreach" {
  for_each = toset(var.servers_names)
  instance_type = "t3.small"
  ami = "ami-0eb11ab33f229b26c"
  associate_public_ip_address = true

  root_block_device {
    delete_on_termination = true
    volume_size = 20
    volume_type = "gp2"
  }

  tags = {
    Name = each.key
  }
}

resource "aws_instance" "server_mount_paths" {
  instance_type = "t3.small"
  ami = "ami-0eb11ab33f229b26c"
  associate_public_ip_address = true

  root_block_device {
    delete_on_termination = true
    volume_size = 20
    volume_type = "gp2"
  }

  dynamic "ebs_block_device" {
    for_each = toset(var.mount_paths)

    content {
      delete_on_termination = true
      volume_size = 8
      volume_type = "gp2"
      device_name = ebs_block_device.key
    }
  }

  tags = {
    Name = "My Server"
  }
}

resource "aws_instance" "servers_ternaire" {
  for_each = var.servers_dev
  instance_type = each.value ? "t3.micro" : "t3.small"
  ami = "ami-0eb11ab33f229b26c"
  associate_public_ip_address = true

  root_block_device {
    delete_on_termination = true
    volume_size = 8
    volume_type = "gp2"
  }

  tags = {
    Name = each.key
  }
}


output "public_ips_no_for" {
  value = aws_instance.server.*.public_ip
}

output "public_ips" {
  value = [
    for server in aws_instance.server_foreach: server.public_ip
  ]
}

output "dev_ip" {
  value = [for server in aws_instance.server_duplicated: server.instance_type == "t3.micro" ? server.public_ip : "NA"]
}