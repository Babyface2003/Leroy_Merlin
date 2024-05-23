import json


with open("C:\\Users\\ivanr\\Downloads\\Telegram Desktop\\all.json", "r") as file:
    data = json.load(file)

def check_data_quality(data):
    issues = []
    if 'states' not in data:
        issues.append("Нет ключа 'states' в ответе.")
        return issues

    for state in data['states']:
        if len(state) != 17:
            issues.append(f"Неправильное количество полей для состояния: {state}")

        longitude = state[5]
        latitude = state[6]
        velocity = state[8]

        if longitude is None or not (-180 <= longitude <= 180):
            issues.append(f"Долгота вне допустимого диапазона для состояния: {state}")
        if latitude is None or not (-90 <= latitude <= 90):
            issues.append(f"Широта вне допустимого диапазона для состояния: {state}")
        if not isinstance(velocity, (int, float)):
            issues.append(f"Скорость не является числом для состояния: {state}")
        if velocity is not None and velocity < 0:
            issues.append(f"Отрицательная скорость для состояния: {state}")


    return issues

quality_issues = check_data_quality(data)

output_file = "quality_issues.json"
with open(output_file, "w", encoding="utf-8") as file:
    json.dump(quality_issues, file, ensure_ascii=False, indent=4)

print(f"Проблемы с качеством данных сохранены в {output_file}")