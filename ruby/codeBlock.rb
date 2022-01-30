# 코드블록
# 루비 프로그래밍에서 코드 블록은 {}(중괄호), do end 두가지 방식이 있고 한줄로 블록을 작성한다면 {}(중괄호)를 그렇지 않다면 do end블록을 사용한다.

arr = [1, 2, 3, 4]

# 한줄 {} 사용
arr.each { |value| puts value }

# 여러줄 do end 블록 사용
sum = 0
arr.each do |value|
  sum += value
  puts sum
end

# 블록은 클로저?
# 메서드 정의 시 매개변수 앞에 & 기호를 붙이면 메서드 호출시 코드 블록이 넘겨졌는지 확인한다.
class ProcEx
  def create_proc(&action)
    if action == nil
      @code_block = Proc.new { |param| p "hello new word #{param}" }
    else
      @code_block = action
    end
  end
  def start_proc(parameter)
    @code_block.call(parameter)
  end
end

proc1 = ProcEx.new
proc1.create_proc
proc1.start_proc("han juryeon")
proc2 = ProcEx.new
proc2.create_proc { |param| p "hi my name is #{param}" }
proc2.start_proc("hong")

def n_times(thing)
  lambda { |n| thing * n }
end

bo = n_times(23)
p bo.call(2)

# Proc 대체 문법
def my_if(condition, then_1, then_2)
  if condition
    then_1.call
  else
    then_2.call
  end
end
  
5.times do |value|
  my_if value < 2,
    -> { puts "#{value} is a small" },
    -> { puts "#{value} is a big" }
end

# 매개변수 리스트
# 매개변수 앞에 *는 정해지지 않은 갯수의 매개변수를 받는다.
p1 = lambda do |a, *b, &block|
  puts "a = #{a}"
  puts "b = #{b}"
  block.call("25")
end

p1.call(1, 2, 3) { |value| puts "my age is #{value}" }

# -> 대체 문법으로 작성

p2 = -> a, *b, &block do
  p "a = #{a}"
  p "b = #{b}"
  block.call
end
p2.call([1, 2], [1, 2], [1, 2]) { puts "block 2" }