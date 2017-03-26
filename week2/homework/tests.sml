test("is_older: true if first year is older",
  assert_true(is_older((2000, 0, 0), (2010, 0, 0))));

test("is_older: false if first year is newer",
  assert_true(is_older((2010, 0, 0), (2000, 0, 0))));

run();
