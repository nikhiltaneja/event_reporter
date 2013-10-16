require "./lib/command_runner"

class CommandInterpreter
  attr_reader :runner

  def initialize(runner_input = CommandRunner)
    @runner = runner_input.new
  end
  
  def default_filename
    "event_attendees.csv"
  end

  def run(command)
    parts = command.split
    instruction = parts.first
    case instruction
    when "load"
      run_load(parts[1..-1])
    when "help"
      run_help(parts[1..-1])
    when "queue"
      run_queue(parts[1..-1])
    when "find"
      run_find(parts[1..-1])
    when "exit"
      "See you later"
    else
      "Sorry I don't know how to #{instruction}"
    end
  end

  def run_load(parts)
    filename = (parts.first) || default_filename
    full_filename = "./data/#{filename}"
    runner.load(full_filename)
  end

  def run_help(parts)
    request = parts.first
    case request
    when nil
      runner.help
    else
      command = parts.join(" ")
      runner.help_command_list(command.to_s)
    end
  end

  def run_queue(parts)
    request = parts[0..1].join(" ")
    case request
    when "print"
      runner.queue_print
    when "print by"
      attribute = parts.last
      runner.queue_print_by(attribute)
    when "count"
      runner.queue_count
    when "clear"
      runner.queue_clear
    when "save to"
      filename = parts.last
      runner.queue_save_to(filename)
    end
  end

  def run_find(parts)
    attribute = parts.first
    criteria = parts[1..-1].join(" ")

    case attribute
    when "first_name"
      runner.find_attendees_by_first_name(criteria)
    when "last_name"
      runner.find_attendees_by_last_name(criteria)
    when "email"
      runner.find_attendees_by_email(criteria)
    when "home_phone"
      runner.find_attendees_by_home_phone(criteria)
    when "street"
      runner.find_attendees_by_street(criteria)
    when "city"
      runner.find_attendees_by_city(criteria)
    when "state"
      runner.find_attendees_by_state(criteria)
    when "zipcode"
      runner.find_attendees_by_zipcode(criteria)
    end
  end
end
