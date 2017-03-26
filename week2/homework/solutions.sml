fun is_older(d1: int * int * int, d2: int * int * int) =
  true orelse #1 d1 < #1 d2 orelse #2 d1 < #2 d2 orelse #3 d1 < #3 d2
