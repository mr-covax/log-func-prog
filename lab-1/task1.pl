% Определение длины списка.
list_length([], 0).
list_length([_ | Tail], R) :-
    list_length(Tail, Ri),
    R is Ri + 1.

% Проверка принадлежности элемента.
list_member(Member, [Member | _]) :- true.
list_member(Member, [_ | Tail]) :- list_member(Member, Tail).

% Добавление элемента в список.
list_append([], Element, [Element]).
list_append([Head | Tail], Element, [Head | Appended]) :-
    list_append(Tail, Element, Appended).

% Удаление единственного экземпляра элемента.
list_remove(Element, [Element | Tail], Tail).
list_remove(Element, [Head | Tail], [Head | Cleared_tail]) :-
    list_remove(Element, Tail, Cleared_tail).

% Генерация перестановок.
list_permute([], []).
list_permute(List, [Left_arg | Permutation]) :-
    list_remove(Left_arg, List, Rest),
    list_permute(Rest, Permutation).

% Проверка является ли список подсписком.
list_is_prefix([], _) :- true.
list_is_prefix([X | Sublist], [X | List]) :-
    list_is_prefix(Sublist, List).

list_sublist([], _) :- true.
list_sublist(Sublist, List) :-
    list_is_prefix(Sublist, List).
list_sublist(Sublist, [_ | Rest]) :-
    list_sublist(Sublist, Rest).

% Упражнение 1.1, вариант 8.
% См. определение предиката list_append на строке 12.

% Упражнение 1.2, вариант 13.
equal(X, X).

is_progression([_], _).
is_progression([X, Y | Rest], Diff) :-
    List_diff is Y - X,
    equal(List_diff, Diff),
    is_progression([Y | Rest], Diff).

is_linear_progression([_]).
is_linear_progression([A, B | Rest]) :-
    Diff is B - A,
    is_progression([B | Rest], Diff).
