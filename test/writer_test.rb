gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/writer'

class WriterTest < Minitest::Test

  def test_it_makes_a_directory
    writer = Writer.new
    writer.make_directory
    assert_equal true, File.directory?("./queue")
  end

end
