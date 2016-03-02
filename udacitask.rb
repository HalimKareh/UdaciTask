require_relative 'todolist.rb'

# Creates a new todo list
list = TodoList.new("Halim's ASAP To Do List")

# Add four new items
list.add_item("Update CV")
list.add_item("Udacity--RubyND project")
list.add_item("OS midterm")
list.add_item("RDV with Friends")

# Add Due Dates
list.items[0].set_due_date("27/03/2016")
list.items[1].set_due_date("27/04/2016")
list.items[2].set_due_date("16/03/2016")


# Change percentages of completion
list.items[0].set_percentage(22)
list.items[1].set_percentage(15)
list.items[2].set_percentage(54)
list.items[3].set_percentage(33)

# Change priority
list.items[0].set_item_priority(2)
list.items[1].set_item_priority(1)
list.items[2].set_item_priority(4)
list.items[3].set_item_priority(66)#to test flexibility

# Print the list
puts
puts "Step 1, Print the list --->"
puts
puts list

# Sort by percentages
puts
puts "Step 2 --->"
puts "This is the list sorted by percentage of completion."
puts
list.sort_by_percentage
puts list

# Sort by priority

puts
puts "Step 3 --->"
puts "This is the list sorted by priority"
puts
list.sort_by_priority
puts list

# Delete the first item

list.delete_item_at(0)

# Print the list
puts
puts "Step 4 --->"
puts
puts list

# Delete the second item

list.delete_item_at(1)

# Print the list
puts
puts "Step 5 --->"
puts
puts list

# Update the completion status of the first item to complete

list.items[0].task_completed

# Print the list
puts
puts "Step 6 --->"
puts "First item completed"
puts
puts list

# Update the title of the list

list.rename_list("Halim's Renamed ASAP To Do List")

# Print the list
puts
puts "Step 7 ---> "
puts "The list is now renamed"
puts
puts list

# Add Random items to test other functions
# Add 5 new items
list.add_item("Update CV")
list.add_item("Feed the dog")
list.add_item("Music hoemwork")
list.add_item("Play golf")
list.add_item("Learn Spanish")

# Add Due Dates
list.items[3].set_due_date("01/03/2016")
list.items[4].set_due_date("22/04/2016")
list.items[5].set_due_date("16/03/2016")


# Change percentages of completion

list.items[4].set_percentage(100)
list.items[1].set_percentage(15)
list.items[2].set_percentage(54)
list.items[3].set_percentage(33)

# Change priority
puts
puts "Step 8 --->"
puts"Notice that setting the percentage to a 100 calls task_completed"
list.items[0].set_item_priority(2)
list.items[1].set_item_priority(1)
list.items[5].set_item_priority(3)
puts list

# Sort by completion with true first
puts
puts "Step 9 --->"
puts "Sorts list by putting the completed tasks first"
puts
list.sort_by_completion_status_t
puts list

# Sort by completion with false first
puts
puts "Step 10 --->"
puts "Sorts list by putting the incomplete tasks first"
puts
list.sort_by_completion_status_f
puts list

# Sorts the list alphabetically
puts
puts "Step 11 --->"
puts "Sorts list alphabetically"
puts
list.sort_alphabetically
puts list

# Marks the list as complete
puts
puts "Step 12 --->"
puts "Marks the entire list as complete"
puts
list.list_completed
puts list
# Print to Do List to file TextTodoList
puts
puts "Step  13 ---> "
list.print_to_file
puts "#{list.title} has been printed to TextTodoList."


#sort by creation date
#sort by priority
#sort by due date
