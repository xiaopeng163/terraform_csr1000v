variable "admin_username" {
  type        = string
  description = "Administrator user name for virtual machine"
}

variable "admin_password" {
  type        = string
  description = "Password must meet Azure complexity requirements"
}

variable "vm_instance_name" {
  type        = list(string)
  description = "vm name list"
  default     = ["csr1000v_r1", "csr1000v_r2"]
}

variable "resource_group_name" {
  type    = string
  default = "terraform_demo"
}
