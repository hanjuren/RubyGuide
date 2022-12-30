require 'benchmark'
include Benchmark

LOOP_COUNT = 1_000_000

bmbm(12) do |test|
  test.report("inline:") do
    LOOP_COUNT.times do |x|
      # not working
    end
  end

  test.report("method:") do
    def method
      # not working
    end
    LOOP_COUNT.times do |x|
      method
    end
  end
end