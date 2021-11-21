file = File.open("test.md")
# file.each do |line|
#   puts "The line is : #{line}"
# end
file.each.with_index do |line, idx|
  puts "This line index #{idx+1} : #{line}"
end

# collect 블록에서 처리한 결과겂을 모은 새로운 배열
arr = [1, 2, 3, 4, 5]
new_arr = arr.collect { |value| value*2 }
# p new_arr

# map과 collect는 비슷
a = [1, 2, 3, 4, 5]
b = [1, 2, 3, 4, 5]

new_a = a.map { |value| value * 2 }
p new_a

# 추가로 js 와 다르게... map을 돌리면 조건에 부합하지 않은 값은 nil로 처리가 되서 반환된다.. ruby 2.7에서부터 적용된 filter_map을 이용하면 될 듯 하다.
new_b = b.filter_map do |value|
  if value > 2
    value
  end
end
p new_b

# inject
p [1, 2, 5, 7].inject(0) { |sum, element| sum+element }
p [1, 2, 5, 7].inject(1) { |product, element| product*element }
# inject메서드에 넘긴 매개변수는 초기값이다. 이렇게 초기화 해서 작성을 해도 되지만 매개변수 없이 실행하면 처음 요소가 초기값이 되고 두 번째 값부터 반복을 시작한다. 

p [1, 2, 5, 7].inject { |sum, element| sum+element }
p [1, 2, 5, 7].inject { |product, element| product*element }

b = []
[1, 2, 3].each_with_index { |v, i| b << [v, i] }
p b

str = "hanjuren"
result = []
# str.each_char { |v| result << v }
str.each_char.each_with_index { |v, i| result << [v, i] }
p result

re = str.enum_for(:each_char)
re.each { |v| p v }
p re.to_a

def Integer.all
  Enumerator.new do |yielder, n: 0|
    loop { yielder.yield( n += 1) }
  end.lazy
end

def palindrome?(n)
  n = n.to_s
  n == n.reverse
end
p Integer.all.select{ |i| (i % 3).zero? }.select{ |i| palindrome?(i) }.first(5)