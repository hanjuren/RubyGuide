## Ruby Debugger
루비는 기본적으로 디버거를 내장하여 제공되며 인터프리터 실행 시 스크립트의 이름, 다른 옵션과 함께 *-r debug* 옵션으로 실행할 수 있다.  
```shell
ruby -r debug <디버그 옵션> <파일> <인자>
```

루비 디버거는 통상적인 범주의 기능을 대부분 포함하여 제공되며 중단점 설정, 스택 프레임과 변수 출력, 특정 객체나 클래스에 대한 인스턴스 메서드 나열하거나  
루비내 개별 스레드를 나열, 제어 할 수 있다.

### 코드 실행이 너무 느리다면
루비는 인터프리터 방식의 고수준 언어로 저수준 언어인 C언어 만큼 빠르지않다. 일반적으로 느리게 동작하는 프로그램들은 한두개의 병목, 즉 실행시간을 잡아먹는 부분이 있다.  
이러한 부분들을 찾아 개선해 나간다면 속도 개선과 함께 원활한 프로그램 수행이 될것이다.

루비에서 이러한 사항들을 잡기 위해 제공되는 기본 모듈에는 Benchmark 모듈과, 루비 프로파일러가 제공된다.  

#### Benchmark Module
코드의 일부분을 실행하는데 걸리는 시간을 측정하기 위한 모듈로 메서드 호출에 대한 오버헤드가 어느정도인지 측정하고자 한다거나 다양한 상황에서 사용이 가능하다.  

```ryby
# benchmark_ex.rb

require 'benchmark'
include Benchmark

LOOP_COUNT = 1_000_000

bmbm(12) do |test|
  test.report("inline:") do
    LOOP_COUNT.times do |x|
      # not working
    end
  end

  test.report("method:") do
    def method
      # not working
    end
    LOOP_COUNT.times do |x|
      method
    end
  end
end
```
```shell
ruby benchmark_ex.rb

Rehearsal ------------------------------------------------
inline:        0.034902   0.000045   0.034947 (  0.034986)
method:        0.044333   0.000015   0.044348 (  0.044364)
--------------------------------------- total: 0.079295sec

                   user     system      total        real
inline:        0.029713   0.000016   0.029729 (  0.029765)
method:        0.044063   0.000017   0.044080 (  0.044093)
```

#### Profiler
프로파일러는 프로그램 내의 각 메서드가 몇번 호출되었는지 루비가 해당메서드에 머물렀던 평균 및 누적 시간을 측정해준다.  
명령행 옵션 -r profile 또는 코드내 require 'profile' 을 사용하여 측정할 수 있다.