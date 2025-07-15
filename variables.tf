variable "cidr_blocks" {
  type = list(object({
    cidr_block = string
    name       = string
  }))
}

variable "avail_zone" {
  type = string
}

variable "key_pair_name" {
  description = "AWS EC2 Key Pair name"
  type        = string
}

variable "allowed_ssh_ip" {
  description = "The IP address (in CIDR notation) allowed to SSH into EC2."
  type        = string
}

variable "state_bucket_name" {
  description = "The name of the S3 bucket to use for Terraform state. Must be globally unique."
  type        = string
}

