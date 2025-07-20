terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.87.0"
    }
  }
}

provider "yandex" {
  token     = var.iam_token
  cloud_id  = var.yc_cloud_id
  folder_id = var.yc_folder_id
  zone      = "ru-central1-a"
}

resource "yandex_compute_instance" "vm" {
  name        = "ansible-vm"
  platform_id = "standard-v3"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd80bm0rh4rkepi5ksdi"
      size     = 10
    }
  }

  network_interface {
    subnet_id = var.yc_subnet_id
    nat       = true
  }

  metadata = {user-data = file("${path.module}/cloud-init.yaml")
  }
}

output "vm_external_ip" {
  description = "External IP:"
  value       = yandex_compute_instance.vm.network_interface[0].nat_ip_address
}
