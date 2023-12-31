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
  default     = "ap-south-1a"
}

variable "ami_id" {
  description = "AMI ID for the Kali Linux instance"
  default     = "ami-0bc49507a10bfd74f"
}

variable "key_pair_name" {
  description = "Name of the SSH key pair"
  default     = "Kali Linux KP"
}

variable "SSH_PRIVATE_KEY" {
  description = "Private key for SSH access"
  type        = string
  default     = ""
}
