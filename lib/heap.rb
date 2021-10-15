class Heap
  attr_reader :heap, :order

  def initialize(elements = [], &order)
    @order = order || Proc.new { |a, b| a <=> b } 
    @heap = [nil]

    heapify(elements)
  end

  def peek
    heap[1]
  end

  def insert(ele)
    heap << ele

    sift_up(heap.length - 1)
  end

  def pop
    return nil if heap.length <= 1
    
    top = heap[1]
    heap[1] = heap[-1] 
    heap.pop
    sift_down(1)

    top
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

  def sift_down(index)
    return if index < 1

    left_child_index = index_of_left_child(index)
    right_child_index = index_of_right_child(index)
    left_child = heap[left_child_index]
    right_child = heap[right_child_index]
    element = heap[index]

    return if (!left_child && !right_child) ||
      (!left_child && order[element, right_child] <= 0) ||
      (!right_child && order[element, left_child] <= 0) ||
      (order[element, left_child] <= 0 && order[element, right_child] <= 0)
    
    if !right_child || order[left_child, right_child] <= 0 
      heap[left_child_index] = element
      heap[index] = left_child
      sift_down(left_child_index)
    else
      heap[right_child_index] = element
      heap[index] = right_child
      sift_down(right_child_index)
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
