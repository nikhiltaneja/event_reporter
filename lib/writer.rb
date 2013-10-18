require './lib/command_runner.rb'
require 'csv'

class Writer

  def command_runner
    @command_runner ||= CommandRunner.new
  end

  def write_to(filename, queue_data)
    if filename.include?("csv")
      filename = "data/#{filename}"
    else
      filename = "data/#{filename}.csv"
    end
    
    CSV.open(filename, 'wb') do |csv|
      csv << header.split(",")
      format_output(queue_data).each do |row|
        csv << row.split("  ")
      end
    end
  end

  def header
    "last_Name,first_Name,Email_Address,Zipcode,City,State,Street,HomePhone"
  end

  def format_individual_attendee(attendee)
    fields = [:last_name, :first_name, :email, :zipcode, :city, :state, :street, :home_phone]
    
    fields.collect do |attribute|
      attendee.send(attribute)
    end.join("  ")
  end

  def format_output(attendees)
    attendees.collect {|attendee| format_individual_attendee(attendee)}
  end
end
