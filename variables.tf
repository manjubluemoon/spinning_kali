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
  default     = "kali-key"
}

variable "SSH_PRIVATE_KEY" {
  description = "Private key for SSH access"
  type        = string
  default     = <<EOT-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAnytwLIsw6F3vje43ZbCipSm1Z230hHrPKavoDP0X1sKJ4zby
C4J01HMUMl6fdKNtgIlaUJ+mKuyE80BidHzSTRTs139Q2R8ja3vvtXbtzv/QD4rD
JhHyvI4XfWT+BCgeffqlbWv6K2PdaSH5MgwM3Tss98cgT7FYe5Qp4TCHoMXOzCee
MC6EFWLQs9bRRCA+Av6qu5fBeaYlqIH6uNLjfpgv5b6ahmHH3hW+/btOo4f5GNI8
tJjGf8EsvZsM2N0easvoB7SZk+b6irDDQNnIg/3MmaZpGPjuGbkcgdWWAcB2Y7nH
/B0+YjLBhpYlAH95YFrEHuHfTovvpMOZozMUuQIDAQABAoIBAEgCLdhpDDJDtQmf
2L4PoDVaXjAxpWp96NTwaaXepndJQXpitDQSy+oFOgDjn/3zpal9+jb5UwKeSDOI
UEJk6ftnWRLRDXF8zdhllHejG0kHoEg3vbuuaQN2wRfApc6Zm9ngmBCdxer1Xgif
Dw7eNr+rcteR5YNIN0CJMj0naGSKAeX/mnfvH9w2wIit+2maMXFnGmecl5FV7Xpk
gV8LiHtgU9o69gQ/bLx3T+kCuKpAs8O3vuG34k8lUB3MGjNBAEq0Cm6UCJ3IosZr
jGNM0s0bobZ5uplE6Ip1qxNjh5T5sO0W5UHxqlzz1SdK1jrEikBaW/3vXNyVbX3Z
FXVrwSUCgYEA1d95AiUv2Nn9+n4Sk+Vo+f3Oq2Oh+UICnFHnx6Gad5B3Mh3ONAyt
ne0tcB25y2+86R3wZ1jhV+RUixE2PpSFwOSvREc7tLb8xtCbd9q+sNqaVgXuuDRo
J4D/Uc52KCq9gFUmhehg5nGk3j9L5AGGqJLWSw15PsWB9ywJBi0/QasCgYEAvoWO
wN0kKTi6roOgcN5uFtKpxPgcMd4w9c8WFlwFD1YNueJe1OGQB3lAjEefEP702AsD
7xfg4HE0oq7ELkuRBVXKiM6r9utBHFPKB894Ey5YYNN+5vYQICG1Ptl6xjm1YeBD
GADV9YCvlAFgtRRlUJVjjkeyznzhGEuinyW2JysCgYEAoX4C03nc7TN9sb2srXxW
jh32BjhPP/V2Hy9Bgt4l0w6E0pTq9SZ1moBTBQuNFW4kCSqQMplMXp+Mrw2qFgr0
DDkhlr7q+IQLztwJ6LCFuOj4DOih3vnDg8DGCbGKSr4rJVImqopTUO6S/TZySZJV
acimgzmDScC9aDQaBE36K80CgYAfwctlwnbAmEAlzrLznV/kVgEOX/zzIwIuNvKL
j5MYV1O6ZE1CVsbXOBLWTynof1b4m/1v4R8Oyk/nvhHdVaM6rG4yF6D6a4RS4HSQ
kLiHGfaJTTed7+4ILRY0/7NDT2M4iVUlrx366hRaK1CfXmL057HMiY74dEBg+FqH
BJY0OQKBgQC51+LMfmK9qXF1GhgYeM07zUXHCg0btDxKXJBthYWRpXgSdyBaBeop
imJew0c1i9YHMZoryQ18XvbFReCOaSCWrtqKYr5oOVsSKCsm7cD+9r3NUNonb3Vy
4gnV+ZHXlNxgyGoJ0B2OM51fiSqOqk+jFauF8qXkbMaqBtXTomsfzg==
-----END RSA PRIVATE KEY-----EOT
}
