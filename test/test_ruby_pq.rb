require 'minitest/autorun'
require 'ruby_pq'

class TestRubyPQ < MiniTest::Test
  ONE_EL_ARR = [5]
  ARR = [8, 29, 65, 32, 0, 2]

  def test_that_initialize_takes_an_array
    Ruby_PQ.new(ARR)
  end

  def test_that_initialize_takes_an_empty_array
    Ruby_PQ.new([])
  end

  def test_that_initialize_takes_a_one_element_array
    Ruby_PQ.new(ONE_EL_ARR)
  end

  def test_that_initialize_can_take_no_arguments
    Ruby_PQ.new()
  end

  def test_that_initialize_takes_in_an_order_block
    Ruby_PQ.new() { |a, b| b <=> a }
  end
end
