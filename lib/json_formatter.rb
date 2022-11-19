require 'json'

class JsonFormatter
  def call(severity, timestamp, progname, message)
    JSON.dump(
      severity: severity,
      timestamp: timestamp,
      progname: progname,
      message: message
    )
  end
end
