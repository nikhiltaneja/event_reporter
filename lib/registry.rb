require './lib/attendee'

class Registry
  attr_accessor :attendees

  def initialize
    @attendees = []
  end

  def find_all_by_first_name(name)
    attendees.find_all do |attendee|
      attendee.first_name.downcase == name.downcase
    end
  end

  def find_all_by_last_name(name)
    attendees.find_all do |attendee|
      attendee.last_name.downcase == name.downcase
    end
  end

  def find_all_by_email(address)
    attendees.find_all do |attendee|
      attendee.email.downcase == address.downcase
    end
  end

  def find_all_by_home_phone(number)
    attendees.find_all do |attendee|
      attendee.home_phone == number
    end
  end

  def find_all_by_street(address)
    attendees.find_all do |attendee|
      attendee.street.downcase == address.downcase
    end
  end

  def find_all_by_city(town)
    attendees.find_all do |attendee|
      attendee.city.downcase == town.downcase
    end
  end

  def find_all_by_state(province)
    attendees.find_all do |attendee|
      attendee.state.downcase == province.downcase
    end
  end

  def find_all_by_zipcode(number)
    attendees.find_all do |attendee|
      attendee.zipcode == number
    end
  end

  def count
    attendees.count
  end
end
