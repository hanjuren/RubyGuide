#
# Regexp 정규 표현식 변수, 메서드 인자로 활용하기
#
str = 'Dog and Cat'
# 변수에 대입하기
pattern = /Cat/
pp pattern =~ str

#
# new 메서드 %r{...}문법
#
pp Regexp.new("Dog") =~ str
pp %r{Dog} =~ str
