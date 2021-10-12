require 'minitest/autorun'
require 'heap'
require_relative './test_helper'

class TestHeap < MiniTest::Test
  ONE_EL_ARR = [7]
  ARR = [16, 7, 8, 29, 23]

  def test_that_initialize_can_take_no_arguments
    Heap.new
  end

  def test_that_initialize_takes_an_array
    Heap.new(ARR)
  end

  def test_that_initialize_takes_in_a_one_element_array
    Heap.new(ONE_EL_ARR)
  end

  def test_that_initialize_takes_in_an_empty_array
    Heap.new([])
  end

  def test_that_initialize_takes_in_a_sorting_block
    Heap.new() { |a, b| b <=> a }
  end

  def test_that_initialize_given_an_array_makes_a_heap
    heap = Heap.new(ARR) 

    assert(is_heap?(heap.heap))
  end

  def test_that_initialize_respects_custom_ordering
    ordering = Proc.new { |a, b| b <=> a }
    heap = Heap.new(ARR, &ordering)

    assert(is_heap?(heap.heap, &ordering))
  end

  def test_that_insert_inserts_the_element_into_the_heap
    heap = Heap.new(ARR)
    new_ele = 3
    heap.insert(new_ele)

    assert_includes(heap.heap, new_ele)
  end

  def test_that_insert_maintains_the_heap_property
    heap = Heap.new(ARR)
    new_ele = 3 
    heap.insert(new_ele)

    assert(is_heap?(heap.heap))
  end

  def test_that_insert_respects_custom_ordering
    ordering = Proc.new { |a, b| b <=> a }
    heap = Heap.new(ARR, &ordering)
    new_ele = 3 
    heap.insert(new_ele)

    assert(is_heap?(heap.heap, &ordering))
  end
end

