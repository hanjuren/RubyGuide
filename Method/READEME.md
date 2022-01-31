## 루비 메서드

### 메서드 정의
메서드는 def 키워드로 정의하며 이름의 마지막에는 **!, ?, =** 를 사용할 수 있다. 각각의 키워드는 다음과 같이 사용된다.  
1. True, False를 반환하는 메서드의 경우 ?를 사용하기도 한다.
2. 수신자의 값을 바꿔버리는 메서드의 경우 !를 사용한다. 이러한 메서드는 뱅 메서드라고 불린다.
3. 대입문의 좌측에 올 수 있는 메서드이름 마지막에 = 기호를 사용한다.

### 가변 인자 리스트
개수가 정해지지 않은 가변 매개변수를 전달하거나 하나의 매개변수로 여러개의 매개변수를 처리한다면 메서드 인자의 마지막에 가변매개변수 앞에 *기호를 사용하면 된다.  

```ruby
def method_1(arg_1, *rest)
  "arg_1 = #{arg_1}, rest = #{rest.inspect}"
end

pp method_1("one") # => "arg_1 = one, rest = []"
pp method_1("one", "two") # => "arg_1 = one, rest = [\"two\"]"
pp method_1("one", "two", 1) # => "arg_1 = one, rest = [\"two\", 1]"
```
첫 번째 매개변수는 일반적인 매개변수로 지정되고 두 번쨰 매개변수에 *기호가 붙어있기 때문에 남은 매개변수 모두를 Array객체에 저장하여 매개변수에 대입한다.

이러한 가변 매개변수는 메서드에서 직접 사용하지는 않지만 상위 클래스에서 같은 이름을 가지고 있는 메서드를 호출하고자 하는 경우에 사용되기도 한다.

```ruby
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
a.do_something # => "parent class"
```

### 메서드와 블록
메서드를 호출할때 블록을 결합시켜 호출을 할 수 있다. 이러 방식으로 결합된 메서드는 내부에서 yield를 사용하여 호출이 가능하다.

```ruby
def some(arg_1)
  yield(arg_1 + 1)
end
some(1) { |value| pp "value : #{value}" } # => 2
```
이러한 방식으로도 사용이 가능하지만 매개변수 앞에 & 기호를 붙여주면 Proc 객체로 변환되어 이 객체를 마지막 매개변수에 대입하여 사용할 수 있다.

```ruby
def proc(arg_1, &proc)
  proc.call(arg_1)
end
proc(1) { |v| pp v * 10 } # => 10
```

### 루비 메서드 결과 반환
루비 메서드는 일반적으로 결과를 반환한다. 무조건 반환하는 것은 아니다. 하지만 결과를 반환하는 메서드에서 결과값은 일반적으로 마지막으로 실행된 표현식의 결과값이다.  
대부분 return 문을 작성하지 않아도 되지만 메서드 실행 중간 빠져나가야 한다면 return 문을 사용하는 경우도 있다.

```ruby
def re
  100.times do |i|
    value = i * i
    return i, value if value > 1000
  end
end
v = re
pp v # => [32, 1024]
```
루비에서는 두개 이상의 결과를 return 하게 되면 배열 형태로 결과값을 반환하게 된다. 이런식으로 반환된 Array 값은 병렬 대입문으로 값을 이용 할 수 있다.

```ruby
def re
  100.times do |i|
    value = i * i
    return i, value if value > 1000
  end
end
index, value = re
pp index # => 32
pp value # => 1024
```