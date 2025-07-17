terraform {
  backend "s3" {
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
    bucket                      = "pelmen-tf-prod"
    region                      = "ru-central1"
    key                         = "dev/terraform.tfstate"
    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
