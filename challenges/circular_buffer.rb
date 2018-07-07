require 'pry'
class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  attr_accessor :current_index
  def initialize(length)
    @length = length
    clear
  end

  def read
    raise BufferEmptyException if buffer.empty?
    buffer.shift
  end

  def write(item)
    raise BufferFullException if full?
    buffer << item if item
  end

  def write!(item)
    return write(item) unless full?
    if item
      buffer[0] = item
      buffer.rotate!
    end
  end

  def clear
    @buffer = []
  end

  private
  attr_reader :buffer, :length

  def full?
    buffer.size == length
  end

end
