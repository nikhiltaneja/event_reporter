class Printer
  def header
    "LAST NAME  FIRST NAME  EMAIL  ZIPCODE  CITY  STATE  STREET  PHONE"
  end

  def format_attendee(attendee)
    [
      attendee.last_name,
      attendee.first_name,
      attendee.email,
      attendee.zipcode,
      attendee.city,
      attendee.state,
      attendee.street,
      attendee.home_phone
    ].join("  ")
  end

  def format_attendees(attendees)
    attendees.collect {|attendee| format_attendee(attendee)}.join("\n")
  end

  def print_attendees(attendees)
    puts header
    puts format_attendees(attendees)
  end

  def print_attendees_by(attribute, attendees)
    print_attendees(attendees.sort_by { |attendee| attendee.send(attribute) })
  end
end
