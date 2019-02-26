output "ip" {
  value = "${vsphere_virtual_machine.vm_1.guest_ip_addresses.0}"
}
