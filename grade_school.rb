# class School for student/grade-level
class School
  attr_accessor :students

  def initialize
    @students = {}
  end

  def add(name, grade)
    if students.key?(grade)
      students[grade] << name
    else
      students[grade] = [name]
    end
  end

  def grade(grade)
    students.fetch(grade, [])
  end

  def to_h
    students.sort.each { |student| student[1].sort! }.to_h
  end
end
