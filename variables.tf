variable "resource_group_name" {
  type    = string
  default = "vm-rg"
}

# company
variable "company" {
  type        = string
  description = "This variable defines the name of the company"
  default     = "tutorial"
}

variable "location" {
  type        = string
  description = "Azure region where the resource group will be created"
  default     = "westus"
}

variable "tags" {
  type = map(string)
  default = {
    environment = "dev"
    team        = "DevOps"
  }
}

variable "vm_admin_username" {
  type    = string
  default = "adminuser"
}
