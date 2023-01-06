class LogLineParser
  def initialize(line)
    @line = line

    set_log_data
  end

  def message
    @message.strip
  end

  def log_level
    @level.downcase
  end

  def reformat
    "#{message} (#{log_level})"
  end

  private

  def set_log_data
    match_data = @line.match(/\[(?<level>\w+)\]:(?<message>.+)/)

    @level = match_data[:level]
    @message = match_data[:message]
  end
end
