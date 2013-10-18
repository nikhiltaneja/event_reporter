gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/writer'

class WriterTest < Minitest::Test
  attr_reader :writer

  def setup
    @writer = Writer.new
  end

  def test_it_has_a_header
    expected_header = "last_Name,first_Name,Email_Address,Zipcode,City,State,Street,HomePhone"
    assert_equal expected_header, writer.header
  end

  def test_it_formats_an_attendee
    attendee = Attendee.new(first_name: "Joe",
                            last_name: "Schomo",
                            email: "joe@example.com",
                            zipcode: "80209",
                            city: "Denver",
                            state: "CO",
                            street: "123 First Street",
                            home_phone: "202-555-5555")
        
    expected = "Schomo  Joe  joe@example.com  80209  Denver  CO  123 First Street  2025555555"
    assert_equal expected, writer.format_individual_attendee(attendee)
  end

  def test_it_has_a_write_to_method
    assert writer.respond_to?(:write_to)
  end
end
