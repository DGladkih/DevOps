Этот модуль Terraform предназначен для развертывания виртуальной машины в **Yandex Cloud**.

Для работы модуля требуются:
- **Terraform >= 1.0.0**
- **Провайдер Yandex Cloud >= 0.87.0**
- Доступ в Yandex Cloud с необходимыми правами

## Используемый провайдер
terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.87.0"
    }
  }
}
Параметры модуля
Имя переменной	Описание
zone	Зона доступности
platform_id	Тип платформы
cores	Количество ядер
memory	Объем памяти (ГБ)
image_id	ID образа диска
disk_size	Размер диска (ГБ)
yc_subnet_id	ID подсети
preemptible	Прерываемая ВМ

Пример использования:

module "vm" {
  source      = "./vm_module"
  zone        = "ru-central1-b"
  platform_id = "standard-v3"
  cores       = 4
  memory      = 8
  image_id    = "custom-image-id"
  disk_size   = 30
  yc_subnet_id = "your-subnet-id"
  preemptible = false
}

Выходные переменные:
vm_external_ip	Внешний IP-адрес виртуальной машины

Пример:
output "vm_ip" {
  value = module.vm.vm_external_ip
}
Переменные окружения
Для передачи значений можно использовать файл terrafrom.tvars или переменные окружения:

export TF_VAR_zone="ru-central1-b"
export TF_VAR_platform_id="standard-v3"
export TF_VAR_cores=4
export TF_VAR_memory=8
export TF_VAR_image_id="some-other-image-id"
export TF_VAR_disk_size=30
export TF_VAR_yc_subnet_id="your-subnet-id"
export TF_VAR_preemptible=false