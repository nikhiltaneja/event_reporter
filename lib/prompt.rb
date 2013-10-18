require "./lib/command_interpreter"

class Prompt
  def run
    puts "Welcome to EventReporter!"
    command_interpreter = CommandInterpreter.new

    input = nil
    while input != "quit"
      printf "Please enter a command: "
      input = gets.chomp
      puts command_interpreter.run(input)
    end
  end
end

Prompt.new.run
