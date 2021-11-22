module Debug
  def who_am_i
    p "#{self.class.name} (id: #{self.object_id}) : #{self.name}"
  end
end

class Phon
  include Debug
  attr_reader :name

  def initialize(name)
    @name= name
  end
end

class Cat
  include Debug
  attr_reader :name
  def initialize(name)
    @name = name
  end
  # def who_am_i(name)
  #   puts "hello my name is #{name}"
  # end
end

ph = Phon.new("West End Blues")
ph.who_am_i

c = Cat.new("hello")
c.who_am_i