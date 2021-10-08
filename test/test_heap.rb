require 'minitest/autorun'
require 'heap'

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
end
