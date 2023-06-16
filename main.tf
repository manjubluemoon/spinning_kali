# Provider configuration
provider "aws" {
  region = var.region
}

# VPC resource
resource "aws_vpc" "kali_vpc" {
  cidr_block = var.vpc_cidr_block

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
  cidr_block = var.subnet_cidr_block
  availability_zone = var.availability_zone

  tags = {
    Name = "kali-subnet"
  }
}

# Attach Internet Gateway to VPC
resource "aws_vpc_attachment" "kali_igw_attachment" {
  vpc_id             = aws_vpc.kali_vpc.id
  internet_gateway_id = aws_internet_gateway.kali_igw.id
}

# Routing Table resource
resource "aws_route_table" "kali_route_table" {
  vpc_id = aws_vpc.kali_vpc.id

  tags = {
    Name = "kali-route-table"
  }
}

# Add Route to Routing Table
resource "aws_route" "kali_route" {
  route_table_id            = aws_route_table.kali_route_table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.kali_igw.id
}

# Associate Subnet with Routing Table
resource "aws_route_table_association" "kali_route_table_association" {
  subnet_id      = aws_subnet.kali_subnet.id
  route_table_id = aws_route_table.kali_route_table.id
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
  ami                    = var.ami_id
  instance_type          = "t2.micro"  # Update with your desired instance type
  key_name               = var.key_pair_name
  vpc_security_group_ids = [aws_security_group.kali_sg.id]
  subnet_id              = aws_subnet.kali_subnet.id
  associate_public_ip_address = true
  tags = {
    Name = "kali-instance"
  }
}

# Elastic IP Association resource
resource "aws_eip_association" "kali_eip_assoc" {
  instance_id   = aws_instance.kali_instance.id
  allocation_id = aws_eip.kali_eip.id
}


# Output the public IP address of the instance
output "public_ip" {
  value = aws_instance.kali_instance.public_ip
}
