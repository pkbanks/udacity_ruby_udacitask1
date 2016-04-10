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

  def add_item(new_item)
  	# add an item
  	item = Item.new(new_item)
  	@items.push(item)
  end

  def remove_item(index)
  	# removes item at index, returns the item
  	return @items.delete_at(index)
  end

  def print(include_header=true)
  	# returns a string that can be puts or exported to a file
  	# optionally includes header
  	result = ""

  	result += get_header if include_header

  	for item in @items do
  		result += item.print
  	end
  	
  	return result + "\n"
  
  end

  def to_s
  	# makes it easy to print the list, merely by 'puts list' command
  	self.print
  end

  def get_header(char = "-", num = 4)
  	# char is a string
  	# num is an integer
  	# char and num are character settings for the header that flank the title
  	return line_break(char, num) + "  " + @title + "  " + line_break(char, num) + "\n"
  end

end

class Item

		attr_reader :description, :completed_status
		
    # methods and stuff go here
    def initialize(description)
    	@description = description
    	@completed_status = false
    end

    def update_status
    	# toggles the status between true/false
    	@completed_status = !@completed_status	
    end

    def to_s
    	@description
    end

    def print
    	# returns a string
    	# designed for printing item to a list
    	status = "ToDo"
  		status = "Done" if @completed_status
    	result = ''
    	result += "#{status}\t#{@description}\n"
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

