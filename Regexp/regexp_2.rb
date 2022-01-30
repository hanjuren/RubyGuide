#
# sub 메서드로 패턴과 일치하는 문자열 치환하기
#

str = 'Dog and Cat'
new_str = str.sub(/Cat/, 'Rabbit')
pp new_str

#
# gsub 메서드 활용
#
str_2 = "ababab"
new_str_2 = str_2.gsub(/a/, '*')
pp new_str_2