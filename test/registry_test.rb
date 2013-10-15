gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/registry'
require 'pry'

class RegistryTest < Minitest::Test
  attr_reader :registry

  def setup
    @registry = Registry.new
  end

  def test_it_finds_attendees_by_first_name_irrespective_of_case
    registry.attendees = [
      Attendee.new(first_name: "SaRah"),
      Attendee.new(first_name: "sarah"),
      Attendee.new(first_name: "Billy")
    ]

    attendees = registry.find_all_by_first_name("Sarah")
    assert_equal 2, attendees.count
    attendees.each do |attendee|
      assert_equal "sarah", attendee.first_name.downcase
    end
  end

  def test_it_finds_attendees_by_last_name_irrespective_of_case
    registry.attendees = [
      Attendee.new(last_name: "WillIAMS"),
      Attendee.new(last_name: "Johnson"),
      Attendee.new(last_name: "Williams")
    ]

    attendees = registry.find_all_by_last_name("Williams")
    assert_equal 2, attendees.count
    attendees.each do |attendee|
      assert_equal "williams", attendee.last_name.downcase
    end
  end

  def test_it_finds_attendees_by_email_irrespective_of_case
    registry.attendees = [
      Attendee.new(email: "ARannon@jumpstartlab.com"),
      Attendee.new(email: "BJohnson@jsl.com"),
      Attendee.new(email: "arannon@jumpstartlab.com")
    ]

    attendees = registry.find_all_by_email("arannon@jumpstartlab.com")
    assert_equal 2, attendees.count
    attendees.each do |attendee|
      assert_equal "arannon@jumpstartlab.com", attendee.email.downcase
    end
  end

  def test_it_finds_attendees_by_home_phone
    registry.attendees = [
      Attendee.new(home_phone: "8084974000"),
      Attendee.new(home_phone: "7074974000"),
      Attendee.new(home_phone: "8084974000")
    ]

    attendees = registry.find_all_by_home_phone("8084974000")
    assert_equal 2, attendees.count
    attendees.each do |attendee|
      assert_equal "8084974000", attendee.home_phone
    end
  end

  def test_it_finds_attendees_by_street_irrespective_of_case
    registry.attendees = [
      Attendee.new(street: "2022 15th Street NW"),
      Attendee.new(street: "1111 17th Street NE"),
      Attendee.new(street: "2022 15th STREET NW")
    ]

    attendees = registry.find_all_by_street("2022 15th street nw")
    assert_equal 2, attendees.count
    attendees.each do |attendee|
      assert_equal "2022 15th street nw", attendee.street.downcase
    end
  end

  def test_it_finds_attendees_by_city_irrespective_of_case
    registry.attendees = [
      Attendee.new(city: "Atlanta"),
      Attendee.new(city: "denver"),
      Attendee.new(city: "ATLANTA")
    ]

    attendees = registry.find_all_by_city("atlanta")
    assert_equal 2, attendees.count
    attendees.each do |attendee|
      assert_equal "atlanta", attendee.city.downcase
    end
  end

  def test_it_finds_attendees_by_state_irrespective_of_case
    registry.attendees = [
      Attendee.new(state: "oh"),
      Attendee.new(state: "OH"),
      Attendee.new(state: "CC")
    ]

    attendees = registry.find_all_by_state("oh")
    assert_equal 2, attendees.count
    attendees.each do |attendee|
      assert_equal "oh", attendee.state.downcase
    end
  end

  def test_it_finds_attendees_by_zipcode
    registry.attendees = [
      Attendee.new(zipcode: "00139"),
      Attendee.new(zipcode: "55555"),
      Attendee.new(zipcode: "139")
    ]

    attendees = registry.find_all_by_zipcode("00139")
    assert_equal 2, attendees.count
    attendees.each do |attendee|
      assert_equal "00139", attendee.zipcode
    end
  end

end
