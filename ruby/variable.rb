# 변수는 객체에 대한 참조를 저장하고 있다.

name = "Han JuRyeon"
puts "value : #{name}"
puts "object in a name : #{name.class}"
puts "object id is : #{name.object_id}"

# nema이란 변수에 객체 ID, 클래스, 값 등 문자열의 특징이 있다.
# 하지만 변수는 객체의 참조를 저장할 뿐 객체는 아니다. 

person1 = "Tim" # person1에는 Tim이라는 값이 있는 객체 정보가 참조된다.
person2 = person1 # person2는 person1이 참조하고 있는 객체가 복사되어 참조된다. 새로운 객체를 만들지 않는다.

person1[0] = "J" # 루비는 문자열 변경이 가능하다.

puts "hello #{person1}" # Tim에서 Jim으로 변경이 되었다.  => hello Jim
puts "hello #{person2}" # person2 또한 person1이 가르키는 객체와 동일한 객체를 참조하므로 person2또한 Jim으로 변경이 되어 출력된다. => hello Jim

# 객체를 참조하고 있는 변수가 늘어나는 것을 막기위해서는 변수이름.dup 메서드가 있다. 이는 같은 내용을 담은 새로운 객체를 생성해준다.
person3 = "Tim"
person4 = person3.dup

person3[0] = "J"

puts "hello #{person3}" # => hello Jim
puts "hello #{person4}" # => hello Tim

# 객체를 수정하지 못하게 동결 시키려면 변수이름.freeze 메서드를 사용한다.

person5 = "Han"
person6 = person5
person5.freeze # => can't modify frozen String
person6[0] = "K"