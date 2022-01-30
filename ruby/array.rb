# 배열은 객체 참조를 컬렉션으로 저장하며 각 위치는 정수로 표현된다.

# 리터럴 형식 배열 생성
arr1 = [1.234, "hanjuryeon", 23]
p arr1.class
p arr1.length

# Array 객체 사용
arr2 = Array.new
p arr2.class
p arr2.length
arr2[0] = "arr2"
arr2[1] = "arr2-1"
p arr2

# 배열 인덱스를 쌍으로 지정하여 새로운 배열 생성
arr = [1, 2, 3, 4, 5, 6, 7]
new_arr = arr[1, 3] # => 1번 인덱스 부터 3개
p new_arr
p arr.object_id
p new_arr.object_id

# 배열의 인덱스 범위 지정하기 
arr_index = [0, 1, 2, 3, 4, 5, 6, 7]
new_arr1 = arr_index[2..5] # => 시작 인덱스, 끝나는 인덱스 까지
p new_arr1
new_arr2 = arr_index[1...3] # =. 시작 인덱스, 끝나는 인덱스는 포함 안됨
p new_arr2

# 배열 대입 연산자
arr = [1, 2, 3]
p arr[0]
arr[0] = "han" # => 0번 인덱스 값이 1 에서 han으로 변경
p arr[0]
arr[5] = "Ju Ryeon" # => 배열 인덱스의 간격이 생기면 nil로 채워진다.
p arr # => ["han", 2, 3, nil, nil, "Ju Ryeon"]

arr = [1, 2, 3, 4, 5, 6, 7]
arr[2, 2] = "dog" # => 2번 인덱스 포함 두개의 값이 dog로 변경
p arr # [1, 2, "dog", 5, 6, 7]
arr[2, 0] = "cat" # => 두번째 인자인 길이 값이 0이라면 시작 인덱스의 다음 인덱스에 값이 추가
p arr # [1, 2, "cat", "dog", 5, 6, 7]
arr[1, 2] = [10, 11, 12] # => 1번 인덱스 포함 2개의 인덱스 값이 오른쪽 배열의 원소들로 채워진다.
p arr # [1, 10, 11, 12, "dog", 5, 6, 7]
arr[0..3] = [] # => 0번 인덱스 부터 3번 인덱스의 값을 없앤다.
p arr # ["dog", 5, 6, 7]
arr[5..7] = 101, 102, 103 # => 5번 인덱스 부터 7번 인덱스를 오른쪽 값으로 채운다 빈 간격은 nil로 채워진다.
p arr # ["dog", 5, 6, 7, nil, 101, 102, 103]

# push, pop 메서드를 사용하여 배열을 스택구조로 활용
stack = []
stack.push "red" # => push 메서드는 배열의 맨뒤 인덱스에 값을 추가 한다. 비어있을때는 첫 인덱스로 값이 들어간다.
stack.push("blue")
stack.push "green"
p stack # ["red", "blue", "green"]

stack.pop
p stack # => 맨 뒤 인덱스 값인 green이 삭제된다. ["red", "blue"]

# unshift, shift 메서드 사용하여 큐 활용하기
queue = [] # 큐는 선입 선출 구조
queue.push "red" # => 맨뒤에 값 추가
queue.push "blue"
queue.push "green"

queue.shift # => 맨 앞의 값인 red 삭제
p queue # ["blue", "green"]
