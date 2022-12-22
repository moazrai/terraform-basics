variable "resource_group_name" {
  type    = string
  default = "tutorial-rg"
}

variable "location" {
  type    = string
  default = "westus"
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
