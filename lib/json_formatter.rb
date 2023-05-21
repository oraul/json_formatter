# frozen_string_literal: true

require 'json'

class JsonFormatter
  def call(severity, timestamp, progname, message)
    JSON.dump(
      {
        severity: severity,
        timestamp: timestamp,
        progname: progname
      }.merge!(treat(message))
    )
  end

  def treat(message)
    case message
    when String
      { message: message }
    when Hash
      message
    else
      { message: message.inspect }
    end
  end
end
