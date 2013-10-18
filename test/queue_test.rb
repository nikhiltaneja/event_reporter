gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/queue'

class QueueTest < Minitest::Test
  attr_reader :queue

  def setup
    @queue = Queue.new
  end

  def test_it_counts
    assert_equal 0, queue.count
  end

  def test_it_holds_data
    queue.add([1,2,3])
    assert_equal 3, queue.count
  end

  def test_it_clears_itself
    queue.add([1,2])
    assert_equal 2, queue.count
    queue.clear
    assert_equal 0, queue.count
  end
end
