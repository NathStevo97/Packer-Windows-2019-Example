boot_command = ["<tab><wait><enter><wait>", "a<wait>a<wait>a<wait>a<wait>a<wait>a<wait>"]
boot_wait = "5s"
boot_wait_hyperv = "120s"
disk_size = "40960"
floppy_files = ["./Files/bios/win2016/DC/autounattend.xml", "./Files/scripts/winrmConfig.ps1"]
guest_os_type_virtualbox = "Windows2016_64"
guest_os_type_vmware = "windows8srv-64"
headless = true
http_directory = "../http/Agent_Installations"
iso_checksum = "70721288bbcdfe3239d8f8c0fae55f1f"
iso_path = "../../ISOs/Windows Server/2016/Windows_Server_2016_Datacenter_EVAL_en-us_14393_refresh.ISO"
iso_url = "https://software-download.microsoft.com/download/pr/Windows_Server_2016_Datacenter_EVAL_en-us_14393_refresh.ISO"
memsize = "4096"
numvcpus = "2"
output_directory = "output-windows-2016-DC"
secondary_iso_image = "./Files/bios/win2016/DC/secondary.iso"
switch_name = "Default Switch" #change this to whatever your switch is! Look in Hyper-V Manager to find it!
upgrade_timeout = ""
vlan_id = ""
vm_name = "Win2016_Datacenter"
winrm_password = "packer"
winrm_timeout = "4h"
winrm_username =  "Administrator"