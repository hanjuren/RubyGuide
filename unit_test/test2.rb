require 'test/unit'

class TestSample < Test::Unit::TestCase

  # assert | refute
  def test1
    assert(true) # success
    assert(false) # fail <false> is not true.

    refute(false) # success
    refute(true) # fail <true> is neither nil or false.
  end

  # assert_ | refute_ empty
  def test2
    assert_empty({})
    assert_empty([])
    assert_empty("")
    assert_empty(["test"]) # fail <["test"]> was expected to be empty.

    refute_empty(["test"])
    refute_empty({ key: "value" })
    refute_empty("test")
    refute_empty("") # fail <""> was expected to not be empty.
  end

  # assert_block
  def test3
    assert_block do
      result = true
      [2, 4, 6].each do |num|
        result = false if num % 2 != 0
      end
      result
    end

    assert_block do
      result = true
      [2, 4, 5].each do |num|
        result = false if num % 2 != 0
      end
      result
    end # fail assert_block failed
  end

  # assert_ | refute_ equal
  def test4
    target = 2 * 3
    assert_equal(target, 6)
    assert_equal(target, 5) # fail <6> expected but was <5>

    refute_equal(target, 5)
    refute_equal(target, 6) # fail <6> was expected to be != to <6>
  end

  # assert_ | refute_ in_delta
  def test5
    assert_in_delta(0.05, (50000.0 / 10**6), 0.001)
    assert_in_delta(0.06, (50000.0 / 10**6), 0.001) # fail <0.06> -/+ <0.001> was expected to include <0.05>

    refute_in_delta(0.06, (50000.0 / 10**6), 0.001)
    refute_in_delta(0.05, (50000.0 / 10**6), 0.001) # fail <0.05> -/+ <0.001> was expected to not include <0.05>
  end
end