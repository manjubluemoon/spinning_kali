# Provider configuration
provider "aws" {
  region = "ap-south-1"  # Update with your desired region
}

# VPC resource
resource "aws_vpc" "kali_vpc" {
  cidr_block = "10.0.0.0/16"  # Update with your desired VPC CIDR block

  tags = {
    Name = "kali-vpc"
  }
}

# Internet Gateway resource
resource "aws_internet_gateway" "kali_igw" {
  vpc_id = aws_vpc.kali_vpc.id

  tags = {
    Name = "kali-igw"
  }
}

# Subnet resource
resource "aws_subnet" "kali_subnet" {
  vpc_id     = aws_vpc.kali_vpc.id
  cidr_block = "10.0.0.0/24"  # Update with your desired subnet CIDR block
  availability_zone = "ap-south-1"  # Update with your desired availability zone

  tags = {
    Name = "kali-subnet"
  }
}

# Security Group resource
resource "aws_security_group" "kali_sg" {
  name        = "kali-sg"
  description = "Kali security group"
  vpc_id      = aws_vpc.kali_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allowing SSH access from any IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Allowing outbound traffic to any IP
  }
}

# Elastic IP resource
resource "aws_eip" "kali_eip" {
  domain = "vpc"  # Specify the domain as "vpc" for a VPC-specific Elastic IP

  tags = {
    Name = "kali-eip"
  }
}


# EC2 Instance resource
resource "aws_instance" "kali_instance" {
  ami                    = "ami-0123456789abcdef"  # Replace with the correct Kali Linux AMI ID
  instance_type          = "t2.micro"  # Update with your desired instance type
  key_name               = "kali-key"  # Replace with the name of your key pair
  vpc_security_group_ids = [aws_security_group.kali_sg.id]
  subnet_id              = aws_subnet.kali_subnet.id
  associate_public_ip_address = true
  tags = {
    Name = "kali-instance"
  }
}

# Output the public IP address of the instance
output "public_ip" {
  value = aws_instance.kali_instance.public_ip
}
