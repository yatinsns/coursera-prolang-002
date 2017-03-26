fun bad_max(xs: int list) = 
  if null xs
  then 0
  else if null (tl xs)
  then hd xs
  else if (hd xs) > bad_max(tl xs)
  then hd xs
  else bad_max(tl xs)


fun good_max( xs : int list) = 
  if null xs
  then 0
  else if null (tl xs)
  then hd xs
  else 
    let val res = good_max(tl xs)
    in
      if hd xs > res then hd xs
      else res
    end

fun max1 (xs : int list) = 
  if null xs
  then NONE
  else 
    let val res = max1(tl xs)
    in
      if isSome res andalso valOf res > hd xs then res
      else SOME (hd xs)
    end

fun max2 (xs : int list) =
  if null xs
  then NONE
  else
      let
	  fun max_nonempty(xs: int list) =
            if null (tl xs)
            then hd xs
            else
		let val tl_ans = max_nonempty(tl xs)
                in
		    if hd xs > tl_ans
		    then hd xs
		    else tl_ans
                end
      in
	  SOME (max_nonempty xs)
      end
