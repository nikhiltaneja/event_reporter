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
    attendees.collect {|a| format_attendee(a)}.join("\n")
  end

  def print_attendees(attendees)
    puts header
    puts format_attendees(attendees)
  end
end
