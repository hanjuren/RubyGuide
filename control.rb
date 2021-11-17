# Ruby 제어문
# if .. else
if 1 < 2
  puts "1은 2보다 작습니다."
else
  puts "1은 2보다 작지 않습니다"
end

def greeter(arr)
  total = 0
  arr.each { |x| 
    if total < x
      total = x
    end
  } 
  return "이번학기 가장 높은 학점은 #{total}점 입니다." 
end

arr = [4, 3.5, 2.5, 3.0, 4.5]
result = greeter(arr)
puts result

# unless
unless 1 == 1
  puts "다르다."
else
  puts "같다"
end

# case문
arr = [4, 3.5, 2.5, 3.0, 4.5]
arr.each { |x|
  case x
  when 4.5
    puts "#{x}점은 A+ 입니다."
  when 4.0
    puts "#{x}점은 A 입니다."
  when 3.5
    puts "#{x}점은 B+ 입니다."
  when 3.0
    puts "#{x}점은 B 입니다."
  when 2.5
    puts "#{x}점은 C+ 입니다."
  when 2.0
    puts "#{x}점은 C 입니다."
  when 1.5
    puts "#{x}점은 D+ 입니다."
  when 1.0
    puts "#{x}점은 D 입니다."
  else
    puts "#{x} 점은 F 입니다."
  end
}