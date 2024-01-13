variable "VCENTER_HOST" {}
variable "VCENTER_USER" {}
variable "VCENTER_PASSWORD" {}

variable "vmware_provider_version"{
  description = "Version of vmware provider"
  type        = string
  default     = "2.6.1"
}

variable "datacenter" {
  description = "Name of datacenter"
  type        = string
  default     = "DC1"
}

variable "clustername" {
  description = "Name of cluster"
  type        = string
  default     = "HX-EDGE-M5"
}

variable "network_vms" {
  description = "Network used by the virtual machines"
  type        = string
  default     = "hx-vmnetwork71-71"
}

variable "datastore_vms" {
  description = "Datastore for VMs"
  type        = string
  default     = "HX-VMS"
}

variable "datastore_iso" {
  description = "Datastore for ISOs"
  type        = string
  default     = "VC-DS01"
}

variable "resource_pool" {
  description = "Name of resource pool"
  type        = string
  default     = "LHINTZSC"
}

variable "home_folder" {
  description = "Name of home folder"
  type        = string
  default     = "LHINTZSC"
}

variable "project_folder_name" {
  description = "Project folder name"
  type        = string
  default     = "ISE-FMC"
}
