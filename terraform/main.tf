terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = var.vmware_provider_version
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

module "module_ubuntu-server-1" {
 source  = "./modules/ubuntu-server-22.04.3"
 vcenter_vmname = "LHINTZSC-UBUNTU-SERVER-1"
 vcenter_folder = vsphere_folder.ise-fmc.path
 network_address = "10.51.71.46"
 installer_hostname = "terminal-1"
 
 datastore_vms_id  = data.vsphere_datastore.vms.id
 datastore_iso_id = data.vsphere_datastore.iso.id
 resource_pool_id = vsphere_resource_pool.mypool.id
 network_id       = data.vsphere_network.network.id
}

module "module_ubuntu-server-2" {
 source  = "./modules/ubuntu-server-22.04.3"
 vcenter_vmname = "LHINTZSC-UBUNTU-SERVER-2"
 vcenter_folder = vsphere_folder.ise-fmc.path
 network_address = "10.51.71.47"
 installer_hostname = "terminal-2"
 
 datastore_vms_id  = data.vsphere_datastore.vms.id
 datastore_iso_id = data.vsphere_datastore.iso.id
 resource_pool_id = vsphere_resource_pool.mypool.id
 network_id       = data.vsphere_network.network.id
}

module "module_windows-server-1" {
 source  = "./modules/windows-server-2022"
 vcenter_vmname = "LHINTZSC-WINDOWS-SERVER-1"
 vcenter_folder = vsphere_folder.ise-fmc.path


 network_subnet = "10.51.71.0/24"
 network_address = "10.51.71.48"


 installer_hostname = "windows-1"
 installer_pwd = var.INSTALLER_PWD
 vcenter_pwd = var.VCENTER_PASSWORD
 
 datastore_vms_id  = data.vsphere_datastore.vms.id
 datastore_iso_id = data.vsphere_datastore.iso.id
 resource_pool_id = vsphere_resource_pool.mypool.id
 network_id       = data.vsphere_network.network.id
}

