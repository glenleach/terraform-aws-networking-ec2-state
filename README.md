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

## 🔑 Creating and Using an EC2 Key Pair

To SSH into your EC2 instance, you must have an EC2 key pair created in your AWS account and the private key file (.pem) downloaded and stored securely on your local machine.

### 1. Create a Key Pair (AWS Console)
- Go to the EC2 Dashboard in the AWS Console.
- In the left menu, click **Key Pairs** under **Network & Security**.
- Click **Create key pair**.
- Enter a name (e.g., `your-ec2-keypair-name`).
- Choose **RSA** for key type and **.pem** for file format.
- Click **Create key pair**. The `.pem` file will be downloaded automatically.
- Move the `.pem` file to a secure location on your computer (e.g., `~/.ssh/`).

### 2. Reference the Key Pair in Terraform
- Set the `key_pair_name` variable in your `terraform.tfvars` to the name you used above.

### 3. SSH into Your EC2 Instance
- After applying Terraform, get the public IP of your EC2 instance from the AWS Console or Terraform output.
- Run the following command (replace values as needed):

  ```sh
  ssh -i /path/to/your-ec2-keypair-name.pem ec2-user@<ec2-public-ip>
  ```
- Ensure the `.pem` file has correct permissions:
  ```sh
  chmod 400 /path/to/your-ec2-keypair-name.pem
  ```

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
allowed_ssh_ip = "203.0.113.0/32" # Replace with your public IP in CIDR notation
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

3. **Create an EC2 Key Pair**

   Follow the instructions in the **Creating and Using an EC2 Key Pair** section above.

4. **Initialize Terraform (First Time - S3 Bucket Not Yet Created)**

   ```sh
   terraform init
   terraform apply
   ```

   > 🪣 This initial run creates the S3 bucket used for the remote backend.

5. **Update Backend in `providers.tf`**

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

6. **Plan and Apply**

   ```sh
   terraform plan
   terraform apply
   ```

7. **Destroy Resources When Finished**

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
