class grade:
    def __init__(self, student, mark):
        self.student = student
        self.mark = mark


groups = {
    101: ['Петровский','Сидоров','Мышин','Безумников','Густобуквенникова'],
    102: ['Петров','Ивановский','Биткоинов','Шарпин','Эксель','Текстописов','Криптовалютников','Азурин','Круглотличников'],
    103: ['Сидоркин','Эфиркина','Сиплюсплюсов','Программиро','Клавиатурникова','Решетников','Текстописова','Вебсервисов'],
    104: ['Иванов','Запорожцев','Джаво','Фулл','Круглосчиталкин','Блокчейнис'],
}

subject_results = {
    'Логическое программирование': [grade('Петров',4),grade('Петровский',2),grade('Иванов',5),grade('Ивановский',5),grade('Запорожцев',5),grade('Сидоров',2),grade('Сидоркин',4),grade('Биткоинов',4),grade('Эфиркина',3),grade('Сиплюсплюсов',4),grade('Программиро',4),grade('Джаво',2),grade('Клавиатурникова',5),grade('Мышин',3),grade('Фулл',5),grade('Безумников',5),grade('Шарпин',5),grade('Круглосчиталкин',4),grade('Решетников',5),grade('Эксель',4),grade('Текстописов',4),grade('Текстописова',5),grade('Густобуквенникова',5),grade('Криптовалютников',5),grade('Блокчейнис',3),grade('Азурин',5),grade('Вебсервисов',5),grade('Круглотличников',3)],
    'Математический анализ': [grade('Петров',2),grade('Петровский',4),grade('Иванов',4),grade('Ивановский',4),grade('Запорожцев',4),grade('Сидоров',5),grade('Сидоркин',4),grade('Биткоинов',5),grade('Эфиркина',4),grade('Сиплюсплюсов',5),grade('Программиро',3),grade('Джаво',4),grade('Клавиатурникова',3),grade('Мышин',5),grade('Фулл',4),grade('Безумников',3),grade('Шарпин',4),grade('Круглосчиталкин',4),grade('Решетников',5),grade('Эксель',3),grade('Текстописов',4),grade('Текстописова',4),grade('Густобуквенникова',5),grade('Криптовалютников',4),grade('Блокчейнис',3),grade('Азурин',5),grade('Вебсервисов',4),grade('Круглотличников',5)],
    'Функциональное программирование': [grade('Петров',3),grade('Петровский',5),grade('Иванов',4),grade('Ивановский',3),grade('Запорожцев',3),grade('Сидоров',3),grade('Сидоркин',4),grade('Биткоинов',5),grade('Эфиркина',5),grade('Сиплюсплюсов',5),grade('Программиро',4),grade('Джаво',5),grade('Клавиатурникова',5),grade('Мышин',5),grade('Фулл',4),grade('Безумников',5),grade('Шарпин',3),grade('Круглосчиталкин',3),grade('Решетников',4),grade('Эксель',4),grade('Текстописов',3),grade('Текстописова',4),grade('Густобуквенникова',4),grade('Криптовалютников',5),grade('Блокчейнис',5),grade('Азурин',4),grade('Вебсервисов',4),grade('Круглотличников',4)],
    'Информатика': [grade('Петров',4),grade('Петровский',3),grade('Иванов',3),grade('Ивановский',4),grade('Запорожцев',3),grade('Сидоров',4),grade('Сидоркин',4),grade('Биткоинов',4),grade('Эфиркина',3),grade('Сиплюсплюсов',2),grade('Программиро',4),grade('Джаво',5),grade('Клавиатурникова',4),grade('Мышин',5),grade('Фулл',3),grade('Безумников',4),grade('Шарпин',5),grade('Круглосчиталкин',5),grade('Решетников',4),grade('Эксель',4),grade('Текстописов',3),grade('Текстописова',5),grade('Густобуквенникова',3),grade('Криптовалютников',2),grade('Блокчейнис',4),grade('Азурин',5),grade('Вебсервисов',4),grade('Круглотличников',4)],
    'Английский язык': [grade('Петров',4),grade('Петровский',5),grade('Иванов',3),grade('Ивановский',4),grade('Запорожцев',4),grade('Сидоров',5),grade('Сидоркин',3),grade('Биткоинов',5),grade('Эфиркина',5),grade('Сиплюсплюсов',5),grade('Программиро',4),grade('Джаво',4),grade('Клавиатурникова',3),grade('Мышин',5),grade('Фулл',4),grade('Безумников',3),grade('Шарпин',4),grade('Круглосчиталкин',4),grade('Решетников',2),grade('Эксель',4),grade('Текстописов',4),grade('Текстописова',5),grade('Густобуквенникова',5),grade('Криптовалютников',5),grade('Блокчейнис',3),grade('Азурин',2),grade('Вебсервисов',4),grade('Круглотличников',4)],
    'Психология': [grade('Петров',5),grade('Петровский',3),grade('Иванов',3),grade('Ивановский',3),grade('Запорожцев',5),grade('Сидоров',3),grade('Сидоркин',5),grade('Биткоинов',4),grade('Эфиркина',5),grade('Сиплюсплюсов',5),grade('Программиро',3),grade('Джаво',4),grade('Клавиатурникова',4),grade('Мышин',4),grade('Фулл',4),grade('Безумников',2),grade('Шарпин',3),grade('Круглосчиталкин',2),grade('Решетников',4),grade('Эксель',3),grade('Текстописов',3),grade('Текстописова',5),grade('Густобуквенникова',4),grade('Криптовалютников',5),grade('Блокчейнис',5),grade('Азурин',3),grade('Вебсервисов',5),grade('Круглотличников',4)]
}


def test_subtask_1():
    print("Task 1:")
    for subject, grades in subject_results.items():
        values = [*map(lambda x: x.mark, grades)]
        print(subject, ":", sum(values) / len(values))
    

def test_subtask_2():
    print("Task 2:")
    for group_id, group in groups.items():
        counter = 0

        for student in group:
            for subject, grades in subject_results.items():
                for grade in grades:
                    if grade.student == student and grade.mark == 2:
                        counter += 1
                        break
                else: 
                    continue
                break

        print(group_id, ':', counter)


def test_subtask_3():
    print("Task 3:")
    for subject, marks in subject_results.items():
        counter = 0
        for mark in marks:
            if mark.mark == 2:
                counter += 1

        print(subject, ":", counter)


test_subtask_1()
print()
test_subtask_2()
print()
test_subtask_3()