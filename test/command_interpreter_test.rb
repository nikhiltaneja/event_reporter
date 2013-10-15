gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/command_interpreter'

  class FakeCommandRunner
    def load(filename)
      "running load with #{filename}"
    end

    def queue_print(attribute)
      "running queue print ordered by #{attribute}"
    end

    def queue_count
      "running queue count"
    end

    def queue_clear
      "running queue clear"
    end

    def queue_save_to(filename)
      "running queue save to"
    end

    def help
      "running help"
    end

    def help_command_list(command)
      "running help command list for #{command}"
    end

    def find_first_name(criteria)
      "running find by first_name for #{criteria}"
    end

    def find_last_name(criteria)
      "running find by last_name for #{criteria}"
    end

    def find_email(criteria)
      "running find by email for #{criteria}"
    end

    def find_zipcode(criteria)
      "running find by zipcode for #{criteria}"
    end

    def find_city(criteria)
      "running find by city for #{criteria}"
    end

    def find_state(criteria)
      "running find by state for #{criteria}"
    end

    def find_street(criteria)
      "running find by street for #{criteria}"
    end

    def find_home_phone(criteria)
      "running find by home_phone for #{criteria}"
    end

  end

class CommandInterpreterTest < Minitest::Test
  attr_reader :ci

  def setup
    @ci = CommandInterpreter.new(FakeCommandRunner)
  end

  def test_it_accepts_a_load_instruction
    command = "load some_data.csv"
    result = ci.run(command)

    assert_equal "running load with some_data.csv", result
  end

  def test_it_runs_load_without_a_filename
    result = ci.run("load")

    assert_equal "running load with ./data/event_attendees.csv", result
  end

  def test_it_prints_ordered_by_the_last_name
    result = ci.run("queue print by last_name")
    assert_equal "running queue print ordered by last_name", result
  end

  def test_it_counts_the_queue
    result = ci.run("queue count")
    assert_equal "running queue count", result
  end

  def test_it_clears_the_queue
    result = ci.run("queue clear")
    assert_equal "running queue clear", result
  end

  def test_it_saves_the_queue
    result = ci.run("queue save to")
    assert_equal "running queue save to", result
  end

  def test_it_helps_with_no_command
    result = ci.run("help")
    assert_equal "running help", result
  end

  def test_it_helps_with_command
    result = ci.run("help find")
    assert_equal "running help command list for find", result
  end

  def test_it_accepts_a_find_first_name_command_and_criteria
    result = ci.run("find first_name Sam")
    assert_equal "running find by first_name for Sam", result
  end

  def test_it_accepts_a_find_last_name_and_criteria
    result = ci.run("find last_name Johnson")
    assert_equal "running find by last_name for Johnson", result
  end

  def test_it_accepts_a_find_email_and_criteria
    result = ci.run("find email sam@example.com")
    assert_equal "running find by email for sam@example.com", result
  end

  def test_it_accepts_a_find_zipcode_and_criteria
    result = ci.run("find zipcode 80204")
    assert_equal "running find by zipcode for 80204", result
  end

  def test_it_accepts_a_find_city_and_criteria
    result = ci.run("find city Denver")
    assert_equal "running find by city for Denver", result
  end

  def test_it_accepts_a_find_state_and_criteria
    result = ci.run("find state CO")
    assert_equal "running find by state for CO", result
  end

  def test_it_accepts_a_find_street_and_criteria
    result = ci.run("find street 123 First Street")
    assert_equal "running find by street for 123 First Street", result
  end

  def test_it_accepts_a_find_home_phone_and_criteria
    result = ci.run("find home_phone 4257650025")
    assert_equal "running find by home_phone for 4257650025", result
  end

end
