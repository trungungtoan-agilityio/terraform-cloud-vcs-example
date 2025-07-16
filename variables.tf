variable "resource_group_name" {
  default = "myTFResourceGroup"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "westus2"
}