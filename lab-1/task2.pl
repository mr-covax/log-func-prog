:- ['./data/four.pl'].

% Задание 2. 
%   Выбранный файл: four.pl; 
%   Вариант блока: 2;

% Пункт 1: Напечатать средний балл для каждого предмета
get_subject_average(Subject, Average) :-
    subject(Subject, List),
    count_grades(List, Sum, Count),
    Average is Sum / Count.

count_grades([], 0, 0).
count_grades([grade(_, Score) | Rest], Sum, Count) :-
    count_grades(Rest, Psum, Pcount),
    Sum is Psum + Score,
    Count is Pcount + 1.

% Пункт 2: Для каждой группы, найти количество не сдавших студентов.
% Считаем, что студент не сдал, если у него хотя бы одна двойка.
get_failed_in_group(Group, Count) :-
    group(Group, Students),
    students_failed(Students, Count).

students_failed([], 0).
students_failed([Student | Rest], Count) :-
    students_failed(Rest, RestCount),
    (
        has_failed_subject(Student)
        -> Count is RestCount + 1
        ;  Count is RestCount
    ).

has_failed_subject(Student) :-
    subject(_, Grades),
    member(grade(Student, 2), Grades).

% Пункт 3: Найти количество не сдавших студентов для каждого из предметов.
get_failed_in_subject(Subject, Count) :-
    subject(Subject, Grades),
    count_failed(Grades, Count).

count_failed([], 0).
count_failed([grade(_, Mark) | Rest], Count) :-
    count_failed(Rest, RestCount),
    (
        Mark = 2
        -> Count is RestCount + 1
        ;  Count is RestCount
    ).