


```

# Terraform Learn

This repository is a collection of Terraform configuration examples and exercises designed to help you learn and practice Infrastructure as Code (IaC) using [Terraform](https://www.terraform.io/). It is intended for beginners and intermediate users who want hands-on experience with Terraform concepts, modules, and workflows.

## Features

- Example Terraform configurations for various cloud providers (e.g., AWS, Azure, GCP)
- Step-by-step exercises to reinforce learning
- Modular and reusable code structure
- Best practices for writing and organizing Terraform code

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) (version 0.12 or higher recommended)
- An account with your chosen cloud provider (e.g., AWS, Azure, GCP)
- [Git](https://git-scm.com/)
- Basic command-line knowledge

## Getting Started

1. **Clone the Repository**

   ```bash
   git clone https://github.com/glenleach/terraform-learn.git
   cd terraform-learn
   ```

2. **Initialize Terraform**

   Navigate to the example or module you want to try, then run:

   ```bash
   terraform init
   ```

3. **Customize Variables**

   Edit the `variables.tf` or create a `terraform.tfvars` file to set your own values.

4. **Plan and Apply**

   ```bash
   terraform plan
   terraform apply
   ```

   *Review the planned actions and confirm to provision the infrastructure.*

5. **Destroy Resources**

   When finished, clean up your resources:

   ```bash
   terraform destroy
   ```

## Repository Structure

```
terraform-learn/
├── aws/
│   ├── basic-instance/
│   ├── vpc/
│   └── ...
├── azure/
│   └── ...
├── gcp/
│   └── ...
├── modules/
│   └── ...
├── examples/
│   └── ...
├── README.md
└── ...
```

- **aws/**, **azure/**, **gcp/**: Provider-specific examples and exercises
- **modules/**: Reusable Terraform modules
- **examples/**: General-purpose or cross-provider examples

## Learning Resources

- [Terraform Official Documentation](https://www.terraform.io/docs/)
- [Terraform Getting Started Guide](https://learn.hashicorp.com/terraform)
- [Terraform Registry](https://registry.terraform.io/)



