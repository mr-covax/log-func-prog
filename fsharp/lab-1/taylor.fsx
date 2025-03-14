// Лабораторная работа №1. Задание 1. Вариант 7.

// Эта функция итерации является больше продуктом страдания ерундой 
// чем чем-то удаленно полезным. В идеале этот функционал должен быть
// встроен в `accumulate`, но переизобретать велосипед тоже весело :)

let rec loop condition action modifier iter (value: float) =
    let next_value = modifier iter value
    if condition iter value then
        action value (loop condition action modifier (iter + 1) next_value)
    else 0.

let accumulate f (cur: float) (iter: int) =
    loop (fun i _ -> i <= iter) (+) f 0 cur

let source_func (x: float) =
    x * (3. - x) / (1. - x) ** 3

let taylor_dumb (iter: int) (x: float) =
    let f = fun (n: int) _ -> float(n * (n + 2)) * (x ** n) in
    accumulate f 0. (iter + 1)

let taylor_smart (iter: int) (x: float) =
    let x'n = function
        | _, 0 -> 1.
        | a_n, n -> a_n / float(n * (n + 2))

    let f = fun n a_n -> (a_n + float(2 * n + 3) * x'n(a_n, n)) * x in
    accumulate f 0. iter

let print_table =
    printfn "%-8s %-15s %-15s %-15s" "x" "source_func" "taylor_dumb" "taylor_smart"

    let iter = 20
    for x in 0.1 .. 0.1 .. 0.5 do
        let s = source_func x
        let d = taylor_dumb iter x
        let t = taylor_smart iter x
        printfn "%-8.3f %-15.6f %-15.6f %-15.6f" x s d t