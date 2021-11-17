# class 
class Student
  @@count = 0
  @@students = Hash.new
  
  def get_student
    @@students.each { |x, y| puts "#{x} #{y}" }
  end
  
  def add_student(name, grade, age)
    p "hello"
    new_student = {
      "name" => name,
      "grade" => grade,
      "age" => age
    }
    @@students[@@count] = new_student
    @@count += 1
  end
end



student = Student.new
student.add_student("han", 3, 35)
student.add_student("h", 2, 25)
student.get_student