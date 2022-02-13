# class Ex
#   def initialize
#     @val_1 = 1
#     @val_2 = 2
#   end
#
#   def sum(a, b)
#     begin
#       pp a + c
#     rescue Exception => err
#       pp "에러가 발생함 : #{err}"
#     end
#   end
# end
#
# ex = Ex.new
# ex.sum(1, 2)

class Ex_2
  def one
    raise # 현재의 예외를 발생시키며 예외가 없다면 RuntimeError를 발생시킨다. 주로 예외 처리 구문에서 해당 예외를 다음으로 넘기기 위해 사용한다.
  end
  def two
    raise "BadRequest Error" # 주어진 문자열을 에러 메시지로 사요하며 호출 스택을 따라 올라간다.
  end
  def three
    raise SyntaxError, "a is not method", caller # 첫 번째 매개변수로 예외 클래스를 생성하고 주어진 문자열을 에러 메세지로 지정하고 세 번쨰 변수를 추적 스택으로 활용한다.
  end
end

ex = Ex_2.new
ex.one
ex.two
ex.three