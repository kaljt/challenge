#student_name => current_grade



class School
  attr_accessor :students

  def initialize
    @students = {}
  end

  def add(name, grade)
    if students.has_key?(grade)
      students[grade] << name
    else
    students[grade] = [name]
    end
  end

  def grade(grade)
    if students.has_key?(grade)
    students.values_at(grade).flatten
  else
    []
  end
  end

  def to_h
    new_students = {}
    students.each do | grade, name |
      students[grade].sort!
    end
    keys = students.keys.sort
    keys.each do |key|
      new_students[key] = students.fetch(key)
    end
    new_students
  end


end