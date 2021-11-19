# 클래스
class Book # 대문자로 시작
  attr_reader :title, :price, :writer

  def initialize(title, price, writer)
    @title = title # @title은 생성되는 객체의 인스턴스 변수이다. 지역변수는 생성자 호출 이후 사라지므로 인스턴스 변수내에 저장해야 한다.
    @price = price
    @writer = writer
  end

  # 객체를 문자열로 출력해준다.
  def to_s
    "Book: title: #{@title}, price: #{@price}, writer: #{@writer}"
  end

  # 접근자 생성
  # 가격을 볼 수 있도록 접근자를 생성해주자
  # def get_price
  #   "Price: #{@price}원"
  # end

  def set_price=(price)
    @price = price
  end
end

book1 = Book.new("자바 프로그래밍", 28000, "홍길동")
book2 = Book.new("파이썬 프로그래밍", 45000, "임꺽정")

puts book1
puts book2

# 결과가 #<Book:0x000002012813f698> 이런식으로 나온다... 이는 puts가 간단한 표준 출력에 문자열을 더해주기만 할 뿐이라 그렇다.
# p 또는 객체를 문자열로 나타낼 수 있는 to_s 메서드를 사용하면 된다.
# 객체를 초기화 하면서 정의한 인스턴스 변수들은 객체의 인스턴스 메서드들에서 모두 참조가 가능하다.

# 클래스를 통해 생성한 인스턴스의 인스턴스 변수는 객체의 일관성을 위해 다른 경로로 접근이 불가능하다. 따라서 외부에서도 값에 접근하고 조작하는 메서드를 별도로 만들어 접근이 가능하도록 해준다.

# puts book1.get_price # Price: 28000원

puts book1.price # 28000

# 값을 수정하거나 대입하기 위해서 사용하는 메서드 자바의 Setter메서드를 루비에서는 메서드 이름뒤에 = 기호를 사용하여 생성한다.
book1.set_price = 30000
puts book1.price