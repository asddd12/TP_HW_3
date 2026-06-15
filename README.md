# TP_HW_3

## Структура проекта

- generator/ - Python-контейнер, генерирует `data.csv`
- reporter/ - Node.js-контейнер, читает CSV и создаёт `report.html`
- data/ - общая папка для обмена файлами между контейнерами
- run.sh - скрипт управления

## Команды

bash
- ./run.sh build_generator - собирает образ генератора
- ./run.sh run_generator - генерирует data.csv в папке data/
- ./run.sh build_reporter - собирает образ репортера
- ./run.sh run_reporter - генерирует report.html в папке data/
- ./run.sh structure - показывает структуру проекта
- ./run.sh clear_data - чистит папку data/
- ./run.sh inside_generator - проверяет содержимое data/ изнутри контейнера генератора
- ./run.sh inside_reporter - проверяет содержимое data/ изнутри контейнера репортера
