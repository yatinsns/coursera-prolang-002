fun is_older(d1: int * int * int, d2: int * int * int) =
  #1 d1 < #1 d2
  orelse (#1 d1 = #1 d2 andalso #2 d1 < #2 d2)
  orelse (#1 d1 = #1 d2 andalso #2 d1 = #2 d2 andalso #3 d1 < #3 d2)

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
  if hd ls >= sum then 1
  else 1 + number_before_reaching_sum(sum - hd ls, tl ls)


fun what_month(day: int) =
  let val days_in_months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  in
      number_before_reaching_sum(day, days_in_months)
  end
      
fun month_range(day1: int, day2: int) =
  if day1 > day2 then []
  else if day1 = day2 then what_month(day1)::[]
  else what_month(day1)::month_range(day1 + 1, day2)

fun oldest(ds: (int * int * int) list) =
  if null ds then NONE
  else
      let
	  fun oldest_value(ds: (int * int * int) list) =
	    if null (tl ds) then hd ds
	    else
		let val tl_ans = oldest_value(tl ds)
		in
		    if is_older(hd ds, tl_ans) then hd ds
		    else tl_ans
		end
      in
	  SOME (oldest_value ds)
      end
	  
		      
		
fun reasonable_date(date: (int * int * int)) =
  let
      val days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
      val leap_year_days = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

      fun get_nth(ls: int list, n: int) =
	if n = 1 then hd ls
	else get_nth(tl ls, n - 1)

      fun is_valid_day(date: (int * int * int)) =
	let val year = #3 date
	in
	    if year mod 400 = 0 orelse (year mod 4 = 0 andalso year mod 100 <> 0)
	    then #1 date <= get_nth(leap_year_days, #2 date)
	    else #1 date <= get_nth(days, #2 date)
	end
  in
      #3 date > 0
      andalso #2 date >= 1 andalso #2 date <=12
      andalso #1 date > 0 andalso is_valid_day date
  end

fun remove_duplicates(ls: int list) =
  let
      fun list_contains(ls: int list, n: int) =
	if null ls then false
	else if hd ls = n then true
	else list_contains(tl ls, n)
  in
      if null ls then []
      else
	  let val tl_res = remove_duplicates(tl ls)
	  in
	      if list_contains(tl_res, hd ls) then tl_res
	      else hd ls :: tl_res
	  end
  end

fun number_in_months_challenge(ds: (int * int * int) list, months: int list) =
  number_in_months(ds, remove_duplicates(months))

fun dates_in_months_challenge(ds: (int * int * int) list, months: int list) =
  dates_in_months(ds, remove_duplicates(months))
