(* Testcases for is_older *)

test("is_older: true if first year is older",
     assert_true(is_older((2000, 0, 0), (2010, 0, 0))));

test("is_older: false if first year is newer",
     assert_false(is_older((2010, 0, 0), (2000, 0, 0))));

test("is_older: true if first month is older",
     assert_true(is_older((2000, 0, 0), (2000, 1, 0))));

test("is_older: false if first month is newer",
     assert_false(is_older((2000, 1, 0), (2000, 0, 0))));

test("is_older: true if first day is older",
     assert_true(is_older((2000, 0, 0), (2000, 0, 1))));

test("is_older: false if first month is newer",
     assert_false(is_older((2000, 0, 1), (2000, 0, 0))));

test("is_older: false if dates are same",
     assert_false(is_older((2000, 0, 0), (2000, 0, 0))));

(* Testcases for number_in_month *)

test("number_in_month: with some months matching",
     assert_equals_int(number_in_month([(2012, 2, 28), (2013, 12, 1)], 2), 1));

test("number_in_month: with all months matching",
     assert_equals_int(number_in_month([(2012, 2, 28), (2013, 2, 1)], 2), 2));

test("number_in_month: with none months matching",
     assert_equals_int(number_in_month([(2012, 12, 28), (2013, 12, 1)], 2), 0));

(* Testcases for number_in_months *)

test("number_in_months: with some months matching",
     assert_equals_int(number_in_months([(2012, 2, 28), (2013, 12, 1), (2011, 3, 31), (2011, 4, 28)], [2, 3, 4]), 3));

test("number_in_months: with none months matching",
     assert_equals_int(number_in_months([(2012, 2, 28), (2013, 12, 1), (2011, 3, 31), (2011, 4, 28)], [5, 6, 7]), 0));

run();
