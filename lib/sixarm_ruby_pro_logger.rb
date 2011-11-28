# -*- coding: utf-8 -*-
=begin rdoc
Please see README.rdoc
=end

require 'logger'

class ProLogger < Logger

  attr_accessor :hostname
  attr_accessor :message_separator
  attr_accessor :backtrace_separator
  attr_accessor :line_separator
  attr_accessor :timestamp_format


  def initialize(ops={})
    @message_separator = ops[:message_separator] || " ### "
    @backtrace_separator = ops[:backtrace_separator] || " | "
    @line_separator = ops[:line_separator] || " /// "
    @timestamp_format = ops[:timestamp_format] || "%Y-%m-%d %H:%M:%SZ"
    @hostname = ops[:hostname] || 'localhost'
  end

  def format_message(severity, timestamp, progname, msg)
    "#{timestamp_string(timestamp)} #{hostname} rails[#{Process.pid}]: #{progname} #{severity} #{message_string(msg)}\n"
  end

  def timestamp_string(timestamp)
    timestamp.utc.strftime(@timestamp_format)
  end

  def exception_string(e)
    "#{e.class} #{e.message}: " + (e.backtrace || []).join(@backtrace_separator)
  end

  def message_string(msg)
    s = case msg
    when ::String
      msg
    when ::Exception
      exception_string(msg)
    when ::Array
      msg.map{|item| message_string(item)}.join(@message_separator)
    else
      msg.inspect
    end
    return s.gsub(/\n/, @line_separator).lstrip
  end


end
