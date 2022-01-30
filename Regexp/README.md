## 루비 정규 표현식

> 정규 표현식이란?  
> 문자열에 매치할 수 있는 패턴을 의미하며 문자열 패턴에 매치하는 부분 혹은 전체를 체크 하거나 테스트 할 수 있다.  
> 루비에서는 간단한 패턴 매치, 치환을 위한 기능을 제공하고 있다.

### 패턴으로 문자열 매치하기
루비에서는 **=~** 기호를 사용하여 지정한 패턴이 문자열에 매칭 되는지 판별한다. 문자열이 패턴에 매치한다면 **=~** 연산자는 매치된 위치를 숫자로 리턴한다.  

```ruby
re_1 = /cat/ =~ 'dog and cat'
re_2 = /cat/ =~ 'catch'
re_3 = /cat/ =~ 'Cat'

pp re_1 # => 8
pp re_2 # => 0
pp re_3 # => nil
```
매치 결과가 true일 경우 매치되는 첫번째 인덱스 값을 리턴하며 결과가 false 라면 nil을 반환한다. 결과 반환값이 true || false 이기 때문에 해당 연산을 조건문에서도 사용이 가능하다.

```ruby
str = 'dog and cat'

if /cat/ =~ str
  pp 'true'
else
  pp 'false'
end

# => "true"
```

일치여부를 확인하는 =~ 연산자의 반대 의미인 !~ 연산자도 존재한다. 반대의 의미를 가지며 일치하지 않는 결과의 값을 반환하게 된다.

```ruby
pp /cat/ !~ 'dog and cat' # => 'false'
pp /cat/ !~ 'Cat' # => 'true'
```

### 패턴으로 문자열 치환하기
**sub**메서드는 문자열에서 패턴과 일치하는 문자열을 치환 문자열로 치환해주는 메서드이다.

```ruby
str = 'Dog and Cat'
new_str = str.sub(/Cat/, 'Rabbit')
pp new_str # => "Dog and Rabbit"
```

**sub** 메서드는 일치하는 패턴의 첫번째 부분만 치환해주는 메서드로 전역적으로 문자열을 치환하기 위해서는 **gsub**메서드를 활용하면 된다.

```ruby
str_2 = "ababab"
new_str_2 = str_2.gsub(/a/, '*')
pp new_str_2 # => "*b*b*b"
```

**sub, gsub**메서드를 사용할 때 알아두면 좋은 점은 해당 메서드를 사용하여 반환되는 결과값은 기존 문자열 값에 영향을 주지 않고 새로운 문자열을 반환한다는 점이다.  
기존 문자열을 변환하고 싶다면 메서드 뒤에 !를 사용하여 문자열 값을 직접 바꾸도록 해주면 된다. 또한 !를 사용하여 문자열을 변경하고자 할때는 패턴이 매치 될경우에만 문자열을 치환하며 패턴과 일치 하지 않다면  
nil을 반환한다. 따라서 !를 사용하여 문자열을 치환하는 것은 조건문에서도 활용이 가능하다는 의미이다.

### 정규 표현식에 대해 더 알아보기
루비란 무엇인가에서 루비의 모든 것은 객체로 활용된다고 했다. 따라서 정규표현식도 루비에서는 객체로 평가가 된다. 정확히는 Regexp의 인스턴스이다. 그러므로 정규표현식을 변수에 대입하거나 메서드 인자로 넘겨줄 수 있다.

```ruby
str = 'Dog and Cat'
# 변수에 대입하기
pattern = /Cat/
pp pattern =~ str # => 8
```

정규표현식 생성은 지금까지 생성했던 방식처럼 리터럴을 이용한 생성도 가능하지만 Regexp 클래스의 .new 메서드 또는 %r{...} 문법을 사용하여 생성이 가능하다.

%r{...}문법은 "/"를 포함한 정규표현식 생성에 유용하다.

```ruby
str = "Dog and Cat"
pp Regexp.new("Dog") =~ str # => 0
pp %r{Dog} =~ str # => 0
```

#### 정규표현식 옵션
|옵션|설명|
|:---:|---|
|i|대소문자 구분 옵션(대소문자 구별을 하지 않는다.)|
|o|정규표현식내 치환을 위한 평가를 한번만 진행|
|m|멀티라인 모드|
|x|확장모드 가독성을 위해 적절한 공백과 주석 활용이 가능하다.|

#### 패턴매치
정규표현식 객체를 생성하고 나면 **match, =~ !~**등의 연산자를 활용하여 문자열을 평가, 치환, 탐색 할 수 있다. 이때 연산을 위한 피연산자 중 하나는 정규표현식 객체여야 한다.  

루비에서 문자열이 표현식에 의해 매치가 되고 나면 특수 변수에 값이 저장되는데 대부분의 루비 프로그래밍에서는 MatchData를 사용하여 값을 활용한다. 

```ruby
def regexp_test(str, pattern)
  match = pattern.match(str)
  if match
    pp "#{match.pre_match} => #{match[0]} => #{match.post_match}"
  else
    pp "No match"
  end
end

regexp_test('hello my name is han juryeon', /is/) # => "hello my name  => is =>  han juryeon"
```

