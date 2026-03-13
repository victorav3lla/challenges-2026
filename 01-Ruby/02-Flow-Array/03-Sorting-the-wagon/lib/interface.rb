require_relative "wagon_sort"

# TODO: Ask the user about students to add to the Wagon.
#       Remember, to read an input from the command line, use:
#       - `gets`:  https://ruby-doc.org/3.3.5/Kernel.html#method-i-gets
#       - `chomp`: https://ruby-doc.org/3.3.5/String.html#method-i-chomp

students = []
name = nil

while name != ""
  puts students.empty? ? "Enter a student name:" : "Enter another name (or press Enter):"
  name = gets.chomp
  students << name if name != ""
end

sorted_students = wagon_sort(students)
students_number = sorted_students.size

puts "There are #{students_number} students in the wagon"
if sorted_students.size >= 2
  puts "The students are: #{sorted_students[0..-2].join(', ')} and #{sorted_students.last}"
else
  puts sorted_students.first
end


# TODO: Then call `wagon_sort` method defined in the wagon_sort.rb
#       file and display the sorted student list
