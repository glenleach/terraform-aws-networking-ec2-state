# main.tf

#########################
# 0. VPC and Subnet
#########################

resource "aws_vpc" "my-vpc" {
  cidr_block = var.cidr_blocks[0].cidr_block
  tags = {
    Name = var.cidr_blocks[0].name
  }
}

resource "aws_subnet" "my-subnet-1" {
  vpc_id            = aws_vpc.my-vpc.id
  cidr_block        = var.cidr_blocks[1].cidr_block
  availability_zone = var.avail_zone
  map_public_ip_on_launch = true
  tags = {
    Name = var.cidr_blocks[1].name
  }
}

#########################
# 1. Internet Gateway and Public Route Table
#########################

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = "MyApp-IGW"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.my-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
  tags = {
    Name = "MyApp-Public-RT"
  }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.my-subnet-1.id
  route_table_id = aws_route_table.public_rt.id
}

#########################
# 2. Security Group for EC2
#########################

resource "aws_security_group" "ec2_sg" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic (open to all, demo only)"
  vpc_id      = aws_vpc.my-vpc.id

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

resource "aws_security_group" "ssh_from_my_ip" {
  name        = "allow_ssh_from_my_ip"
  description = "Allow SSH inbound traffic from my public IP only"
  vpc_id      = aws_vpc.my-vpc.id

  ingress {
    description = "SSH from my public IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "EC2_SSH_MYIP_SG"
  }
}

#########################
# 3. EC2 Instance
#########################

data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "devops_instance" {
  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.my-subnet-1.id
  vpc_security_group_ids = [aws_security_group.ssh_from_my_ip.id]
  key_name               = var.key_pair_name
  associate_public_ip_address = true

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
