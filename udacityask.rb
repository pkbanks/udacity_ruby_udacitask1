require_relative 'todolist.rb'


# Creates a new todo list
list = TodoList.new('My To Do List')
items = [
	['coding', 'get latest version of ruby'],
	['coding','submit ruby project'],
	['bills', 'pay cable'],
	['coding', 'push to github'],
	['friends', 'schedule brunch with Monica'],
	['home', 'get lightbulbs'],
	['home', 'grocery shopping']
]
# Add four new items
for item in items
	list.add_item(item[0],item[1])
end

# Print the list
puts list

list.items.last.update_priority
puts "// Item [#{list.items.last}], updated to priority status.\n\n"

puts list

# Delete the first item
list.remove_item(0)
puts "// Item [#{list.items.first}], has been removed.\n\n"

# Print the list
puts list

# Delete the second item
list.remove_item(1)

# Print the list
puts list

# Update the completion status of the first item to complete
list.items[0].update_status
list.items[2].update_status

# Print the list
puts list

# Update the title of the list
list.title = 'My Achievements'

# Print the list
puts list

