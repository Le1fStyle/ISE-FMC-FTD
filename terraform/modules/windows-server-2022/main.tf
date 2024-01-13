terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "2.6.1"
    }
  }
}

# windows server
resource "vsphere_virtual_machine" "windows-server" {
  folder                      = var.vcenter_folder
  name                        = var.vcenter_vmname
  datastore_id                = var.datastore_vms_id
  resource_pool_id            = var.resource_pool_id
  boot_delay                  = 15000
  guest_id                    = "win2000ServGuest" 
  wait_for_guest_ip_timeout   = -1
  wait_for_guest_net_timeout  = -1
  wait_for_guest_net_routable = false

  num_cpus = 2
  memory   = 4048

  network_interface {
    network_id = var.network_id
  }

  disk {
    label = "disk1"
    size  = 100
  }

  cdrom {
    datastore_id = var.datastore_iso_id
    path = var.iso
  }

  provisioner "local-exec" {
    working_dir = "../ansible/"
    command="ansible-playbook ./roles/windows-server-2022/tasks/gui_static_IP.yml"
    environment = {
      vcenter_host                  = var.vcenter_host
      vcenter_user                  = "administrator@hxedge-vcenter.local"
      vcenter_pwd                   = var.vcenter_pwd
      vcenter_vmname                = var.vcenter_vmname
      vcenter_folder                = var.vcenter_folder
      vcenter_datacenter            = "DC1" 
      vcenter_iso_controller_type   = "ide"
      vcenter_iso_controller_number = 0
      vcenter_iso_unit_number       = 0
      vcenter_validate_certs        = false
      network_subnet                = var.network_subnet
      network_address               = var.network_address
      network_gateway               = "10.51.71.254"
      network_nameserver            = jsonencode(var.network_nameserver)
      network_proxy                 = "http://proxy.esl.cisco.com:80"
      installer_hostname            = var.installer_hostname
      installer_name                = "Leif Eric Hintzsche"
      installer_user                = "lhintzsc"
      installer_pwd                 = var.installer_pwd
      installer_time                = 30
      product_key                   = "GHKN6-MXYKV-8H8FJ-GWM4K-T86K8"
    }
  }

}