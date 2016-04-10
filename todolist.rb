class TodoList
	attr_reader :title, :items

  # methods and stuff go here
  def initialize(list_title)
  	@title = list_title
  	@items = Array.new
  end

  def title=(title)
  	# update title
  	@title = title
  end

  def add_item(category, description)
  	# add an item
  	item = Item.new(category, description)
  	@items.push(item)
  end

  def remove_item(index)
  	# removes item at index, returns the item
  	return @items.delete_at(index)
  end

  def print(sort_by_category=true, include_header=true)
  	# returns a string that can be puts or exported to a file
  	# optionally includes header
  	result = ""
  	result += get_header if include_header
  	items = @items

  	if sort_by_category
  		# sorty by category
  		items = items.sort{ |a, b| a.category <=> b.category }
  	end

  	# sort by status, with incomplete items sorted at the top
  	items = items.sort_by { |item| item.completed_status ? 0 : 1 }

  	# print out the unfinished items
  	for item in items do
  		result += item.print
  	end

  	return result + "\n"
  end

  def to_s
  	# makes it easy to print the list, merely by 'puts list' command
  	return self.print
  end

  def get_header(char = "-", num = 4)
  	# char is a string
  	# num is an integer
  	# char and num are character settings for the header that flank the title
  	result = line_break(char, num) + "  " + @title + "  " + line_break(char, num) + "\n"
  	result += "STATUS\tCATEGORY\tDESCRIPTION\n"
  end

end

class Item

		attr_reader :description, :completed_status, :category, :priority
		
    # methods and stuff go here
    def initialize(category, description)
    	# category (string), designed for grouping items by category
    	# description (string)
    	@description = description
    	@completed_status = false
    	@priority = false
    	@category = category
    end

    def update_status
    	# toggles the status between true/false
    	@completed_status = !@completed_status	
    end

    def update_priority
    	@priority = !@priority
    end

    def to_s
    	@description
    end

    def print
    	# returns a string
    	# designed for printing item to a list
    	status = "ToDo"
  		status = "Done" if @completed_status
  		priority = " !!!" if @priority
    	result = ''
    	result += "#{status}\t\t#{@category}\t\t#{@description}#{priority}\n"
    end

end

# ------------ helper methods ------------

def line_break(char='*', num=15, carriage_return=false)
	# returns a string of num chars
	# designed to easily puts a line break
	result = ''
	num.times { result += char }
	result += "\n" if carriage_return 
	return result
end

