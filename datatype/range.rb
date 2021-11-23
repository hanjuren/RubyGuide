arr =  (1..10).to_a
p arr

num = gets.to_f

case num
when 0...1
  puts "0"
when 1...3
  puts "1 ~ 2"
when 3...10
  puts "3 ~ 9"
else 
  puts "big"
end