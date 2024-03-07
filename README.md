# Привет

  Скопируй и запусти команду в терминале

* git clone git@github.com:Tavbulatov/uchi.git

* docker compose up

  Запусти Postman

* POST http://localhost:3000/students

  Для регистрации и входа в систему

  { "student": { "first_name": "Alikhan", "last_name": "Tavbulatov",
                 "surname": "Muratkhanovich", "classroom_id": "1",
                 "school_id": "1", "email": "ali@mail.ru",
                 "password": "123123" }}

* DELETE http://localhost:3000/students/sign_out

  Для выхода из системы в заголовке нужно указать токен с ключом Aurtorization (его надо взять из Headers после регистрации и use для каждого запроса )

 либо  отправить данные напр. - { "student": { "email": "ali@mail.ru", "password": "123123" }}

* POST http://localhost:3000/students/sign_in

  Для аутентификации ранее зарегистрированного студента

  {"student": { "email": "ali@mail.ru", "password": "123123" }}

* GET http://localhost:3000/schools/1/classrooms

  Для получения всех Классов из школы

* GET http://localhost:3000/schools/1/classrooms/1/students

  Для получения всех Студентов

* DELETE http://localhost:3000/students

  Для удаления студента

  { "student_id": "1" }
