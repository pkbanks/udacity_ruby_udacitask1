require_relative 'todolist.rb'


# Creates a new todo list
list = TodoList.new('My To Do List')
items = []
item_descriptions = [
	'feed the dog',
	'pay bills',
	'submit ruby project',
	'make dinner plans'
]
# Add four new items
for description in item_descriptions
	list.add_item(Item.new(description))
end

# Print the list
puts list


# Delete the first item
list.remove_item(0)

# Print the list
puts list

# Delete the second item
list.remove_item(1)

# Print the list
puts list

# Update the completion status of the first item to complete
list.items[0].update_status

# Print the list
puts list

# Update the title of the list
list.title = 'new title'

# Print the list
puts list