#### 복잡한 패턴
. | () [] {} + \ ^ $ * ? 를 제외한 문자들은 자기 자신을 나타내는 문자열에 매치된다. 특수 문자들을 매치하기 위해서는 앞에 역슬래쉬를 넣어주면 된다.

```ruby
require '../Regexp/regexp_4'

regexp_test('yes | no', /\|/) # => "yes  => | =>  no"
regexp_test('yes (no)', /\(no\)/) # => "yes  => (no) => "
regexp_test('are you sure?', /e\?/) # => "are you sur => e? => "
```

#### 앵커
정규표현식은 기본적으로 문자열에서 처음 찾는 부분에 매치가 된다. 만약 문자열의 맨앞과 맨뒤에만 매치가 되도록 하고 싶다면 **^, $** 기호를 사용하면 된다.

```ruby
str = "this is\nthe time"
regexp_test(str, /^the/)
regexp_test(str, /^this/)
regexp_test(str, /$is/)
regexp_test(str, /\Athe/)
regexp_test(str, /\Athis/)

=begin
"this is\n" + " => the =>  time"
" => this =>  is\n" + "the time"
"No match"
"No match"
" => this =>  is\n" + "the time"
=end
```

#### 문자 클래스
문자 클래스란 대괄호 안에 있는 문자들의 집합을 의미한다. [aeiou]는 모음의 집합이고 [,:;!?]은 구두점에 매치된다. 이러한 방식을 활용한 정규표현식 표현도 가능해진다.  

```ruby
str_2 = "Price $12."
regexp_test(str_2, /[aeiou]/)
regexp_test(str_2, /[\s]/)
regexp_test(str_2, /[.]/)

=begin
"Pr => i => ce $12."
"Price =>   => $12."
"Price $12 => . => "
=end
```

|시퀀스|의미|
|---|---|
|\d|십진수|
|\D|십진수를 제외한 모든 문자열|
|\h|십육진수 문자|
|\H|십육진수 문자를 제외한 모든 문자|
|\R|일반적인 줄바꿈 문자|
|\s|공백|
|\S|공백을 제회한 문자|
|\w|단어 문자|
|\W|단어 문자를 제회한 모든 문자|
|\X|확장 유니코드 문자소|

대괄호 내에서 c1-c2시퀀스를 사용시 두개의 시퀀스를 포함한 사이의 모든 문자와 매치가 된다.  

```ruby
a = 'see [The PickAxe-page 123]'
regexp_test(a, /[A-F]/)
regexp_test(a, /[A-Fa-f]/)
regexp_test(a, /[0-9]/)

=begin
"see [The Pick => A => xe-page 123]"
"s => e => e [The PickAxe-page 123]"
"see [The PickAxe-page  => 1 => 23]"
=end
```

#### 선택
**|** 기호는 역슬래쉬와 함께 사용해야 문자로 취급이 된다. 역슬래쉬로 사용하지 않는다면 표현식의 일부로 취급이 된다.

```ruby
b = 'red ball blue sky'
regexp_test(b, /d|e/) # => "r => e => d ball blue sky"
regexp_test(b, /al|lu/) # => "red b => al => l blue sky"
```

#### 그룹
괄호를 사용하여 정규 표현식 내부에서 일부를 그룹으로 묶어줄 수 있다.

```ruby
# 아래의 표현식은 하나의 a 와 하나 혹은 다수의 n에 매치된다.
regexp_test('banana', /an+/) # => "b => an => ana"
# 아래의 표현식은 하나 혹은 여러개의 an에 매치된다.
regexp_test('banana', /(an)+/) # => "b => anan => a"
```

그룹화 하여 매치된 결과는 다양한 방식으로 활용이 가능하다. 괄호는 매치된 결과를 모아주고 이러한 결과를 다른 정규표현식에서 사용하거나 루비 프로그램 내부에서 사용이 가능하다.

```ruby
/(\d\d):(\d\d)(..)/ =~ "12:50am"
pp "Hour is #{$1} Minute is #{$2}"

/((\d\d):(\d\d))(..)/ =~ "12:50am"
pp "Time is #{$1}"
pp "Hour is #{$2} Minute is #{$3}"
pp "AM/PM is #{$4}"

=begin
"Hour is 12 Minute is 50"
"Time is 12:50"
"Hour is 12 Minute is 50"
"AM/PM is am"
=end
```
동일한 형식으로 match메서드를 활용한다면 매치되는 인덱스값을 이용하면 된다.

또한 매치된 내용을 번호가 아닌 이름으로 참조 할 수 있으며 그룹을 시작하는 괄호에서 ?<..>형식을 사용하면 된다.

```ruby
/(?<hour>\d\d):(?<minute>\d\d)(?<am_or_pm>..)/ =~ "12:50am"
pp "Hour is #{hour}"
pp "Minute is #{minute}"
pp "AM/PM is #{am_or_pm}"

=begin
"Hour is 12"
"Minute is 50"
"AM/PM is am"
=end
```
---