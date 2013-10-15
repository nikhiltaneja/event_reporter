# require 'csv'
# require './lib/attendees'

# class EventReporter

#   attr_accessor :attendees

#   def initialize
#     @attendees = []
#     prompt
#   end

#   def prompt
#       puts "Welcome to EventReporter"
#       input = ""

#       while input != "quit"
#         printf "Please enter a command: "
#         input = gets.chomp
#         parts = input.split(" ")
#         process_command(parts)
#       end
#   end

#   def process_command(parts)
#     command = parts[0]
#     case command
#     when "load"
#       load
#     when "find"
#       attribute = parts[1]
#       criteria = parts[2]
#       find(attribute, criteria)
#     else
#       "Error"
#     end
#   end

#   def find(attribute, criteria)
#     @attendees.find_all do |attendee|
#       attendee.send(attribute) == criteria
#     end
#   end

#   def load(filename = "event_attendees.csv")
#     puts "File loading!"
#     data = CSV.read(filename, headers: true, header_converters: :symbol)
#     @attendees = data.collect do |row|
#       Attendee.new(row)
#     end
#   end

# end
