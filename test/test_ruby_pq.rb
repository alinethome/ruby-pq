require 'minitest/autorun'
require 'ruby_pq'

class TestRubyPQ < MiniTest::Test
  ONE_EL_ARR = [5]
  ARR = [8, 29, 65, 32, 0, 2]

  def test_that_initialize_takes_an_array
    RubyPQ.new(ARR)
  end

  def test_that_initialize_takes_an_empty_array
    RubyPQ.new([])
  end

  def test_that_initialize_takes_a_one_element_array
    RubyPQ.new(ONE_EL_ARR)
  end

  def test_that_initialize_can_take_no_arguments
    RubyPQ.new()
  end

  def test_that_initialize_takes_in_an_order_block
    RubyPQ.new() { |a, b| b <=> a }
  end

  def test_that_the_length_getter_returns_the_correct_length
    assert_equal(0, RubyPQ.new().length)
    assert_equal(1, RubyPQ.new(ONE_EL_ARR).length)
    assert_equal(ARR.length, RubyPQ.new(ARR).length)
  end

  def test_that_empty_returns_true_for_empty_queues
    pqueue = RubyPQ.new
    assert(pqueue.empty?)
  end

  def test_that_empty_returns_false_for_queues_with_one_element_or_more
    one_el_pqueue = RubyPQ.new(ONE_EL_ARR)
    many_el_pqueue = RubyPQ.new(ARR)

    refute(one_el_pqueue.empty?)
    refute(many_el_pqueue.empty?)
  end

  def test_that_push_takes_multiple_elements
    pqueue = RubyPQ.new()
    pqueue.push(1, 2, 3, 4, 5, 6, 7, 8)
    pqueue.push(1)
  end

  def test_that_push_increases_the_length_of_the_queue_by_the_elements_added
    pqueue = RubyPQ.new()
    assert_equal(3, pqueue.push(1, 2, 3).length)
  end

  def test_that_peek_returns_the_highest_priority_element
    pqueue = RubyPQ.new(ARR)
    assert_equal(ARR.min, pqueue.peek) # because the default ordering is min
  end

  def test_that_peek_respects_custom_ordering
    pqueue = RubyPQ.new(ARR) { |a, b| b <=> a }
    assert_equal(ARR.max, pqueue.peek)
  end

  def test_that_peek_doesnt_change_the_size
    pqueue = RubyPQ.new(ARR)
    original_length = pqueue.length


    pqueue.peek
    assert_equal(original_length, pqueue.length)
  end

  def test_that_pop_returns_the_highest_priority_element
    pqueue = RubyPQ.new(ARR)
    assert_equal(ARR.min, pqueue.pop) # because the default ordering is min
  end

  def test_that_pop_returns_nil_for_an_empty_queue
    pqueue = RubyPQ.new()
    assert_nil(pqueue.pop)
  end

  def test_that_pop_respects_custom_ordering
    max_queue = RubyPQ.new(ARR) { |a, b| b <=> a }
    assert_equal(ARR.max, max_queue.pop)
  end

  def test_that_pop_removes_the_element
    pqueue = RubyPQ.new(ARR)
    original_length = pqueue.length

    pqueue.pop
    assert_equal(original_length - 1, pqueue.length)
  end
end
