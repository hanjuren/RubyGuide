## Ruby
👍 Ruby 기본 문법 학습을 위한 레파지토리 입니다.

루비는 객체 지향 언어이다.


### 네이밍 규칙
지역 변수 : 소문자나 _ 기호로 시작해야 된다. *ex) name, count*
인스턴스 변수 : @ 기호로 시작해야 한다. *ex) @name, @count*
전역 변수 : $ 기호로 시작해야 한다. *ex) $name, $count*
클래스 변수 : @@ 기호로 시작해야 한다. *ex) @@name, @@count*
클래스 이름 : 대문자로 시작해야 한다. *ex) String, Song*
상수 이름 : 대문자로 시작한다. *ex) STRING, ABC_DE*

### 배열과 해시
두가지 모두 key를 통해 value에 접근할 수 있는 객체 모음이다.   
객체는 key에 어떠한 객체를 사용해도 된다. 하지만 배열은 정수만 가능하다.

### 코드 블록
{}기호 또는 do end로 구성된다. 루비의 표준 코드 양식에는 한줄의 코드는 중괄호를 여러줄의 코드는 do end로 작성하도록 나와 있다.

### 접근제어
**클래스의 접근 제어**
1. *public* 누구나 호출이 가능하며 별도의 접근 제어를 두지 않는다.
2. *protected* 객체를 정의한 클래스, 하위 클래스에서만 접근이 가능하다.
3. *private* 메서드를 호출하는 수신자는 항상 *self*이며 현재 객체의 문맥 아래서만 호출이 가능하다. 이는 다른 객체의 메서드에는 접근이 불가능 하다는 의미다.

이러한 접근 제어가 루비에서는 정적으로 결정되지 않고 동적으로 결정된다.

### 클래스 상속
모든 클래스는 Object클래스를 부모로 삼는다.

### 모듈
메서드와 클래스, 상수를 하나로 묶는 수단
**장점**
1. 이름이 충돌하는 것을 막아준다.
2. 믹스인 공간을 구현하는 데 사용한다.

### 믹스인
클래스 선언시 모듈을 포함하면 모듈의 인스턴스 메서드가 클래스의 인스턴스 메서드 처럼 동작하게 된다.

### 데이터 타입
1. 숫자
   1. 정수
   2. 부동소수점
   3. 유리수
   4. 복소수
정수의 길이는 정해지지 않는다. 사용하는 시스템의 메모리 크기에 의해 결정된다.

2. 문자열
   1. String 클래스의 객체이다.

3. 범위
   1. 시퀀스
      * "..", "..." 기호 사용
      * .. 기호는 경계를 포함
      * ... 기호는 경계의 끝을 포함하지 않음 
  2. 조건으로 표현
  3. 범위로 간격표현

