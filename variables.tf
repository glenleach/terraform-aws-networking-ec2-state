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

