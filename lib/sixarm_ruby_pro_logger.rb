# -*- coding: utf-8 -*-
=begin rdoc
Please see README
=end

require 'logger'

class ProLogger < Logger

  attr_accessor :time_format
  attr_accessor :progname
  attr_accessor :hostname
  attr_accessor :pid
  attr_accessor :message_separator
  attr_accessor :backtrace_separator
  attr_accessor :line_separator

  # Initialize the Rails logger formatter.
  #
  # Options:
  #
  #   * time_format: A format string for the `time.strftime` method.
  #       Default is `"%Y-%m-%dT%H:%M:%SZ"` which is ISO 8601 format.
  #
  #   * progname: The running program name.
  #       Default is `$PROGRAM_NAME`.
  #
  #   * hostname: The server host name.
  #       Default is `Socket.gethostname`.
  #
  #   * pid: The process id number.
  #       Default is `Process.pid`.
  #
  #   * message_separator: Text to use to join mutiple messages.
  #       Default is " ... ".
  #
  #   * backtrace_separator: Print this between exception backtrace lines.
  #       Default is " ... ".
  #
  #   * line_separator: Change any message newlines to this text.
  #       Default is " ... ".
  #   
  # @param [Hash] options
  #
  def initialize(options={})
    @time_format = (options[:time_format] || "%Y-%m-%dT%H:%M:%SZ").to_s
    @progname = (options[:progname] || $PROGRAM_NAME).to_s
    @hostname = (options[:hostname] || (require('socket') && Socket.gethostname)).to_s
    @pid = (options[:pid] || Process.pid).to_s
    @message_separator = (options[:message_separator] || " ... ").to_s
    @backtrace_separator = (options[:backtrace_separator] || " ... ").to_s
    @line_separator = (options[:line_separator] || " ... ").to_s
  end

  # Call the formatter.
  #
  # All of the params will be converted to strings;
  # it's fine to send objects instead of strings.
  #
  # We strip the message of extraneous whitespace.
  #
  # See #initialize for the defaults.
  #
  # @param severity [String] the severity object, such as `"INFO"`. 
  # @param time [Time] the time, typically `Time.now.utc`.
  # @param progname [String] the program name, which is anything you like.
  # @param msg [String] the message.
  #
  def call(severity, time, progname, msg)
    "#{time_string(time)} #{progname_string(progname)} #{hostname} #{pid} #{severity_string(severity)} #{message_string(msg)}\n"
  end

  def time_string(time)
    time.utc.strftime(time_format)
  end

  def progname_string(progname)
    (progname || self.progname).to_s
  end

  def severity_string(severity)
    (severity || self.severity).to_s
  end

  def message_string(msg)
    s = \
    case msg
    when ::String
      message_string_when_string(msg)
    when ::Exception
      message_string_when_exception(msg)
    when ::Array
      message_string_when_array(msg)
    else
      message_string_when_object(msg)
    end
    return s.gsub(/\n/, line_separator).lstrip
  end
  
  def message_string_when_string(msg)
    msg
  end

  def message_string_when_array(msg)
    msg.map{|item| message_string(item)}.join(message_separator)
  end

  def message_string_when_exception(msg)
    "#{msg.class} #{msg.message}: " + (msg.backtrace || []).join(backtrace_separator)
  end

  def message_string_when_object(msg)
    msg.inspect
  end

end
