require 'test/unit'

class Human
  def self.hi
    pp "hello"
  end
end

class TestSample < Test::Unit::TestCase
  def test_sample
    assert(true) # success
    assert(false) # fail <false> is not true.

    refute(false) # success
    refute(true) # fail <true> is neither nil or false.

    assert_empty({})
    assert_empty([])
    assert_empty("")
    assert_empty(["test"]) # fail <["test"]> was expected to be empty.

    refute_empty(["test"])
    refute_empty({ key: "value" })
    refute_empty("test")
    refute_empty("") # fail <""> was expected to not be empty.

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

    target = 2 * 3
    assert_equal(target, 6)
    assert_equal(target, 5) # fail <6> expected but was <5>

    refute_equal(target, 5)
    refute_equal(target, 6) # fail <6> was expected to be != to <6>

    assert_in_delta(0.05, (50000.0 / 10**6), 0.001)
    assert_in_delta(0.06, (50000.0 / 10**6), 0.001) # fail <0.06> -/+ <0.001> was expected to include <0.05>

    refute_in_delta(0.06, (50000.0 / 10**6), 0.001)
    refute_in_delta(0.05, (50000.0 / 10**6), 0.001) # fail <0.05> -/+ <0.001> was expected to not include <0.05>

    collection = { k1: 'value', k2: 'value' }
    assert_includes(collection, :k1)
    assert_includes(collection, :k3) # fail

    refute_includes(collection, :k3)
    refute_includes(collection, :k2) # fail

    assert_instance_of(String, "string")
    assert_instance_of(Array, "string") # fail

    refute_instance_of(Array, "string")
    refute_instance_of(Array, ['1']) # fail

    assert_match(/^a/, "apple")
    assert_match(/^a/, "banana") # fail

    refute_match(/^a/, "banaan")
    refute_match(/^a/, "apple") # fail

    assert_nil(nil)
    assert_nil("string") # fail

    refute_nil("string")
    refute_nil(nil) # fail

    assert_operator(1 + 1, :==, 2)
    assert_operator(1 + 2, :==, 2) # fail

    refute_operator(1 + 1, :==, 3)
    refute_operator(1 + 1, :==, 2) # fail

    assert_raises(NoMethodError) { nil[:key] }
    obj = { key: "value" }
    assert_raises(NoMethodError) { obj[:key] } # fail

    assert_respond_to(Human, :hi)
    assert_respond_to(Human, :hello) # fail

    refute_respond_to(Human, :hello)
    refute_respond_to(Human, :hi) # fail

    assert_send([/ca{1}t/, :match, "cat"])
    assert_send([/ca{1}t/, :match, "caat"]) # fail
  end
end