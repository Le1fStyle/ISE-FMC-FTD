variable "iso" {
  description = "ISO file as data source to create the desktop"
  type        = string
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
  default     = [ "windows", "server", "2022" ]
}

variable "vcenter_host" {
  description = "Host of vCenter is needed for ansible connection"
  type = string
}

variable "vcenter_user" {
  description = "User of vCenter is needed for ansible connection"
  type = string
}

variable "vcenter_pwd" {
  description = "Password for vCenter is needed for ansible connection"
  type = string
}

variable "vcenter_datacenter" {
  description = "vCenter data center name"
  type = string
}

variable "vcenter_folder" {
  description = "Folder where the desktop servers are generated"
  type        = string
}

variable "vcenter_vmname" {
  description = "Name of the ubuntu desktop server"
  type        = string
}

variable "vcenter_validate_certs" {
  description = "are SSL certs validated"
  type        = bool
  default     = false
}

variable "vcenter_iso_controller_type" {
  description = "controller type used to mount the ISO"
  type        = string
  default     = "ide" 
}

variable "vcenter_iso_controller_number" {
  description = "controller number used to mount the ISO"
  type        = number
  default     = 0
}

variable "vcenter_iso_unit_number" {
  description = "unit number for iso file"
  type        = number
  default     = 0
}

variable "network_subnet" {
  description = "subnet"
  type        = string
}

variable "network_address" {
  description = "IPv4 address"
  type        = string
}

variable "network_gateway" {
  description = "gateway"
  type        = string
}

variable "network_nameserver" {
  description = "list of nameserver"
  type        = list(string)
}

variable "network_proxy" {
  description = "proxy"
  type        = string
}

variable "installer_hostname" {
  description = "simple hostname for login"
  type        = string
}

variable "installer_username" {
  description = "full name for windows installer"
  type        = string
}

variable "installer_usr" {
  description = "username for login"
  type        = string
}

variable "installer_pwd" {
  description = "password for login"
  type        = string
}

variable "installer_time" {
  description = "waiting time in minutes for the installation"
  type        = number
  default     = 30
}

variable "installer_product_key" {
  description = "product key for win server 2022"
  type        = number
}
