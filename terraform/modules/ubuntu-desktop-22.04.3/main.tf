terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "2.6.1"
    }
  }
}

# ubuntu desktop server
resource "vsphere_virtual_machine" "ubuntu-desktop" {
  folder                      = var.folder
  name                        = var.name
  datastore_id                = var.datastore_vms_id
  resource_pool_id            = var.resource_pool_id
  boot_delay                  = 15000
  guest_id                    = "other3xLinux64Guest" 
  wait_for_guest_ip_timeout   = -1
  wait_for_guest_net_timeout  = -1
  wait_for_guest_net_routable = false

  num_cpus = 2
  memory   = 2048

  network_interface {
    network_id = var.network_id
  }

  disk {
    label = "disk1"
    size  = 20
  }

  cdrom {
    datastore_id = var.datastore_iso_id
    path = var.iso
  }
}