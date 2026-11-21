% Lab 12 - Task 1
% Finding a Path Between Cities (Directed Graph)

% Facts: Directed edges between cities

edge('Makkah', 'Madinah').
edge('Madinah', 'Makkah').

edge('Madinah', 'Taif').
edge('Madinah', 'Tabuk').

edge('Tabuk', 'Taif').
edge('Taif', 'Tabuk').

edge('Taif', 'Dammam').

edge('Makkah', 'Riyadh').

edge('Riyadh', 'Dammam').
edge('Dammam', 'Riyadh').

edge('Dammam', 'Al-Qatif').
edge('Al-Qatif', 'Dammam').

edge('Al-Qatif', 'Madinah').


% Find all paths between two cities

travel(From, To, Path) :-
    path(From, To, [From], ReversePath),
    reverse(ReversePath, Path).


% Base Case: The destination is reached

path(To, To, Visited, Visited).


% Recursive Case: Find the next connected city

path(Current, To, Visited, Path) :-
    edge(Current, Next),
    \+ member(Next, Visited),
    path(Next, To, [Next|Visited], Path).