=begin
Write your code for the 'Microwave' exercise in this file. Make the tests in
`microwave_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/microwave` directory.
=end

class Microwave
  attr_reader :input

  def initialize(entered_button_sequence)
    @input = entered_button_sequence
  end

  def timer
    input_length = input.to_s.length

    if input_length <= 1
      seconds = input
      return format_result(0, seconds)
    end

    if input_length <= 2
      minutes = 0
      seconds = input
      if (60..99).include?(seconds)
        minutes += 1
      end
      seconds = seconds % 60
      return format_result(minutes, seconds)
    end

    seconds = input.to_s[-2..].to_i
    minutes = input.to_s[0..(input_length-3)].to_i
    if seconds > 59
      seconds = seconds % 60
      minutes += 1
      return format_result(minutes, seconds)
    end

    format_result(minutes, seconds)
  end

  def format_result(minutes, seconds)
    "#{minutes.to_s.rjust(2, '0')}:#{seconds.to_s.rjust(2, '0')}"
  end
end
