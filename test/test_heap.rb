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

  def test_that_peek_returns_nil_on_an_empty_heap
    heap = Heap.new
    
    assert_nil(heap.peek)
  end

  def test_that_peek_returns_the_min_on_a_default_heap
    heap = Heap.new(ARR)

    assert_equal(ARR.min, heap.peek)
  end

  def test_that_peek_returns_the_min_according_to_custom_ordering_if_given
    ordering = Proc.new { |a, b| b <=> a }
    heap = Heap.new(ARR, &ordering)
    max = ARR.min(&ordering)

    assert_equal(max, heap.peek)
  end

  def test_that_pop_return_nil_if_empty
    heap = Heap.new

    assert_nil(heap.pop)
  end

  def test_that_pop_does_not_modify_heap_if_empty
    heap = Heap.new
    heap_array = heap.heap
    heap.pop

    assert_equal(heap_array, heap.heap)
  end

  def test_that_pop_returns_the_min
    heap = Heap.new(ARR)
    min = ARR.min

    assert_equal(min, heap.pop)
  end

  def test_that_pop_removes_the_min_from_the_heap
    heap = Heap.new(ARR.uniq)
    min = ARR.uniq
    heap.pop

    refute_includes(heap.heap, min)
  end

  def test_that_pop_maintains_the_heap_property
    heap = Heap.new(ARR)
    heap.pop

    assert(is_heap?(heap.heap))
  end

  def test_that_pop_respects_a_custom_ordering
    ordering = Proc.new { |a, b| b <=> a }
    heap = Heap.new(ARR, &ordering)
    max = ARR.max

    assert_equal(max, heap.pop)
  end

  def test_that_size_returns_the_number_of_elements_in_the_heap
    assert_equal(0, Heap.new.size)
    assert_equal(1, Heap.new(ONE_EL_ARR).size)
    assert_equal(ARR.length, Heap.new(ARR).size)
  end
end

