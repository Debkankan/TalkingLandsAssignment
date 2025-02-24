provider "aws" {
  region = var.region
}

# Security group for allowing HTTP and SSH access
resource "aws_security_group" "allow_ssh_http_ipv4" {
  name        = "allow_ssh_http"
  description = "Allow TLS inbound traffic and all outbound traffic"

  tags = {
    Name = "allow_ssh_http"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.allow_ssh_http_ipv4.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.allow_ssh_http_ipv4.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_ssh_http_ipv4.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

# Launch an EC2 instance
resource "aws_instance" "nginx" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = [aws_security_group.allow_ssh_http_ipv4.name]

  tags = {
    Name = "${var.environment}-nginx"
  }

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y nginx
              echo "Deployed via Terraform" > /var/www/html/index.html
              systemctl enable nginx
              systemctl start nginx
              EOF
}
