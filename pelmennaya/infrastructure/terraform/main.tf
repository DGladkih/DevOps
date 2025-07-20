module "network" {
  source     = "./modules/network"
  network_name = var.network_name
  subnets      = var.subnets
}

module "service_account" {
  source     = "./modules/service_account"
  folder_id  = var.folder_id
  sa_name    = "kube-sa"
  roles      = ["editor","k8s.clusters.agent"]
}

module "k8s_cluster" {
  source             = "./modules/k8s_cluster"
  cluster_name       = var.cluster_name
  network_id         = module.network.network_id
  service_account_id = module.service_account.sa_id
  folder_id          = var.folder_id
  subnet_id          = module.network.subnet_id
  zone               = var.zone
  cluster_ipv4_range = var.cluster_ipv4_range
  service_ipv4_range = var.service_ipv4_range
}


module "k8s_node_group" {
  source         = "./modules/k8s_node_group"
  cluster_id     = module.k8s_cluster.cluster_id
  subnet_ids     = module.network.subnet_ids
  node_group_name = var.node_group_name
  node_count     = var.node_count
  sa_id          = module.service_account.sa_id
  depends_on     = [module.k8s_cluster]
}

module "object_storage" {
  source      = "./modules/object_storage"
  bucket_name = var.bucket_name
  folder_id   = var.folder_id

  access_key  = var.sa_storage_access_key
  secret_key  = var.sa_storage_secret_key
}

module "cert_manager" {
  source     = "./modules/cert_manager"
  depends_on = [module.k8s_cluster, module.k8s_node_group]
}

module "ingress_nginx" {
  source     = "./modules/ingress_nginx"
  depends_on = [module.k8s_cluster, module.k8s_node_group]
}
