color_of(apple, green).
color_of(vase, green).
color_of(grape, red).
color_of(winebottle, red).
color_of(banana, yellow).
color_of(sunflower, yellow).
color_of(cone, brown).
color_of(wooden_key, brown).
is_fruit(apple).
is_fruit(grape).
is_fruit(banana).
made_of(vase, glass).
made_of(winebottle, glass).
human_made(vase).
human_made(winebottle).
human_made(wooden_key).

% from https://stackoverflow.com/a/46905298
count_step(Condition, Item, CurrentCount, NewCount) :-
    call(Condition, Item) ->
        NewCount is CurrentCount + 1 ;
        NewCount = CurrentCount.

count(List, Condition, Count) :-
    foldl(count_step(Condition), List, 0, Count).

is_glass(X) :- made_of(X, glass).

?- X = [G, R, Y, B],
  color_of(G, green),
  color_of(R, red),
  color_of(Y, yellow),
  color_of(B, brown),
  count(X, is_fruit, 1),
  (member(vase, X) -> member(sunflower, X); true),
  count(X, human_made, 2),
  count(X, is_glass, 1).
