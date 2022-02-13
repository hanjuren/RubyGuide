## 멀티 스레드
> 새로운 스레드 만들기  

예제 코드
```ruby
require 'net/http'

pages = %w(www.naver.com www.google.com www.youtube.com)

threads = pages.map do |page|
  Thread.new(page) do |url|
    http = Net::HTTP.new(url, 80)
    pp "Fetching: #{url}\n"
    res = http.get('/')
    pp "Got #{url}: #{res.message}"
  end
end
threads.each do |thr|
  thr.join
end
```
Thread.new 호출 후 스레드에서 실행할 코드를 블록으로 전달한다.  
pages 의 url 을 스레드를 생성하는 블록에 그대로 전달하지 않는 이유는 스레드가 생성되는 시점에서 존재하는 모든 전역변수 지역변수 인스턴스 변수를 공유하는데  
이때 생성되는 세개의 스레드 모두가 하나의 url 변수를 공유하게 된다.  
1번 스레드가 생성될때 url 값인 네이버에 대한 처리를 하는 동안 반복문에서는 다른 스레드를 생성하며 url 변수를 구글로 전달하려 하는데 이때 네이버에 대한 처리가 완료되지 않는다면 구글이 갑자기 네이버로 바뀌는 경우가 생길 수 있기 때문이다.  
이러한 버그를 예방하기 위해서 스레드가 생성될 때 전달하는 블록내에서 지역변수를 활용하는 것이다.

이러한 스레드를 조작하기 위해서는 어떻게 해야 할까.

루비 프로그램이 종료되면 모든 스레드는 강제적으로 종료되어 버리는데 만약 3개의 url 에대한 처리가 완료되지 않았는데 루비 프로그램이 종료되면 처리가 완료되지 않아도 스레드의 작업이 중지된다.  
하지만 join 메서드를 사용하면 프로그램이 종료되어도 스레드가 일을 완료하도록 기다려주는 역할을 한다.

### 스레드 변수 공유
스레드는 생성 시점에서 유효 범위 내 모든 전역, 인스턴스, 지역 변수들에 대해 접근이 가능하다. 그리고 스레드 코드를 담는 블록 내부 지역 변수는 해당 스레드에서만 지역 변수이며 다른 스레드에서는 접근이 불가능하다.  
이때 스레드의 지역변수를 메인 스레드나 다른 스레드에서도 접근 하게끔 하려면 스레드 내부 지역변수에 심벌을 사용하면 가능해진다.

```ruby
count = 0
pp "main #{Thread.current}"
threads = 3.times.map do |v|
  Thread.new do # 새로운 스레드가 10번 생성되며 각 스레드가 생성될때마다 v에 대해 접근이 모두 가능하다.
    pp "#{Thread.current}: #{v}"
    sleep(rand(0..1))
    Thread.current[:my_count] = count
    count += 1
  end
end

threads.each { |t| t.join; print t[:my_count], ', ' }
```
