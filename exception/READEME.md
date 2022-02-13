## 예외처리
루비에서 에러처리를 담당하는 클래스는 Exception 클래스 혹은 그 자식 클래스의 객체이다.

에러처리를 위해서는 begin/end 블록으로 감싸주고 블록 안에서 코드를 실행하면 된다. 자바슼크립트의 try/catch 문과 동일한 구조인듯하여 학습하는데 무리는 없을 것 같다.
서비스에서는 다양한 에러가 발생하며 이를 개발자가 직접 모두 찾아낼 수 없기 때문에 예외 처리는 중요한 부분중 하나이다.

에러처리를 위한 코드는 다음과 같이 작성하게 된다.

```ruby
class Ex
  def initialize
    @val_1 = 1
    @val_2 = 2
  end

  def sum(a, b)
    begin
      pp a + c
    rescue Exception => err
      pp "에러가 발생함 : #{err}"
    end
  end
end

ex = Ex.new
ex.sum(1, 2)
```
그냥 쥐어짜낸 예시이다.. c라는 지역변수는 존재하지 않기 때문에 에러가 발생하는데 이를 기록하고 로그로 출력하는 등의 작업을 할 수 있게 예외처리 문법을 사용하면된다.

### 예외 발생 시키기
예외를 발생시키기 위해서는 Object#raise 메서드를 사요하거나 fail 메서드를 사용한다.

```ruby
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
```