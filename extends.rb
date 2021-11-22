# 상속

class Parent
  def say_hello
    puts "Hello from #{self}"
  end
end

parent = Parent.new
parent.say_hello

class Child < Parent
end

child = Child.new
child.say_hello
puts Child.superclass
puts Parent.superclass
puts Object.superclass