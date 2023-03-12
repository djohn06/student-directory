# Create an instance variable of the students
@students = [] # an empty array accessible to all methods

# Create method that prints the menu
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

# Create method for inputting students
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  
  name = STDIN.gets.chomp
# This means "while the name is NOT(!) empty do"
  while !name.empty? do
    # '<<'' adds the name as a hash into the students variable
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students.\n"
    # Requests the name of the next student. If filled empty the loop ends.
    name = STDIN.gets.chomp
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

# Create method that saves the students to a textfile
def save_students
  #First, open the file for writing
  file = File.open("students.csv", "w")
  #iterate over each student of the instance variable
  @students.each do |student|
    # We take the student data we've stored as a hash and input it as an array
    student_data = [student[:name], student[:cohort]]
    # We convert the array as a string by joining at ','
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  # Close the file at the end. All opened files must be closed at the end
  file.close
end

# Create method to load students into an hash
def load_students(filename = "students.csv")
  # We are only reading the content
  file = File.open(filename, "r")
  # The '.readlines' method takes individual lines and returns it as an array
  file.readlines.each do |line|
  # Assigning two variables together is called a 'Parallel Assignment'. The
  # first value to the first variable, second value => second variable, etc
  name, cohort = line.chomp.split(",")
  # Use the 'shovel operator' & convert cohort to symbol for consistency
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

# Create a method to load students who were previously written in 'students.csv'
def try_load_students
  # Give the first argument from the command line
  filename = ARGV.first
  # If nothing is given, get out of the method
  return if filename.nil?
  # If the method does exist
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # If the name doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # Exit out the program
  end
end

# Method to use an interactive menu
def interactive_menu
  loop do
    print_menu
    selection = STDIN.gets.chomp
    # create a case for the selection
    case selection
      when "1"
        # inputs the students
        input_students
      when "2"
        show_students
      when "3"
        save_students
      when "4"
        load_students
      when "9"
        exit # this will terminate the program
      else
        puts "\nI don't know what you meant, please try again."
    end
  end
end

# Load the students and run the interactive menu which utilises all
# the methods created.
try_load_students
interactive_menu