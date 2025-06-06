


```
# Terraform Modules

This directory contains reusable [Terraform modules](https://www.terraform.io/language/modules) that can be shared across different Terraform configurations within this repository or in other projects. Modules help you organize and encapsulate infrastructure components, making your code more maintainable, scalable, and DRY (Don't Repeat Yourself).

## What is a Terraform Module?

A Terraform module is a collection of `.tf` files in a directory that defines a specific set of resources. Modules can be called from your root configuration to provision common infrastructure patterns (e.g., VPCs, EC2 instances, storage buckets) with customizable input variables.

## Directory Structure

```
modules/
├── <module-name>/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── README.md
├── ...
└── README.md
```

- Each subdirectory under `modules/` is a standalone module.
- Each module should have its own `README.md` describing its purpose, usage, and input/output variables.

## Using a Module

To use a module from this directory in your Terraform configuration, reference it with a relative path:

```hcl
module "example" {
  source = "../modules/<module-name>"
  # ...module input variables...
}
```

Replace `<module-name>` with the name of the module you want to use.

## Example

Suppose you have a module called `s3_bucket`:

```hcl
module "my_bucket" {
  source = "../modules/s3_bucket"
  bucket_name = "my-unique-bucket-name"
  versioning  = true
}
```

## Best Practices

- Keep modules focused on a single responsibility.
- Document all input variables and outputs in each module's README.
- Use semantic versioning if you plan to publish modules externally.

## Learning Resources

- [Terraform Modules Documentation](https://www.terraform.io/language/modules)
- [Terraform Registry](https://registry.terraform.io/)


