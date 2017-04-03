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

fun dates_in_months(ds: (int * int * int) list, months: int list) =
  if null months then []
  else dates_in_month(ds, hd months) @ dates_in_months(ds, tl months)

fun get_nth(ls: string list, n: int) =
  if n = 1 then hd ls
  else get_nth(tl ls, n - 1)

fun date_to_string(d: int * int * int) =
  let val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  in
      get_nth(months, #2 d) ^ " " ^ Int.toString(#1 d) ^ ", " ^ Int.toString(#3 d)
  end


fun number_before_reaching_sum(sum: int, ls: int list) =
  if hd ls > sum then 1
  else 1 + number_before_reaching_sum(sum - hd ls, tl ls)

				     
      
