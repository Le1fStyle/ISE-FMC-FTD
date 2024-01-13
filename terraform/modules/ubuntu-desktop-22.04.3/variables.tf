variable "folder" {
  description = "Folder where the desktop servers are generated"
  type        = string
  default     = "LHINTZSC/ISE-FMC/" 
}

variable "name" {
  description = "Name of the ubuntu desktop server"
  type        = string
  default     = "LHINTZSC-UBUNTU-DESKTOP-1" 
}

variable "iso" {
  description = "ISO file as data source to create the desktop"
  type        = string
  default     = "ISO-Templates/ubuntu-22.04.3-desktop-amd64.iso"
}

variable "datastore_vms_id" {
  description = "Datastore ID to store VMs"
  type        = string
}

variable "datastore_iso_id" {
  description = "Datastore ID that contains source ISOs"
  type        = string
}

variable "resource_pool_id" {
  description = "Resource Pool ID"
  type        = string
}

variable "network_id" {
  description = "Network ID"
  type        = string
}

variable "tags" {
  description = "Tags to categorize the VM"
  type        = list(string)
  default     = [ "ubuntu", "desktop", "22.04.3" ]
}