variable "region" {
  description = "AWS region"
  default     = "ap-south-1"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "CIDR block for the subnet"
  default     = "10.0.0.0/24"
}

variable "availability_zone" {
  description = "Availability zone for the subnet"
  default     = "us-east-1a"
}

variable "ami_id" {
  description = "AMI ID for the Kali Linux instance"
  default     = "kali-last-snapshot-amd64-2023.2.0-804fcc46-63fc-4eb6-85a1-50e66d6c7215ami-0bc49507a10bfd74f"
}

variable "key_pair_name" {
  description = "Name of the SSH key pair"
  default     = "kali-key"
}
