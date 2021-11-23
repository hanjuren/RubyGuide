num = 10001
5.times do
  puts "#{num.class} : #{num}"
  num *= num
end
# 2.4 부터 Fixnum Bignum은 Integer로 통합

n1 = 111_111_111111
p n1

some_file = File.open('./number.txt')
some_file.each do |line|
  v1, v2 = line.split
  print Integer(v1) + Integer(v2), " "
end

# 숫자를 사용한 반복
3.times { puts "hello" }
1.upto(5) { puts "hi" }
5.downto(1) { puts "안녕" }
1.step(11, 2) { puts "건너뛰기" }