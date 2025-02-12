module "network" {
  source        = "./modules/tf-yc-network"
  network_zones = ["ru-central1-a", "ru-central1-b"]
}

locals {
  instance_subnet_id = module.network.subnets["ru-central1-a"]
}

module "instance" {
  source   = "./modules/tf-yc-instance"

  iam_token     = var.iam_token
  yc_cloud_id   = var.yc_cloud_id
  yc_folder_id  = var.yc_folder_id
  image_id = var.image_id
  zone     = var.zone
  subnet_id = local.instance_subnet_id
}
