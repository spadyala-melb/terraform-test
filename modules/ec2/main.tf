resource "aws_security_group" "allow-ssh-sg" {
  name        = "allow-ssh-sg"
  description = "Security group for EC2 instance"

  vpc_id = var.vpc_id

  ingress {
    from_port   = 22 # SSH port
    to_port     = 22 # SSH port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow access from any IP address
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "ec2-instance" {
  subnet_id                   = var.subnet_id
  ami                         = var.ami
  instance_type               = var.instance_type
  associate_public_ip_address = true
  key_name                    = "MyEc2Keypair"

  vpc_security_group_ids = [
    aws_security_group.allow-ssh-sg.id
  ]

  tags = {
    Name = var.instance_name
  }
}

