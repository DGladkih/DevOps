#!/bin/bash

# Функция для вывода информации о хосте
get_host_info() {
  echo "=== Информация о хосте ==="
  echo "Количество ядер CPU: $(grep -c '^processor' /proc/cpuinfo)"
  
  mem_total=$(grep 'MemTotal' /proc/meminfo | awk '{print $2/1024}')
  mem_avail=$(grep 'MemAvailable' /proc/meminfo | awk '{print $2/1024}')
  mem_used=$(echo "$mem_total - $mem_avail" | bc)
  echo "Оперативная память: Всего ${mem_total} MB, Использовано ${mem_used} MB"
  
  echo "Информация о дисках:"
  df -h --output=source,size,used,avail,pcent | awk 'NR==1 || $1 ~ /^\/dev\// {print $0}'
  
  echo "Средняя загрузка системы (load average): $(awk '{print $1, $2, $3}' /proc/loadavg)"
  echo "Текущее время: $(date)"
  echo "Время работы системы: $(uptime -p)"
  
  echo "Сетевые интерфейсы:"
  while read -r line; do
    iface=$(echo "$line" | awk '{print $1}')
    rx_packets=$(grep "$iface:" /proc/net/dev | awk '{print $2}')
    tx_packets=$(grep "$iface:" /proc/net/dev | awk '{print $10}')
    errors=$(grep "$iface:" /proc/net/dev | awk '{print $4 + $12}')
    echo "Интерфейс: $iface, RX: $rx_packets пакетов, TX: $tx_packets пакетов, Ошибок: $errors"
  done < <(ip -brief link | awk '{print $1}')
  
  echo "Слушаемые порты:"
  ss -tuln
}

# Функция для вывода информации о пользователях
get_user_info() {
  echo "=== Информация о пользователях ==="
  echo "Список пользователей в системе:"
  cut -d: -f1 /etc/passwd
  
  echo "Список root-пользователей:"
  awk -F: '$3 == 0 {print $1}' /etc/passwd
  
  echo "Список залогиненных пользователей:"
  who
}

# Функция для вывода справки
show_help() {
  cat <<EOF
Использование: $0 [OPTIONS]

Параметры:
  --host     Показать информацию о хосте
  --user     Показать информацию о пользователях
  --help     Показать справку

Пример:
  $0 --host
  $0 --user
EOF
}

# Проверяем, доступен ли getopt
if ! command -v getopt &>/dev/null; then
  echo "GNU getopt не установлен. Установите его и повторите попытку."
  exit 1
fi

# Обрабатываем аргументы с помощью getopt
ARGS=$(getopt -o h --long host,user,help -n "$0" -- "$@")
if [[ $? -ne 0 ]]; then
  echo "Ошибка обработки аргументов"
  exit 1
fi

# Устанавливаем разобранные аргументы
eval set -- "$ARGS"

# Обрабатываем аргументы
while true; do
  case "$1" in
    --host)
      get_host_info
      shift
      ;;
    --user)
      get_user_info
      shift
      ;;
    --help)
      show_help
      shift
      ;;
    --)
      shift
      break
      ;;
    *)
      echo "Неизвестный параметр: $1"
      exit 1
      ;;
  esac
done

