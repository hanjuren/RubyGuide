#
# 연산자 메서드 재정의?
#

# << 연산자 재정의
class Score
  def initialize
    @total_score = @count = 0
  end

  def <<(score)
    @total_score += score
    @count += 1
    self
  end

  def average
    fail "No scores" if @count.zero?
    Float(@total_score) / @count
  end
end

s = Score.new
s << 10 << 20 << 30
pp "Average : #{s.average}" # => "Average : 20.0"

#
# 병렬대입
#
a, b = 1, 2
a, b = b, a
pp a, b

class Ex
  def initialize
    @total = 0
  end
  def plus(number)
    @total = number
  end
end