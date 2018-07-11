class Bst
  include Enumerable
  def initialize(data)
    @data = data
  end

  attr_reader :data, :left, :right

  def insert(new_data)
    if new_data < data
      insert_left(new_data)
    elsif new_data > data
      insert_right(new_data)
    else
      @left = @right = self
    end
  end

  def each(&block)
    if block_given?
      left.each(&block) if left
      block.call(self.data)
      right.each(&block) if right
    else
      each_with_object([]) { |item, datas| datas << item }.each
    end
  end

  private

  def insert_left(new_data)
    left ? left.insert(new_data) : @left = Bst.new(new_data)
  end

  def insert_right(new_data)
    right ? right.insert(new_data) : @right = Bst.new(new_data)
  end
end
