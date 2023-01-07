variable "iso_path" {
  type    = string
  default = "../../ISOs/RHEL/rhel-server-7.9-x86_64-dvd.iso"
}

variable "iso_url" {
  type    = string
  default = "https://archive.org/download/rhel-server-7.9-x86_64-dvd/rhel-server-7.9-x86_64-dvd.iso"
}

variable "memsize" {
  type    = string
  default = "2048"
}

variable "numvcpus" {
  type    = string
  default = "2"
}

source "vmware-iso" "rhel-7" {
  boot_command     = ["<tab> text ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks-7.cfg<enter><wait>"]
  boot_wait        = "10s"
  disk_size        = 81920
  guest_os_type    = "rhel7-64"
  headless         = false
  http_directory   = "../http/RHEL"
  iso_checksum     = "7e40e30e794ca80fcd840aa1a54876b0"
  iso_urls         = ["${var.iso_path}", "${var.iso_url}"]
  shutdown_command = "echo 'vagrant'|sudo -S /sbin/halt -h -p"
  ssh_password     = "vagrant"
  ssh_port         = 22
  ssh_timeout      = "10000s"
  ssh_username     = "vagrant"
  vmx_data = {
    memsize             = "${var.memsize}"
    numvcpus            = "${var.numvcpus}"
    "scsi0.virtualDev"  = "lsisas1068"
    "virtualHW.version" = "14"
  }
  vm_name = "packer-rhel-7-x86_64"
}

#################################################################
#                    Virtualbox-ISO Builder                     #
#################################################################

source "virtualbox-iso" "rhel-7" {
  boot_command         = ["<tab> text ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks-7.cfg<enter><wait>"]
  boot_wait            = "45s"
  disk_size            = 61440
  guest_additions_mode = "disable"
  #guest_additions_path = "c:/Windows/Temp/windows.iso"
  guest_os_type        = "RedHat_64"
  hard_drive_interface = "sata"
  headless             = true
  http_directory       = "../http/RHEL"
  iso_checksum         = "7e40e30e794ca80fcd840aa1a54876b0"
  iso_urls             = ["${var.iso_path}", "${var.iso_url}"]
  iso_interface        = "sata"
  shutdown_command     = "echo 'vagrant'|sudo -S /sbin/halt -h -p"
  ssh_password         = "vagrant"
  ssh_port             = 22
  ssh_timeout          = "10000s"
  ssh_username         = "vagrant"
  vboxmanage           = [["modifyvm", "{{ .Name }}", "--memory", "${var.memsize}"], ["modifyvm", "{{ .Name }}", "--cpus", "${var.numvcpus}"], ["modifyvm", "{{ .Name }}", "--vram", "32"]]
}

build {
  sources = ["source.vmware-iso.rhel-7", "source.virtualbox-iso.rhel-7"]

  provisioner "shell" {
    execute_command = "echo 'vagrant' | {{ .Vars }} sudo -S -E bash '{{ .Path }}'"
    script          = "./Files/scripts/cleanup.sh"
  }
}