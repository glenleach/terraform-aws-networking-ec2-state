


```

# EKS Example

This directory contains a Terraform configuration example for provisioning an [Amazon Elastic Kubernetes Service (EKS)](https://aws.amazon.com/eks/) cluster on AWS. The example demonstrates how to use Terraform to automate the creation of a production-ready Kubernetes cluster, including supporting resources such as VPC, subnets, node groups, and IAM roles.

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

## Usage

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

   Edit `variables.tf` or create a `terraform.tfvars` file to override default values (e.g., region, cluster name, node group settings).

4. **Plan the deployment:**

   ```bash
   terraform plan
   ```

5. **Apply the configuration:**

   ```bash
   terraform apply
   ```

   Confirm the action when prompted.

6. **Configure kubectl (optional):**

   After the cluster is created, you can update your kubeconfig to access the cluster:

   ```bash
   aws eks --region <region> update-kubeconfig --name <cluster_name>
   ```

   Replace `<region>` and `<cluster_name>` with the output values from Terraform.

7. **Destroy the resources when finished:**

   ```bash
   terraform destroy
   ```

## Directory Structure

```
eks/
├── main.tf
├── variables.tf
├── outputs.tf
├── versions.tf
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


