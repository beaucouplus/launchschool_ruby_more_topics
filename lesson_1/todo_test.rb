require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!
require_relative 'todo'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"
  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_to_s
    assert_equal(@todos.join("\n"), @list.to_s)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal @todo3, @list.last
  end

  def test_shift
    todos = @list.dup
    assert_equal @todo1, todos.shift
    assert_equal 2, todos.size
  end

  def test_pop
    todos = @list.dup
    assert_equal @todo3, todos.pop
    assert_equal 2, todos.size
  end

  def test_done?
    todos = @list.dup
    todos.mark_all_done
    assert_equal 3, todos.all_done.size
  end

  def test_type_error
    assert_raises TypeError do @list.add("coucou") end
  end

  def test_shovel
    todos = @list.dup
    last = Todo.new("Add Item")
    todos << last
    assert_equal 4, todos.size
    assert_equal last, todos.last
  end

  def test_item_at
    assert_equal @todo3, @list.item_at(2)
    assert_raises(IndexError) { @list.item_at(100) }
  end

  def test_mark_done_at
    @list.mark_done_at(2)
    assert_equal true, @list.last.done?
    assert_raises(IndexError) { @list.mark_done_at(30) }
  end

  def test_mark_undone_at
    @list.mark_undone_at(2)
    assert_equal false, @list.last.done?
    assert_raises(IndexError) { @list.mark_undone_at(30) }
  end

  def test_mark_all_done
    todos = @list.dup
    todos.mark_all_done
    todos.each { |todo| assert_equal true, todo.done? }
  end

  def test_remove_at
    todos = @list.dup
    todos.remove_at(2)
    assert_equal 2, todos.size
    assert_raises(IndexError) { todos.remove_at(30) }
  end

  def test_to_s_marked
    list = @list.dup
    todos = @todos.dup
    list.mark_done_at(0)
    assert_equal(todos.join("\n"), list.to_s)
  end

  def test_each
    array = []
    @list.each { |item| array << item }
    assert_equal 3, array.size
  end

  def test_each_returns_original_object
    array = []
    @list.each { |item| array << item }
    assert_instance_of Todo, array.last
  end

  def test_select
    assert_instance_of TodoList, @list.select { |item| item.done? }
  end

  def test_done?
    @todo1.done = true
    assert_equal true, @todo1.done?
    @todo1.done = false
    assert_equal false, @todo1.done?
  end

  def test_undone!
    @todo1.done = true
    @todo1.undone!
    assert_equal false, @todo1.done
  end

  def test_done!
    @todo1.done = false
    @todo1.done!
    assert_equal true, @todo1.done
  end

end
