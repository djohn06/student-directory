# Create method for inputting students
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
# Create an empty array for the students that will eventually fill it.
  students = []
  name = gets.chomp
# This means "while the name is NOT(!) empty do"
  while !name.empty? do
    # '<<'' adds the name as a hash into the students array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students."
    # Requests the name of the next student. If filled empty it ends the loop.
    name = gets.chomp
  end
  # Return the array of students.
  students
end

def print_header
  puts "The students of Villians Academy"
  puts "----------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students."
end

# We let students = input_students so the following methods can run it.
students = input_students

print_header
print(students)
print_footer(students)