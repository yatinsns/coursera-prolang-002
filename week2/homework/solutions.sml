fun is_older(d1: int * int * int, d2: int * int * int) =
  #1 d1 < #1 d2 orelse #2 d1 < #2 d2 orelse #3 d1 < #3 d2

fun number_in_month(ds: (int * int * int) list, month: int) =
  if null ds
  then 0
  else if #2((hd ds)) = month
  then 1 + number_in_month(tl ds, month)
  else number_in_month(tl ds, month)

fun number_in_months(ds: (int * int * int) list, months: int list) =
  if null months then 0
  else number_in_month(ds, hd months) + number_in_months(ds, tl months)

fun dates_in_month(ds: (int * int * int) list, month: int) =
  if null ds
  then []
  else if #2 (hd ds) = month
  then hd(ds) :: dates_in_month(tl ds, month)
  else dates_in_month(tl ds, month)



  
