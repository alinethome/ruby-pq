require_relative './heap.rb'

class RubyPQ
  def initialize(elements = [], &order)
    order ||= Proc.new { |a, b| a <=> b }
    @queue = Heap.new(elements, &order)
  end

  def length
    @queue.size
  end

  def empty?
    length == 0
  end

  def push(*elements)
    elements.each { |ele| @queue.insert(ele) }
  end

  def peek
    queue.peek
  end

  private

  attr_reader :queue
end
