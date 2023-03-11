# Create an instance variable of the students
@students = [] # an empty array accessible to all methods

# Create method that prints the menu
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

# Create method for inputting students
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  
  name = gets.chomp
# This means "while the name is NOT(!) empty do"
  while !name.empty? do
    # '<<'' adds the name as a hash into the students variable
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students.\n"
    # Requests the name of the next student. If filled empty the loop ends.
    name = gets.chomp
  end
  # Return the variable of students.
  @students
end

# Method to print the header
def print_header
  puts "The students of Villians Academy"
  puts "----------------"
end

# Method for printing each students name in the instance variable
def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

# Method to print the footer & overall number of students
def print_footer
  puts "\nOverall, we have #{@students.count} great students."
end

# Create method that 'shows' the students.
def show_students
  print_header
  print_student_list
  print_footer
end

# Method to use an interactive menu
def interactive_menu
  loop do
    print_menu
    selection = gets.chomp
    # create a case for the selection
    case selection
      when "1"
        # inputs the students
        input_students
      when "2"
        show_students
      when "9"
        exit # this will terminate the program
      else
        puts "\nI don't know what you meant, please try again."
    end
  end
end

# We let students = input_students so the following methods can run it.
interactive_menu