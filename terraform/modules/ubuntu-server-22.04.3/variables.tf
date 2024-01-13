
variable "iso" {
  description = "ISO file as data source to create the desktop"
  type        = string
  default     = "ISO-Templates/ubuntu-22.04.3-live-server-amd64.iso"
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

variable "vcenter_host" {
  description = "Host of vCenter is needed for ansible connection"
  type = string
  default = "10.51.71.61"
}

variable "vcenter_user" {
  description = "User of vCenter is needed for ansible connection"
  type = string
  default = "administrator@hxedge-vcenter.local"
}

variable "vcenter_pwd" {
  description = "Password for vCenter is needed for ansible connection"
  type = string
  default = "Vielab123!"
}

variable "vcenter_datacenter" {
  description = "Password for vCenter is needed for ansible connection"
  type = string
  default = "Vielab123!"
}

variable "vcenter_folder" {
  description = "Folder where the desktop servers are generated"
  type        = string
  default     = "LHINTZSC/ISE-FMC/" 
}

variable "vcenter_vmname" {
  description = "Name of the ubuntu desktop server"
  type        = string
  default     = "LHINTZSC-UBUNTU-SERVER-1" 
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
  default     = "10.51.71.0/24"
}

variable "network_address" {
  description = "IPv4 address"
  type        = string
  default     = "10.51.71.46"
}

variable "network_gateway" {
  description = "gateway"
  type        = string
  default     = "10.51.71.254"
}

variable "network_nameserver" {
  description = "list of nameserver"
  type        = list(string)
  default     = ["144.254.71.184","171.70.168.183","64.104.123.144"]
}

variable "network_proxy" {
  description = "proxy"
  type        = string
  default     = "http://proxy.esl.cisco.com:80"
}

variable "installer_hostname" {
  description = "simple hostname for login"
  type        = string
  default     = "terminal1"
}

variable "installer_username" {
  description = "full username"
  type        = string
  default     = "Leif Eric Hintzsche"
}

variable "installer_user" {
  description = "username for login"
  type        = string
  default     = "lhintzsc"
}

variable "installer_pwd" {
  description = "password for login"
  type        = string
  default     = "Vielab123!"
}

variable "installer_time" {
  description = "waiting time in minutes for the installation"
  type        = number
  default     = 30
}

