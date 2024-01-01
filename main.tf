provider "aws" {
  region = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_instance" "server" {
  instance_type = "t3.small"
  ami = "ami-0eb11ab33f229b26c"
  associate_public_ip_address = true

  root_block_device {
    delete_on_termination = true
    volume_size = 20
    volume_type = "gp2"
  }

  tags = {
    Name = "My Server"
  }
}

output "public_ip" {
  value = aws_instance.server.public_ip
}

output "security_groups" {
  value = aws_instance.server.security_groups
}
