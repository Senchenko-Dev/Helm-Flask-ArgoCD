FROM nico989/ubuntu-flask:v3

WORKDIR /app
COPY requirements.txt .

# Копируем все файлы приложения в контейнер
COPY . .

# Указываем переменную окружения для Flask
ENV FLASK_APP=app.py

# Открываем порт, на котором будет работать приложение
EXPOSE 5000

# Команда для запуска приложения
CMD ["flask", "run", "--host=0.0.0.0"]
