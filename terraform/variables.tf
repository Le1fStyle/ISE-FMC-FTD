variable "VCENTER_HOST" {}
variable "VCENTER_USER" {}
variable "VCENTER_PASSWORD" {}
variable "NETWORK_SUBNET" {}
variable "NETWORK_GATEWAY" {}
variable "NETWORK_PROXY" {}
variable "NETWORK_ADDRESS_1" {}
variable "NETWORK_ADDRESS_2" {}
variable "NETWORK_ADDRESS_3" {}
variable "NETWORK_ADDRESS_4" {}
variable "WINDOWS_USERNAME" {}
variable "WINDOWS_USR" {}
variable "WINDOWS_PWD" {}
variable "WINDOWS_PRODUCT_KEY" {}
variable "LINUX_USERNAME" {}
variable "LINUX_USR" {}
variable "LINUX_PWD" {}

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
  
variable "network_nameserver" {
  description = "list of nameserver"
  type        = list(string)
  default     = ["144.254.71.184","171.70.168.183","64.104.123.144","10.51.71.46"]
}

variable "windows_iso" {
  description = "ISO file as data source to create windows server"
  type        = string
  default     = "ISO-Templates/en-us_windows_server_2022_updated_feb_2022_x64_dvd_d4a089c1.iso"
}

variable "linux_iso" {
  description = "ISO file as data source to create ubuntu server"
  type        = string
  default     = "ISO-Templates/ubuntu-22.04.3-live-server-amd64.iso"
}