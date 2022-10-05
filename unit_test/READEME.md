## 단위 테스트
모든 소프트웨어는 계층적 구조로 되어있다. 따라서 모든 시스템 전체를 하나의 테스트 대상으로 보는 테스트와 다르게 작은 단위 하나하나를 테스트 대상으로 보는  
단위 테스트는 보통 메서드 하나를 단위로 테스트 범위를 지정하여 진행한다.  

루비언어에서는 단위 테스트 프레임워크로 **MiniTest, Test::Unit**를 지원하고있다. 

> 프레임워크  
> 개별 테스트를 표현하는 방법을 제공한다.  
> 테스트를 구조화하는 프레임워크를 제공한다.  
> 테스트 수행을 위한 유연한 방법을 제공한다.

### 단언
테스트 내에서 if 문을 길게 나열하여 테스트를 하는 것을 피하기 위해 단언이라는 개념을 사용한다.  
단언문은 기대결과를 적고 실제 결과와 비교하는 방식을 기본으로 진행된다.

```ruby
class Roman
  MAX_ROMAN = 4999
  def initialize(value)
    if value <= 0 || value > MAX_ROMAN
      fail "Roman values must be > 0 and <= #{MAX_ROMAN}"
    end
    @value = value
  end

  FACTORS = [
    ["m", 1000],
    ["cm", 900],
    ["d", 500],
    ["cd", 400],
    ["c", 100],
    ["sc", 90],
    ["l", 50],
    ["xl", 40],
    ["x", 10],
    ["ix", 9],
    ["v", 5],
    ["iv", 4],
    ["i", 1],
  ]

  def to_s
    value = @value
    roman = ""
    for code, factor in FACTORS
      count, value = value.divmod(factor)
      roman << code * count
    end
    roman
  end
end
```

```ruby
require_relative 'roman'
require 'test/unit'
class TestRoman < Test::Unit::TestCase

  def test_simple
    assert_equal("i", Roman.new(1).to_s)
    assert_equal("ix", Roman.new(9).to_s)
    assert_equal("ii", Roman.new(2).to_s)
    assert_equal("iii", Roman.new(3).to_s)
  end
end
```

> result  
> ```shell
>Loaded suite test_1
>Started
>.
>Finished in 0.001155 seconds.
>-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
>1 tests, 4 assertions, 0 failures, 0 errors, 0 pendings, 0 omissions, 0 notifications
>100% passed
>-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
>865.80 tests/s, 3463.20 assertions/s
>
>```  

### Rspec
1. install rspec

```ruby
class TennisScorer
  OPP = { :server => :receiver, :receiver => :server }

  def initialize
    @score = { :server => 0, :receiver => 0 }
  end
  def score
    "#{@score[:server]*15}-#{@score[:receiver]*15}"
  end
  def give_point_to(player)
    other = OPP[player]
    fail "unkown player #{player}" unless other
    @score[player] += 1
  end
end
```
```ruby
require_relative 'tennis'
describe 'Tennis Score' do
  before(:each) do
    @ts = TennisScorer.new
  end
  it 'should start with a score of 0-0' do
    @ts.score.should == "0-0"
  end
  it 'should be 15-0 if the server wins a point' do
    @ts.give_point_to(:server)
    @ts.score.should == "15-0"
  end
  it 'should be 0-15 if the receiver wins a point' do
    @ts.give_point_to(:receiver)
    @ts.score.should == "0-15"
  end
end
```

### Shoulda
1. install shoulda

```ruby
require 'test/unit'
require 'shoulda'
require_relative 'tennis'

class TennisScoreTest < Test::Unit::TestCase
  # Test Method
  def assert_score(target)
    assert_equal(target, @ts.score)
  end

  context 'tennis score' do
    setup do
      @ts = TennisScorer.new
    end

    should "start with a score of 0-0" do
      assert_score("0-0")
    end

    should "be 15-0 if the server wins a point" do
      @ts.give_point_to(:server)
      assert_score("15-0")
    end

    should "be 0-15 if the receiver wins a point" do
      @ts.give_point_to(:receiver)
      assert_score("0-15")
    end

    should "be 15-15 after they both winc a point" do
      @ts.give_point_to(:server)
      @ts.give_point_to(:receiver)
      assert_score("15-15")
    end
  end
end
```