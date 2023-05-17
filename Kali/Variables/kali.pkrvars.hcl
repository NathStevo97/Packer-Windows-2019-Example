boot_wait                = "10s"
box_desc                 = "Kali Linux 2022-3 64 Bit Desktop"
box_name                 = "kali-linux-2022-3-amd64-desktop.box"
build_directory          = "kali-linux-2022-3-amd64-desktop.box"
cpus                     = "2"
disk_size                = "61440"
guest_os_type_vmware     = "debian8-64"
guest_os_type_virtualbox = "Debian_64"
headless                 = "true"
http_directory           = "../http"
iso_checksum             = "46e05739a20b29db60ca1fff2e90685ea632071c314a9c2416d7c46acef27bf0"
iso_checksum_type        = "sha256"
iso_path                 = "../../ISOs/Kali/kali-linux-2023.1-installer-amd64.iso"
iso_url                  = "https://cdimage.kali.org/kali-2023.1/kali-linux-2023.1-installer-amd64.iso"
memory                   = 4096
ssh_password             = "vagrant"
ssh_username             = "vagrant"
ssh_timeout              = "10000s"
vm_name                  = "packer-kali-2022-amd64"