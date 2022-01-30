# 해시
# 키와 값으로 구성 키는 문자형 숫자형 심벌 등 어떤 객체로든 사용이 가능하다.

# 객체 리터럴 사용하여 객체 생성
animal = {
  "dog" => "canian",
  "cat" => "feli",
  "monkey" => "banan"
}
p animal["dog"] #  => "canian"
animal["cow"] = "bob"
p animal["cow"] # => "bob"

# 키를 심벌로 사용
animal = {
  :dog => "canian",
  :cat => "feli"
}
p animal[:dog]
# 키가 심벌인 경우에는 심벌 앞 : 을 지우고 => 를 : 로 대체 할 수 있다.
animal = {
  dog: "canian",
  cat: "feli"
}

animal_cnt = 0
animal.each { |key, value|
  p "#{key} : #{value}"
  animal_cnt += 1
}
p animal_cnt

# 해시, 배열을 사용하여 단어의 출연 빈도를 세보기
# 정규 표현식은 아직이지만 단어 문자와 작은 따옴표를 포함하여 분리해주는 [/w'] 표현식을 사용하자.

# 주어진 단어를 배열로 만드는 메서드
text = %{Nest (NestJS) is a framework for building efficient, scalable Node.js server-side applications. It uses progressive JavaScript, is built with and fully supports TypeScript (yet still enables developers to code in pure JavaScript) and combines elements of OOP (Object Oriented Programming), FP (Functional Programming), and FRP (Functional Reactive Programming).}
def string_to_array(text)
  text.downcase.scan(/[\w']+/)
end

def count_text_array(arr)
  counts = Hash.new(0) # 기본값을 0으로 한 해시 생성
  for word in arr
    counts[word] += 1
  end
  counts
end
text_arr = string_to_array(text)
count_hash = count_text_array(text_arr)
p count_hash

# 단어별로 갯수가 추가된 해시를 빈도수로 정렬하기 위해서는 Hash의 sort_by메서드를 사용한다. 오름차순
# sort_by 내림차순은 .reverse 또는 -value
sort_hash = count_hash.sort_by { |word, count| count }.reverse

# 예제에서는 상위 5개만 가져왔는데 1번만 나온 단어를 제외한 단어들을 가져오도록 해보자.

# top_five = Array.new
# for i in sort_hash
#   if i[1] > 1
#     top_five.push(i)
#   end
# end => 일반적인 for문 또는
top_five = Hash.new
sort_hash.each do |word, count|
  if count > 1
    top_five[word] = count
  end
end
p top_five

