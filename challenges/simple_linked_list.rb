require 'pry'

class Element
  attr_accessor :datum, :next

  def initialize(datum, next_item = nil)
    @next = next_item
    @datum = datum
  end

  def tail?
    !self.next
  end

end

class SimpleLinkedList
  include Enumerable

  attr_reader :elements
  attr_accessor :counter

  def initialize
    @elements = nil
    @counter = 0
  end

  def size
    counter
  end

  def empty?
    size.zero?
  end

  def pop
    last_element = elements
    @elements = last_element.next
    self.counter -= 1
    last_element.datum
  end

  def push(item)
    @elements = Element.new(item, elements)
    self.counter += 1
  end

  def peek
    elements.datum if elements
  end

  def head
    elements
  end

  def self.from_a(array)
    linked_list = SimpleLinkedList.new
    return linked_list if !array || array.empty?
    array.reverse.each { |item| linked_list.push(item) }
    linked_list
  end

  def each(&block)
    if block_given?
        current = elements
        while current
          block.call(current.datum)
          current = current.next
        end
    else
      each_with_object([]) { |item, datas| datas << item }.each
    end
  end

  def reverse
    list = to_a.reverse
    self.class.from_a(list)
  end


end
