# 메서드 정의
def hello
  puts "hello juryeon"
end

hello # 메서드 호출

# 메서드에 인자 전달
def printMyName(name)
  return "hello #{name}"
end
result = printMyName("han")
puts result