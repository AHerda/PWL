:- use_module(library(clpfd)).

% D - duration, R1 - resource 1, R2 - resource 2
tasks([
    %D R1 R2
    [2, 1, 3],
    [3, 2, 1],
    [4, 2, 2],
    [3, 3, 2],
    [3, 1, 1],
    [3, 4, 2],
    [5, 2, 1]]).

%         R1 R2
resources(5, 5).

% Main scheduling predicate
schedule(Horizon, Starts, MakeSpan) :-
    tasks(Tasks),
    resources(Res1, Res2),
    length(Tasks, N),
    length(Starts, N),
    Starts ins 0..Horizon,

    % Create task structures for cumulative constraints
    maplist(create_task(Starts), Tasks, TaskStructures),

    % Extract the individual resource requirements
    maplist(extract_resources_1, TaskStructures, Tasks1),
    maplist(extract_resources_2, TaskStructures, Tasks2),

    % Apply cumulative constraints for each resource
    cumulative(Tasks1, [limit(Res1)]),
    cumulative(Tasks2, [limit(Res2)]),

    % Calculate end times for each task
    findall(End, (nth0(I, Tasks, [D, _, _]), nth0(I, Starts, S), End #= S + D), Ends),

    % The makespan is the maximum end time
    maximum(MakeSpan, Ends),

    % Minimize the makespan
    labeling([min(MakeSpan)], Starts).

% Helper to create task structures
create_task(Starts, [D, R1, R2], task(S, D, E, R1, R2)) :-
    nth0(_, Starts, S),
    E #= S + D.

% Extract resource requirements for the first resource
extract_resources_1(task(S, D, E, R1, _), task(S, D, E, R1)).

% Extract resource requirements for the second resource
extract_resources_2(task(S, D, E, _, R2), task(S, D, E, R2)).
