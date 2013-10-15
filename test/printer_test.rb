gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/printer'
require './lib/attendee'

class PrinterTest < Minitest::Test
  attr_reader :printer

  def setup
    @printer = Printer.new
  end

  def test_it_formats_a_header
    expected_header = "LAST NAME  FIRST NAME  EMAIL  ZIPCODE  CITY  STATE  STREET  PHONE"
    assert_equal expected_header, printer.header
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
    assert_equal expected, printer.format_attendee(attendee)
  end

  def test_it_formats_attendees
    attendees = [
      attendee = Attendee.new(first_name: "Joe",
                              last_name: "Schomo",
                              email: "joe@example.com",
                              zipcode: "80209",
                              city: "Denver",
                              state: "CO",
                              street: "123 First Street",
                              home_phone: "202-555-5555"),
      
      attendee = Attendee.new(first_name: "Jane",
                              last_name: "Schomo",
                              email: "jane@example.com",
                              zipcode: "80209",
                              city: "Boulder",
                              state: "CO",
                              street: "123 First Street",
                              home_phone: "202-555-5555")
    ]

    expected_1 = "Schomo  Joe  joe@example.com  80209  Denver  CO  123 First Street  2025555555"
    expected_2 = "Schomo  Jane  jane@example.com  80209  Boulder  CO  123 First Street  2025555555"
    expected = [expected_1, expected_2].join("\n")

    assert_equal expected, printer.format_attendees(attendees)
  end

  def test_it_has_a_print_attendees_method
    assert printer.respond_to?(:print_attendees)
  end
end
