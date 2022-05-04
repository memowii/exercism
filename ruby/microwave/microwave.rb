=begin
Write your code for the 'Microwave' exercise in this file. Make the tests in
`microwave_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/microwave` directory.
=end
class Microwave
  attr_reader :entered_button_sequence

  def initialize(entered_button_sequence)
    @entered_button_sequence = entered_button_sequence
  end

  def timer
    minutes = 0
    seconds = 0
    input_length = entered_button_sequence.to_s.length

    if input_length <= 1
      seconds = entered_button_sequence
      return format_result(minutes, seconds)
    end

    if input_length <= 2
      seconds = entered_button_sequence
      if (60..99).include?(seconds)
        minutes += 1
      end
      seconds = seconds % 60
      return format_result(minutes, seconds)
    end

    seconds = entered_button_sequence.to_s[-2..].to_i
    minutes = entered_button_sequence.to_s[0..(input_length-3)].to_i
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

# p Microwave.new(1).timer2
# p Microwave.new(59).timer2
# p Microwave.new(60).timer2
# p Microwave.new(100).timer2
# p Microwave.new(90).timer2
# p Microwave.new(101).timer2
# p Microwave.new(61).timer2
# p Microwave.new(159).timer2
# p Microwave.new(200).timer2
# p Microwave.new(1001).timer2