#
# =~ 기호를 사용하여 패턴과 문자열의 매칭 여부 파악하기
#

re_1 = /cat/ =~ 'dog and cat'
re_2 = /cat/ =~ 'catch'
re_3 = /cat/ =~ 'Cat'

pp re_1
pp re_2
pp re_3

#
# =~ 연산 결과를 조건문에서 활용하기
#

str = 'dog and cat'
if /cat/ =~ str
  pp 'true'
else
  pp 'false'
end

#
# !~ 연산자
#

pp /cat/ !~ 'dog and cat'
pp /cat/ !~ 'Cat'