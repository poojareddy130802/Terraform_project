variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "disk_count" {
  type = number
}

variable "disk_name" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "virtual_machine_ids" {
  type = list(string)
}
