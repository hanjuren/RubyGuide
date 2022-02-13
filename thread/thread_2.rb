# pp Thread.current
# pp Thread.list

count = 0
pp "main #{Thread.current}"
threads = 3.times.map do |v|
  Thread.new do # 새로운 스레드가 10번 생성되며 각 스레드가 생성될때마다 v에 대해 접근이 모두 가능하다.
    pp "#{Thread.current}: #{v}"
    sleep(rand(0..1))
    Thread.current[:my_count] = count
    count += 1
  end
end

threads.each { |t| t.join; print t[:my_count], ', ' }