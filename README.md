## Ruby Data Types
1. string = 문자열
2. number = 숫자
3. boolean = true || false

## Ruby Naming
지역변수, 메서드 매개변수, 메서드 이름은 소문자, 밑줄로 시작
*ex : name, get_hello*

전역변수는 $ 기호로 시작한다.
*ex : $name, $count*

인스턴스 변수는 @ 기호로 시작한다.
*ex : @name, @point*

클래스 변수는 @@ 기호로 시작한다.
*ex : @@name, @@count*

클래스이름, 상수, 모듈 이름은 대문자로 시작한다.
*ex : Student, String*

## 제어문
*if문*
```ruby
if 1 < 2
  puts "1은 2보다 작습니다."
else
  puts "1은 2보다 작지 않습니다."
end
```

*unless*
조건이 false일때 실행됨
```ruby
unless 1 == 1
  puts "다르다."
else
  puts "같다"
end
```