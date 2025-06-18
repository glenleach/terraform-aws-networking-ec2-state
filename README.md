
# Demo App – DevOps Bootcamp Training (TechWorld with Nana)
This repository is part of the DevOps Bootcamp from TechWorld with Nana.


```

# EKS Terraform Project

This repository provides a modular and extensible Terraform configuration for deploying an Amazon EKS (Elastic Kubernetes Service) cluster on AWS. It includes all necessary infrastructure components such as VPC, subnets, IAM roles, and optional KMS encryption.

---

## Features

- Creates a new VPC with public and private subnets
- Provisions an EKS cluster and managed node group(s)
- Configures necessary IAM roles and policies
- Outputs cluster information for use with `kubectl`

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) v0.12 or higher
- [AWS CLI](https://aws.amazon.com/cli/) configured with appropriate credentials
- AWS account with permissions to create EKS, VPC, IAM, and related resources
- [kubectl](https://kubernetes.io/docs/tasks/tools/) (optional, for cluster access)

---

### Required Files for EKS Deployment

To successfully deploy an EKS cluster, ensure your project contains the following files:

- **eks-cluster.tf**  
  Orchestrates the overall infrastructure and references modules/resources.

- **providers.tf**  
  Defines all required and optional providers.

- **vpc.tf**  
  Contains the VPC, subnet, and related networking resources.

- **terraform.tfvars**  
  Provides values for the variables defined in `variables.tf`.  
  _Note: This file is user-specific and should **not** be committed to version control._

- **variables.tf**  
  Defines the input variables used throughout the configuration.


**Note:**  
You may also need provider configuration (commonly in `providers.tf`) and backend configuration for remote state (e.g., `backend.tf`).

---
### Installation

1. **Clone the repository and navigate to the EKS example:**

   ```bash
   git clone https://github.com/glenleach/terraform-learn.git
   cd terraform-learn/eks
   ```

2. **Initialize Terraform:**

   ```bash
   terraform init
   ```

3. **Review and customize variables:**

   Edit or create a `terraform.tfvars` file to override default values. For example:

```hcl
vpc_cidr_block            = "10.0.0.0/16"
private_subnet_cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
public_subnet_cidr_blocks  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
```
1. **Set the AWS region in your `vpc.tf` file.**  
   For example:

   ```hcl
   region = "eu-west-1"

2. **Plan the deployment:**

   ```bash
   terraform plan
   ```

3. **Apply the configuration:**

   ```bash
   terraform apply
   ```

   Confirm the action when prompted.

4. **Configure kubectl (optional):**

   After the cluster is created, you can update your kubeconfig to access the cluster:

   ```bash
   aws eks --region <region> update-kubeconfig --name <cluster_name>
   ```

   Replace `<region>` and `<cluster_name>` with the output values from Terraform.

5. **Destroy the resources when finished:**

   ```bash
   terraform destroy
   ```

## Directory Structure

```
terraform-learn/
├── eks-cluster.tf
├── providers.tf
├──terraform.tfvars
├── vpc.tf
├── README.md
└── (other supporting files)
```

## Notes

- This example is for educational and demonstration purposes. Review and adjust resource settings before using in production.
- Resource creation may incur AWS charges. Remember to destroy resources when no longer needed.

## References

- [Terraform AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Amazon EKS Documentation](https://docs.aws.amazon.com/eks/latest/userguide/what-is-eks.html)
- [Terraform EKS Module](https://github.com/terraform-aws-modules/terraform-aws-eks)

```


