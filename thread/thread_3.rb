class A
  def def1
    t = Thread.new do
      sleep(3)
      pp "10 sleep"
    end
  end
  def def2
    pp "hello hi"
  end
end

a = A.new
a.def1
a.def2
a.def2
a.def2
a.def2
def b(a)
  sleep(1)
end
5.times do
  b(a)
end