

  # Terraform Automation Example – DevOps Bootcamp

This repository contains a simple Terraform configuration used in the [TechWorld with Nana DevOps Bootcamp](https://gitlab.com/twn-devops-bootcamp/latest/14-automation-with-python/terraform). It demonstrates how to provision AWS infrastructure using Terraform, and is designed to be used alongside automation scripts (e.g., with Python and the AWS CLI).

---

## Overview

The provided Terraform code provisions the following AWS resources:

- An **S3 bucket** for storing files or state.
- An **EC2 instance** with a security group allowing SSH access.
- An **IAM user** with programmatic access and an attached policy for S3 and EC2 management.

This setup is ideal for learning infrastructure automation and integrating Terraform with Python scripts.

---

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) v0.12 or higher
- [AWS CLI](https://aws.amazon.com/cli/) configured with appropriate credentials
- An AWS account with permissions to create S3, EC2, and IAM resources

---


---

## Usage

1. **Clone the repository:**

   ```bash
   git clone <your-repo-url>
   cd <repo-directory>
   ```

2. **Initialize Terraform:**

   ```bash
   terraform init
   ```

3. **Review and customize variables:**

   Edit the `main.tf` file to change resource names, regions, or other parameters as needed.

4. **Plan the deployment:**

   ```bash
   terraform plan
   ```

5. **Apply the configuration:**

   ```bash
   terraform apply
   ```

   Confirm the action when prompted.

6. **Destroy resources when finished:**

   ```bash
   terraform destroy
   ```

---


## Example Resources Created

- **S3 Bucket:**  
  Used for storing files or Terraform state.

- **EC2 Instance:**  
  A basic instance with SSH access enabled via a security group.

- **IAM User:**  
  Created for automation purposes, with access keys and permissions for S3 and EC2.

---

## Directory Structure

```
.
├── main.tf
└── README.md
└── providers.tf

```

---

## Notes

- This example is for educational and demonstration purposes. **Do not use in production without reviewing and securing resources.**
- Resource creation may incur AWS charges. Remember to destroy resources when no longer needed.
- For automation with Python, you can use the generated IAM user's credentials in your scripts.

---

## References

- [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [AWS CLI Documentation](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html)
- [TechWorld with Nana DevOps Bootcamp](https://www.techworld-with-nana.com/devops-bootcamp)

```
