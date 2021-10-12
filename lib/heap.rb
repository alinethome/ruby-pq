class Heap
  attr_reader :heap, :order

  def initialize(elements = [], &order)
    @order = order || Proc.new { |a, b| a <=> b } 
    @heap = [nil]

    heapify(elements)
  end

  def insert(ele)
    heap << ele

    sift_up(heap.length - 1)
  end

  private

  def heapify(elements)
    elements.each do |ele|
      insert(ele)
    end
  end

  def sift_up(index)
    return if index <= 1

    parent_index = index_of_parent(index)
    
    if @order[heap[index], heap[parent_index]] < 0 
      parent = heap[parent_index]
      heap[parent_index] = heap[index]
      heap[index] = parent

      sift_up(parent_index)
    end
  end

  def index_of_parent(index)
    index/2
  end

  def index_of_left_child(index)
    index*2
  end

  def index_of_right_child(index)
    index*2 + 1
  end

  def parent(index)
    heap[index_of_parent(index)]
  end

  def left_child(index)
    heap[index_of_left_child(index)]
  end

  def right_child(index)
    heap[index_of_left_child]
  end
end
