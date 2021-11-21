class SampleClass
  def method1 # => 아무런 인자 없이 메서드를 사용한다면 public 메서드가 된다. public는 기본값이다.
    # ... 
  end

protected # 여기서 부터 선언하는 메서드는 protected로 적용이 된다.
  def method2 # => protected 선언 메서드
    # ...
  end

private # 여기서 부터 선언하는 메서드는 private로 적용이 된다.
  def method3 # => private 메서드
    # ... 
  end

public # 여기서 부터 선언하는 메서드는 public로 적용이 된다.
  def method4 # => public 메서드
    # ...
  end

# 또는 접근제어 함수 뒤에 인자로 메서드 이름을 적어주는 방법도 있다.
  def method5
    # ...
  end
  def method6
    # ...
  end
  def method7
    # ...
  end
  public :method5
  protected :method6
  private :method7
end

class Account
  attr_accessor :balance
  def initialize(balance)
    @balance = balance
  end
end

class Transaction
  def initialize(account_a, account_b)
    @account_a = account_a
    @account_b = account_b
  end

private
  def debit(account, amount)
    account.balance -= amount
  end

  def credit(account, amount)
    account.balance += amount
  end

public
  def transfer(amount)
    debit(@account_a, amount)
    credit(@account_b, amount)
  end
end

saveing = Account.new(100)
check = Account.new(200)
p saveing.balance
p check.balance

trans = Transaction.new(saveing, check)
trans.transfer(50)
trans.debit(saveing, 50)

p saveing
p check