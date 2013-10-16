require './lib/attendee_parser'
require './lib/registry'
require './lib/queue'
require './lib/printer'
require './lib/writer'

class CommandRunner

  def parser
    @parser ||= AttendeeParser.new
  end

  def registry
    @registry ||= Registry.new
  end

  def printer
    @printer ||= Printer.new
  end

  def queue
    @queue ||= Queue.new
  end

  def writer
    @writer ||= Writer.new
  end

  def load(filename)
    parser.parse_file(filename)
    registry.attendees = parser.attendees
    "Loaded #{registry.count} attendees."
  end

  def help
    "\nload <filename> \nhelp \nhelp <command> \nqueue count \nqueue clear \nqueue print \nqueue print by <attribute> \nqueue save to <filename.csv>\nfind <attribute> <criteria>"
  end

  def help_command_list(command)
    case command
    when "help"
      "Displays a list of available commands"
    when "queue count"
      "Counts number of records in the queue"
    when "queue clear"
      "Empties the queue"
    when "queue print"
      "Displays the items in the queue"
    when "queue print by <attribute>"
      "Displays the items in the queue sorted by a specific attribute"
    when "queue save to <filename.csv>"
      "Exports the current queue to the specified filename as a CSV"
    when "find <attribute> <criteria>"
      "Load the queue with all records matching the criteria for the given attribute"
    else
      "Sorry I don't understand that command. Please enter help to see a list of available commands."
    end
  end

  def attendee_count
    registry.count
  end

  def queue_count
    queue.count
  end

  def queue_clear
    queue.clear
  end

  def queue_print
    printer.print_attendees(queue_data)
  end

  def queue_print_by(attribute)
    printer.print_attendees_by(attribute, queue_data)
  end

  def queue_save_to(filename)
    writer.write_to(filename, queue_data)
  end

  def queue_data
    queue.data
  end

  def find_attendees_by_first_name(name)
    queue.replace(registry.find_all_by_first_name(name))
    "Found #{queue.count} attendees"
  end

  def find_attendees_by_last_name(name)
    queue.replace(registry.find_all_by_last_name(name))
    "Found #{queue.count} attendees"
  end

  def find_attendees_by_email(email)
    queue.replace(registry.find_all_by_email(email))
    "Found #{queue.count} attendees"
  end

  def find_attendees_by_home_phone(number)
    queue.replace(registry.find_all_by_home_phone(number))
    "Found #{queue.count} attendees"
  end

  def find_attendees_by_city(city)
    queue.replace(registry.find_all_by_city(city))
    "Found #{queue.count} attendees"
  end

  def find_attendees_by_street(street)
    queue.replace(registry.find_all_by_street(street))
    "Found #{queue.count} attendees"
  end

  def find_attendees_by_state(state)
    queue.replace(registry.find_all_by_state(state))
    "Found #{queue.count} attendees"
  end  

  def find_attendees_by_zipcode(zipcode)
    queue.replace(registry.find_all_by_zipcode(zipcode))
    "Found #{queue.count} attendees"
  end
  
end
