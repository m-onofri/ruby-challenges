# Write a small archiving program that stores students' 
# names along with the grade that they are in.

# In the end, you should be able to:

#     Add a student's name to the roster for a grade
#         "Add Jim to grade 2."
#         "OK."
#     Get a list of all students enrolled in a grade
#         "Which students are in grade 2?"
#         "We've only got Jim just now."
#     Get a sorted list of all students in all grades. 
#     Grades should sort as 1, 2, 3, etc., and students 
#     within a grade should be sorted alphabetically by name.
#         "Who all is enrolled in school right now?"
#         "Grade 1: Anna, Barb, and Charlie. Grade 2: Alex, Peter, and Zoe. Grade 3…"

# Note that all our students only have one name. 
# (It's a small town, what do you want?)

class School

  def initialize
    @archive = Hash.new { |archive, st_grade| archive[st_grade] = [] }
  end

  def to_h
    @archive.sort.map { |st_grade, names| [st_grade, names.sort] }.to_h
  end

  def add(name, st_grade)
    @archive[st_grade] << name
  end

  def grade(st_grade)
    @archive[st_grade]
  end

end







