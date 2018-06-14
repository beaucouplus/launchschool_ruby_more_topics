# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.
require 'pry'
class Todo
  DONE_MARKER = 'x'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  include Enumerable

  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError.new("Can only add Todo objects") unless todo.is_a? Todo
    todos << todo
    todos
  end

  def <<(todo)
    add(todo)
  end

  def size
    todos.size
  end

  def each
    counter = 0
    while counter < todos.size
      yield(todos[counter])     # yield to the block, passing in the current element to the block
      counter += 1
    end
    self
    # returns the `array` parameter, similar in spirit to how `Array#each` returns the caller
  end

  def last
    todos.last
  end

  def item_at(index)
    raise IndexError.new("Item doesn't exist") if !todos[index]
    todos[index]
  end

  def mark_done_at(index)
    raise IndexError.new("Item doesn't exist") if !todos[index]
    todos[index].done!
  end

  def mark_undone_at(index)
    raise IndexError.new("Item doesn't exist") if !todos[index]
    todos[index].undone!
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(index)
    raise IndexError.new("Item doesn't exist") if !todos[index]
    todos.delete_at(index)
  end

  def to_s
    todos.join("\n")
  end

  def select
    todos = TodoList.new("Selected items")
    each { |todo| todos.add(todo) if yield(todo) }
    todos
  end

  def find_by_title(title)
    select { |todo| todo.title == title }.first
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(string)
    select { |todo| todo.title == string || todo.description == string }.first.done!
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end

  private
  attr_reader :todos

end

# todo1 = Todo.new("Buy milk")
# todo2 = Todo.new("Clean room")
# todo3 = Todo.new("Go to gym")

# list = TodoList.new("Today's Todos")

# # ---- Adding to the list -----

# # add
# list.add(todo1)                 # adds todo1 to end of list, returns list
# list.add(todo2)                 # adds todo2 to end of list, returns list
# list.add(todo3)                 # adds todo3 to end of list, returns list
# # list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# # <<
# # same behavior as add

# # ---- Interrogating the list -----

# # size
# p list.size                       # returns 3

# # first
# p list.first                      # returns todo1, which is the first item in the list

# # last
# p list.last                       # returns todo3, which is the last item in the list

# # ---- Retrieving an item in the list ----

# # item_at
# # p list.item_at                    # raises ArgumentError
# p list.item_at(1)                 # returns 2nd item in list (zero based index)
# # p list.item_at(100)               # raises IndexError

# # ---- Marking items in the list -----

# # mark_done_at
# # list.mark_done_at               # raises ArgumentError
# list.mark_done_at(1)            # marks the 2nd item as done
# # list.mark_done_at(100)          # raises IndexError

# # mark_undone_at
# # list.mark_undone_at             # raises ArgumentError
# list.mark_undone_at(2)          # marks the 2nd item as not done,
# # list.mark_undone_at(100)        # raises IndexError

# # ---- Deleting from the the list -----

# # shift
# # list.shift                      # removes and returns the first item in list

# # pop
# # list.pop                        # removes and returns the last item in list

# # p list
# # remove_at
# # p list.remove_at                  # raises ArgumentError
# # p list.remove_at(1)               # removes and returns the 2nd item
# # p list.remove_at(100)             # raises IndexError

# # ---- Outputting the list -----

# # to_s
# puts list.to_s                      # returns string representation of the list

# # ---- Today's Todos ----
# # [ ] Buy milk
# # [ ] Clean room
# # [ ] Go to gym

# # or, if any todos are done

# # ---- Today's Todos ----
# # [ ] Buy milk
# # [X] Clean room
# # [ ] Go to gym


# list.each { |todo| puts todo }

# p list.select { |todo| todo.done? }

# p list.find_by_title("Buy milk")
# p list.find_by_title("ragondin")

# p list.all_done
# p list.all_not_done
# list.add(Todo.new("brush teeth"))
# list.mark_done("brush teeth")
# p list
# puts "====="
# puts list
# puts "====="
# list.mark_all_done
# puts list
# puts "====="
# list.mark_all_undone
# puts list
