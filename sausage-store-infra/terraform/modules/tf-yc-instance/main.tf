resource "yandex_compute_instance" "vm" {
  name     = "ansible-std-014-39"
  platform_id = var.platform_id
  zone        = var.zone

  resources {
    cores  = var.cores
    memory = var.memory
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = var.disk_size
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }
  
  scheduling_policy {
    preemptible = var.preemptible
  }

  metadata = {user-data = file("${path.module}/cloud-init.yaml")
  }
}