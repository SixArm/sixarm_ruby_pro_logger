# -*- coding: utf-8 -*-
require "minitest/autorun"
require "simplecov"
SimpleCov.start
require "sixarm_ruby_pro_logger"

class ProLoggerTest < Minitest::Test

  def test_initialize
    x = ProLogger.new(
      :time_format => "my_time_format",
      :progname => "my_progname",
      :hostname => "my_hostname",
      :pid => "my_pid",
      :message_separator => "my_message_separator",
      :backtrace_separator => "my_backtrace_separator",
      :line_separator => "my_line_separator",
    )
    assert_equal("my_time_format", x.time_format)
    assert_equal("my_progname", x.progname)
    assert_equal("my_hostname", x.hostname)
    assert_equal("my_pid", x.pid)
    assert_equal("my_message_separator", x.message_separator)
    assert_equal("my_backtrace_separator", x.backtrace_separator)
    assert_equal("my_line_separator", x.line_separator)
  end

  LOGGER = ProLogger.new

  def test_format_message
    LOGGER.hostname = "my_hostname"
    LOGGER.pid = "my_pid"
    severity = "my_severity"
    time = Time.now
    progname = "my_progname"
    msg = "my_msg"
    s = LOGGER.call(severity, time, progname, msg)
    assert(s=~/^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d\dZ my_progname my_hostname my_pid my_severity my_msg\n$/, s)
  end

  def test_time_string
   assert_match(/^\d\d\d\d-\d\d-\d\dT\d\d:\d\d:\d\dZ$/, LOGGER.time_string(Time.now))
  end

  def test_message_string_when_string
    msg = "foo"
    assert_equal("foo", LOGGER.message_string(msg))
  end

  def test_message_string_when_string_with_leading_whitespace
    msg = "   foo"
    assert_equal("foo", LOGGER.message_string(msg))
  end

  def test_message_string_when_string_with_multiple_lines
    sep = LOGGER.line_separator
    msg = "abc\ndef\nghi"
    assert_equal("abc#{sep}def#{sep}ghi", LOGGER.message_string(msg))
  end

  def test_message_string_when_array
    sep = LOGGER.message_separator
    msg = ['abc','def','ghi']
    assert_equal("abc#{sep}def#{sep}ghi", LOGGER.message_string(msg))
  end

  def test_message_string_when_exception
    msg = RuntimeError.new("hello")
    msg.set_backtrace(['abc:1','def:2','ghi:3'])
    sep = LOGGER.backtrace_separator
    assert_equal("RuntimeError hello: abc:1#{sep}def:2#{sep}ghi:3", LOGGER.message_string_when_exception(msg))
  end

  def test_message_string_when_object_using_inspect_on_a_number
    msg = 123
    assert_equal("123", LOGGER.message_string_when_object(msg))
  end

  def test_message_string_when_object_using_inspect_on_a_hash
    msg = {:a => :b}
    assert_equal("{:a=>:b}", LOGGER.message_string_when_object(msg))
  end

end
