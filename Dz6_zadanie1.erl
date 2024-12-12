-module(Dz6_zadanie1).
-export([sort/1]).

sort(List) ->
    case List of
        [] -> [];
        [X] -> [X];
        _ -> 
            {Left, Right} = split(List),
            merge(sort(Left), sort(Right))
    end.

split(List) ->
    lists:split(length(List) div 2, List).

merge([], Right) -> Right;
merge(Left, []) -> Left;
merge([H1 | T1], [H2 | T2]) when H1 =< H2 -> [H1 | merge(T1, [H2 | T2])];
merge(Left, [H2 | T2]) -> [H2 | merge(Left, T2)].
