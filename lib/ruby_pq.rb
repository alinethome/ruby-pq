require_relative './heap.rb'

class Ruby_PQ
  def initialize(elements = [], &order)
    order ||= Proc.new { |a, b| a <=> b }
    @queue = Heap.new(elements, &order)
  end

  def length
    @queue.size
  end

  private

  attr_reader :queue
end
