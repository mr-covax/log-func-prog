% Лабораторная работа №2. Вариант 8


% Данный предикат возращает индекс объекта в списке.
getOrder([X|_], X, 0) :- !.
getOrder([_|Rest], X, Index) :-
    getOrder(Rest, X, I1),
    Index is I1 + 1.


solution(Borisov, Kirillov, Danin, Savin) :-
    % Данное решение заключается в том, что инженеры перебираются
    % по каждому из свойств (профессия, возраст, интересы). Под 
    % каждой переменной таится имя инженера.  Конечно, данное решение
    % крайне неэффективно, но концептуально простое.
    
    Jobs = [mechanic, chemist, builder, radio],
    Ages = [A0, A1, A2, A3],
    Chess = [C0, C1, C2, C3],
    Theater = [T0, T1, T2, T3],
    Ski = [S0, S1, S2, S3],
    People = [Borisov, Kirillov, Danin, Savin],

    permutation(People, Jobs),
    permutation(People, Ages),
    permutation(People, Chess),
    permutation(People, Theater),
    permutation(People, Ski),

    % Тут проверяем, что данная комбинация удовлетворяет условиям,
    % указанными в условии задачи.

    % Самый пожилой лучше всех играет в шахматах и чаще всех в театре.
    A3 = C3,
    A3 = T3,

    % Самый молодой лучше всех катается на лыжах.
    A0 = S3,

    % Химик посещает театр чаще, чем автомеханик, но реже, чем строитель
    getOrder(Theater, chemist, TheaterChemist),
    getOrder(Theater, mechanic, TheaterMechanic),
    getOrder(Theater, builder, TheaterBuilder),
    TheaterBuilder > TheaterChemist,
    TheaterChemist > TheaterMechanic,

    % Химик не самый молодой и не самый старый.
    chemist \= A0,
    chemist \= A3,

    % Строитель бегает на лыжах хуже, чем радиотехник
    getOrder(Ski, builder, SkiingBuilder),
    getOrder(Ski, radio, SkiingRadio),
    SkiingRadio > SkiingBuilder,

    % Строитель хуже автомеханика в шахматах.
    getOrder(Chess, builder, ChessBuilder),
    getOrder(Chess, mechanic, ChessMechanic),
    ChessMechanic > ChessBuilder,

    % Борисов обыгрывает Данина, но проигрывает Савину
    getOrder(Chess, Borisov, ChessBorisov),
    getOrder(Chess, Danin, ChessDanin),
    getOrder(Chess, Savin, ChessSavin),
    ChessSavin > ChessBorisov,
    ChessBorisov > ChessDanin,
    
    % Борисов бегает на лыжах лучше, чем инженер, который моложе его
    member(SomeEngineer, People),

    getOrder(Ski, Borisov, SkiingBorisov),
    getOrder(Ski, SomeEngineer, SkiingSomeEngineer),

    getOrder(Ages, Borisov, BorisovAge),
    getOrder(Ages, SomeEngineer, SomeEngineerAge),

    SkiingBorisov > SkiingSomeEngineer,
    SomeEngineerAge < BorisovAge,

    % Борисов ходит в театр чаще, чем инженер, который старше Кириллова 
    member(AnotherEngineer, People),

    getOrder(Theater, Borisov, TheaterBorisov),
    getOrder(Theater, AnotherEngineer, TheaterAnotherEngineer),

    getOrder(Ages, Kirillov, KirillovAge),
    getOrder(Ages, AnotherEngineer, AnotherEngineerAge),

    AnotherEngineerAge > KirillovAge,
    TheaterBorisov > TheaterAnotherEngineer,
    
    % Если все условия выполнены, прерываем обход и возращаем ответ.
    !.
