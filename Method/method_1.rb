#
# 가변 매개변수
#
def method_1(arg_1, *rest)
  "arg_1 = #{arg_1}, rest = #{rest.inspect}"
end

pp method_1("one")
pp method_1("one", "two")
pp method_1("one", "two", 1)


#
# 상위 클래스 메서드 호출
#
class Parent
  def do_something(*)
    pp "parent class"
  end
end

class Child < Parent
  def do_something(*)
    super
  end
end

a = Child.new
a.do_something


#
# 메서드와 블록 결합
#
def some(arg_1)
  yield(arg_1 + 1)
end
some(1) { |value| pp "value : #{value}" }

def proc(arg_1, &proc)
  proc.call(arg_1)
end
proc(1) { |v| pp v * 10 }


#
# 반환값
#
def re
  100.times do |i|
    value = i * i
    return i, value if value > 1000
  end
end
v = re
pp v

index, value = re
pp index
pp value