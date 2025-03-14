// Лабораторная работа №1. Задание 2. Вариант 7.

//
// Обобщенные фунции численного решения функций
//

let iteration_method (iterable: float -> float) (x0: float) (min_delta: float) (max_iter: int) =
    let rec cycle x n =
        if n = 0 then x
        else
            let new_x = iterable x
            if abs (new_x - x) < min_delta then new_x
            else cycle new_x (n - 1)
    cycle x0 max_iter

let dichotomy_method (func: float -> float) (a: float) (b: float) (min_delta: float) (max_iter: int) =
    let rec cycle a b n =
        let c = (a + b) / 2.0

        if n = 0 || abs (b - a) < min_delta then c
        elif func c = 0.0 then c
        elif func a * func c < 0.0 then cycle a c (n - 1)
        else cycle c b (n - 1)

    cycle a b max_iter

let newton_method func diff (x0: float) (min_delta: float) (max_iter: int) =
    let rec cycle x n =
        if n = 0 then x
        else
            let new_x = x - func x / diff x
            if abs (new_x - x) < min_delta then new_x
            else cycle new_x (n - 1)

    cycle x0 max_iter

let print_table_line label f f' f_iter (a: float) (b: float) (x: float) (value: float) =
    let delta = 1e-6
    let iter = 100

    printfn "| %-10s | %-1.4f | %1.4f | %1.4f | %1.4f |" 
        label
        (iteration_method f_iter x delta iter)
        (dichotomy_method f a b delta iter)
        (newton_method f f' x delta iter)
        value

// 
// Функции и их модификации для различных методов решения
// 

// функция 7:
let f7 = fun x -> 3. * (log x ** 2.) + 6. * (log x) - 5.;
let f7' = fun x -> (6.0 * log x + 6.0) / x
let f7_iter = fun x -> exp(sqrt((5.0 - 6.0 * log x) / 3.0))

// функция 8
let f8 = fun x -> 0.6 * (3.0 ** x) - 2.3 * x - 3.0
let f8' = fun x -> 0.6 * (3.0 ** x) * log(3.0) - 2.3
let f8_iter = fun x -> 
    log((2.3 * x + 3.0) / 0.6) / log(3.0)

// функция 9
let f9 = fun x -> x * x - log(1.0 + x) - 3.0
let f9' = fun x -> 2.0 * x - 1.0 / (1.0 + x)
let f9_iter = fun x -> sqrt(log(1.0 + x) + 3.0)

//
// Вывод результата
//

printfn "| %-10s | %-6s | %-6s | %-6s | %-6s |"
    "Функция" "Итер." "Дихот." "Ньютон" "Знач."

print_table_line "Функция 7" f7 f7' f7_iter 1. 3. 3. 1.8832
print_table_line "Функция 8" f8 f8' f8_iter 2. 3. 2. 2.4200
print_table_line "Функция 9" f9 f9' f9_iter 2. 3. 2. 2.0267
