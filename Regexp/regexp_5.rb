#
# 특수문자
#
require '../Regexp/regexp_4'

regexp_test('yes | no', /\|/)
regexp_test('yes (no)', /\(no\)/)
regexp_test('are you sure?', /e\?/)

#
# 앵커
#
str = "this is\nthe time"
regexp_test(str, /^the/)
regexp_test(str, /^this/)
regexp_test(str, /$is/)
regexp_test(str, /\Athe/)
regexp_test(str, /\Athis/)

#
# 문자 클래스
#
str_2 = "Price $12."
regexp_test(str_2, /[aeiou]/)
regexp_test(str_2, /[\s]/)
regexp_test(str_2, /[.]/)

#
# 대괄호 시쿼스 사용
#
a = 'see [The PickAxe-page 123]'
regexp_test(a, /[A-F]/)
regexp_test(a, /[A-Fa-f]/)
regexp_test(a, /[0-9]/)

#
# 선택
#
b = 'red ball blue sky'
regexp_test(b, /d|e/)
regexp_test(b, /al|lu/)

#
# 그룹
#
regexp_test('banana', /an+/)
regexp_test('banana', /(an)+/)

/(\d\d):(\d\d)(..)/ =~ "12:50am"
pp "Hour is #{$1} Minute is #{$2}"

/((\d\d):(\d\d))(..)/ =~ "12:50am"
pp "Time is #{$1}"
pp "Hour is #{$2} Minute is #{$3}"
pp "AM/PM is #{$4}"

/(?<hour>\d\d):(?<minute>\d\d)(?<am_or_pm>..)/ =~ "12:50am"
pp "Hour is #{hour}"
pp "Minute is #{minute}"
pp "AM/PM is #{am_or_pm}"