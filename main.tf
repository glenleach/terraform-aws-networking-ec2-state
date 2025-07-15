# main.tf

provider "aws" {
  region = "us-east-1" # You can change this as needed
}

#########################
# 1. S3 Bucket
#########################

resource "aws_s3_bucket" "state_bucket" {
  bucket = "devops-bootcamp-tf-state-${random_id.bucket_suffix.hex}"
  acl    = "private"

  tags = {
    Name        = "Terraform State Bucket"
    Environment = "DevOps-Bootcamp"
  }
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

#########################
# 2. Security Group for EC2
#########################

resource "aws_security_group" "ec2_sg" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.myapp-vpc.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Use cautiously for demo purposes
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "EC2_SSH_SG"
  }
}

#########################
# 3. EC2 Instance
#########################

resource "aws_instance" "devops_instance" {
  ami                    = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI in us-east-1
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.myapp-subnet-1.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = var.key_pair_name

  tags = {
    Name = "DevOps Bootcamp EC2"
  }
}

#########################
# 4. IAM User with S3 & EC2 Access
#########################

resource "aws_iam_user" "automation_user" {
  name = "terraform-automation-user"
}

resource "aws_iam_access_key" "automation_key" {
  user = aws_iam_user.automation_user.name
}

resource "aws_iam_user_policy" "automation_policy" {
  name = "TerraformS3EC2Access"
  user = aws_iam_user.automation_user.name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ec2:*",
          "s3:*"
        ],
        Resource = "*"
      }
    ]
  })
}
