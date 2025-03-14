%%%
%%% BFS
%%%

solve_bfs(State, Result) :-
    % A combination is a list of all chosen swaps and states
    % taken along the way.
    InitialCombination = [ [], [State] ],
    queue_create(InitialCombination, InitialQueue),
    bfs(InitialQueue, [Swaps, _]),
    reverse(Swaps, Result), !.
    

bfs(Queue, Result) :-
    queue_pop(Queue, LatestCombination, _),
    LatestCombination = [_, [LatestState|_]],
    LatestState = [Start|_],
    validate(LatestState, Start),
    Result = LatestCombination.

bfs(Queue, Result) :-
    queue_pop(Queue, LatestCombination, ReducedQueue),
    LatestCombination = [Steps, States],
    States = [LatestState|StateHistory],
    findall(
        [ [(I, J)|Steps], [Next|States] ], 
        (
            successor(LatestState, I, J, Next),
            \+ memberchk(Next, StateHistory)
        ),
        NextCombinations
    ),
    queue_extend(ReducedQueue, NextCombinations, FinalQueue),
    bfs(FinalQueue, Result).

%%%
%%% DFS
%%%

solve_dfs(State, Result) :-
    Combination = [ [], [State] ],
    dfs(Combination, [Swaps, _]),
    reverse(Swaps, Result).

dfs(Combination, Result) :-
    Combination = [_, [LatestState|_]],
    LatestState = [Start|_],
    validate(LatestState, Start),
    Result = Combination.

dfs([Swaps, States], Result) :-
    States = [LatestState|_],
    successor(LatestState, I, J, NextState),
    \+ member(NextState, States),
    dfs([ [(I,J)|Swaps], [NextState|States] ], Result).

%%
%% IDS
%%

solve_ids(State, Result) :-
    between(0, 10000, Depth),
    dls([[], [State]], Depth, Combination),
    Combination = [Swaps, _],
    reverse(Swaps, Result), !.

dls(Combination, _, Combination) :-
    Combination = [_, [LatestState|_]],
    LatestState = [Start|_],
    validate(LatestState, Start),
    !.

dls([Swaps, States], Depth, Result) :-
    Depth > 0,
    States = [LatestState|_],
    successor(LatestState, I, J, NextState),
    \+ member(NextState, States),
    NewDepth is Depth - 1,
    dls([ [(I,J)|Swaps], [NextState|States] ], NewDepth, Result).

%%%
%%% Helper functions
%%%

valid_color_transition(r, r).
valid_color_transition(r, w).
valid_color_transition(r, b).
valid_color_transition(w, w).
valid_color_transition(w, b).
valid_color_transition(b, b).

validate([], _).
validate([X|T], X) :-
    valid_color_transition(X, Transition),
    validate(T, Transition), !.

successor(State, I, J, NextState) :-
    length(State, L),
    between(1, L, I),
    between(1, L, J),
    I < J,
    swap_positions(State, I, J, NextState).

swap_positions(List, I, J, Swapped) :-
    nth1(I, List, ElemI),
    nth1(J, List, ElemJ),
    replace_nth(List, I, ElemJ, Temp),
    replace_nth(Temp, J, ElemI, Swapped).

replace_nth([_|T], 1, X, [X|T]).
replace_nth([H|T], I, X, [H|R]) :-
    I > 1, I1 is I - 1,
    replace_nth(T, I1, X, R).

% In the basic implementation of BFS, up to 91% of the runtime is
% spent in the append/3 predicate, which tanks the performance. Here we
% basically keep new elements in a stack, and when the queue is 
% exhausted, we load up the elements onto the queue.

queue_create(Array, queue([Array], [])).

queue_check(Queue, X) :-
    Queue = queue([], Stack),
    reverse(Stack, ReversedStack),
    X = queue(ReversedStack, []), !.
queue_check(Queue, Queue).

queue_pop(Queue, X, NewQueue) :-
    queue_check(Queue, ValidQueue),
    ValidQueue = queue([X|T], Stack),
    NewQueue = queue(T, Stack).

queue_extend(queue(Queue, Stack), Values, queue(Queue, ExtendedStack)) :-
    stack_extend(Stack, Values, ExtendedStack).

stack_extend(Stack, [], Stack) :- !.
stack_extend(Stack, [Value|T], NewStack) :-
    AppendedStack = [Value|Stack],
    stack_extend(AppendedStack, T, NewStack).
