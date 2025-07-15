# Terraform Automation Example – DevOps Bootcamp

This repository contains a simple Terraform configuration used in the **TechWorld with Nana DevOps Bootcamp**. It demonstrates how to provision AWS infrastructure using Terraform and is designed to integrate with automation scripts (e.g., Python and the AWS CLI).

---

## 🚀 Overview

The provided Terraform code provisions the following AWS resources:

- **S3 Bucket** for storing files or the Terraform remote state
- **EC2 Instance** with a security group allowing SSH access
- **IAM User** with programmatic access and a policy for S3 and EC2 management
- **VPC and Subnet** with user-defined CIDR blocks and tagging

This setup is ideal for learning infrastructure automation and integrating Terraform with scripting.

---

## ✅ Prerequisites

- Terraform v0.12 or higher
- AWS CLI installed and configured
- AWS account with permissions to create:
  - S3 buckets
  - EC2 instances
  - IAM resources
  - VPC and subnets
- A valid EC2 Key Pair in the selected AWS region

---

## 📂 Directory Structure

```
.
├── main.tf            # Main infrastructure configuration
├── providers.tf       # AWS provider and backend config
├── variables.tf       # Variable declarations
├── terraform.tfvars   # Input values (you create this)
└── README.md          # Documentation
```

---

## 🔧 Example `terraform.tfvars`

```hcl
cidr_blocks = [
  {
    cidr_block = "10.0.0.0/16"
    name       = "my-vpc"
  },
  {
    cidr_block = "10.0.1.0/24"
    name       = "my-subnet"
  }
]

avail_zone    = "us-east-1a"
key_pair_name = "your-ec2-keypair-name"
```

---

## 🛠️ Usage Steps

1. **Clone the Repository**

   ```sh
   git clone <your-repo-url>
   cd <repo-directory>
   ```

2. **Set Up Your `terraform.tfvars` File**

   Create and fill in the file as shown above.

3. **Initialize Terraform (First Time - S3 Bucket Not Yet Created)**

   ```sh
   terraform init
   terraform apply
   ```

   > 🪣 This initial run creates the S3 bucket used for the remote backend.

4. **Update Backend in `providers.tf`**

   After the bucket is created, update your `providers.tf` like this:

   ```hcl
   terraform {
     backend "s3" {
       bucket = "devops-bootcamp-tf-state-<your-bucket-id>" # Use the name from Terraform output
       key    = "terraform.tfstate"
       region = "us-east-1"
     }
   }
   ```

   Then re-initialize with:

   ```sh
   terraform init -reconfigure
   ```

5. **Plan and Apply**

   ```sh
   terraform plan
   terraform apply
   ```

6. **Destroy Resources When Finished**

   ```sh
   terraform destroy
   ```

---

## 📘 Example Resources Created

- **S3 Bucket:** Stores Terraform state or files
- **EC2 Instance:** Amazon Linux 2 with SSH access
- **IAM User:** Programmatic access to EC2 and S3
- **VPC/Subnet:** Basic networking setup with user-defined CIDR blocks

---

## ⚠️ Notes

- This example is intended for educational purposes only. Do not use in production without reviewing all settings and securing sensitive data.
- Resource creation may incur AWS charges. Be sure to destroy all resources when you're done.
- For automation with Python, use the access keys from the created IAM user.

---

## 📚 References

- [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AWS CLI Documentation](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html)
- TechWorld with Nana – DevOps Bootcamp

---

## 📄 License

© TechWorld with Nana. All rights reserved.

This project is provided for personal training and educational purposes only. No part of this project may be reproduced, distributed, or transmitted in any form or by any means, including photocopying, recording, or other electronic or mechanical methods, without prior written permission of the copyright owner.
