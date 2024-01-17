terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "2.6.1"
    }
  }
}

# vCenter login details
provider "vsphere" {
  user           = var.VCENTER_USER
  password       = var.VCENTER_PASSWORD
  vsphere_server = var.VCENTER_HOST

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

# HX data center
data "vsphere_datacenter" "dc" {
  name = var.datacenter
}

# HX datastore for VMs
data "vsphere_datastore" "vms" {
  name          = var.datastore_vms
  datacenter_id = data.vsphere_datacenter.dc.id
}

# HX datastore for files
data "vsphere_datastore" "iso" {
  name          = var.datastore_iso
  datacenter_id = data.vsphere_datacenter.dc.id
}

# HX cluster
data "vsphere_compute_cluster" "cluster" {
  name          = var.clustername
  datacenter_id = data.vsphere_datacenter.dc.id
}

# network resources for IPs
data "vsphere_network" "network" {
  name          = var.network_vms
  datacenter_id = data.vsphere_datacenter.dc.id
}

# HX resource pool
resource "vsphere_resource_pool" "mypool" {
  name                    = var.resource_pool
  parent_resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
}

# home folder
resource "vsphere_folder" "home" {
  path          = var.home_folder
  type          = "vm"
  datacenter_id = data.vsphere_datacenter.dc.id
}

# folder for use case ise and fmc
resource "vsphere_folder" "ise-fmc" {
  path          = "${vsphere_folder.home.path}/${var.project_folder_name}" 
  type          = "vm"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

# windows AD and DNS server
module "module_ad_dns" {

 source               = "./modules/windows-server-2022"
 iso                  = var.windows_iso

 vcenter_vmname       = "LHINTZSC-AD-DNS"
 vcenter_datacenter   = var.datacenter
 vcenter_folder       = vsphere_folder.ise-fmc.path
 vcenter_host         = var.VCENTER_HOST
 vcenter_user         = var.VCENTER_USER
 vcenter_pwd          = var.VCENTER_PASSWORD

 network_address      = var.NETWORK_ADDRESS_1
 network_subnet       = var.NETWORK_SUBNET
 network_proxy        = var.NETWORK_PROXY
 network_gateway      = var.NETWORK_GATEWAY
 network_nameserver   = var.network_nameserver

 installer_hostname   = "ad-dns"
 installer_username   = var.WINDOWS_USERNAME
 installer_usr        = var.WINDOWS_USR
 installer_pwd        = var.WINDOWS_PWD
 installer_product_key= var.WINDOWS_PRODUCT_KEY
 
 datastore_vms_id     = data.vsphere_datastore.vms.id
 datastore_iso_id     = data.vsphere_datastore.iso.id
 resource_pool_id     = vsphere_resource_pool.mypool.id
 network_id           = data.vsphere_network.network.id
 
}

# ubuntu server
module "module_ubuntu_server" {
 source               = "./modules/ubuntu-server-22.04.3"
 iso                  = var.linux_iso

 vcenter_vmname       = "LHINTZSC-UBUNTU"
 vcenter_datacenter   = var.datacenter
 vcenter_folder       = vsphere_folder.ise-fmc.path
 vcenter_host         = var.VCENTER_HOST
 vcenter_user         = var.VCENTER_USER
 vcenter_pwd          = var.VCENTER_PASSWORD

 network_address      = var.NETWORK_ADDRESS_2
 network_subnet       = var.NETWORK_SUBNET
 network_proxy        = var.NETWORK_PROXY
 network_gateway      = var.NETWORK_GATEWAY
 network_nameserver   = var.network_nameserver

 installer_hostname   = "ubuntu_1"
 installer_username   = var.LINUX_USERNAME
 installer_usr        = var.LINUX_USR
 installer_pwd        = var.LINUX_PWD
 
 datastore_vms_id  = data.vsphere_datastore.vms.id
 datastore_iso_id  = data.vsphere_datastore.iso.id
 resource_pool_id  = vsphere_resource_pool.mypool.id
 network_id        = data.vsphere_network.network.id
}
