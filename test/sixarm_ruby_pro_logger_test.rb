# -*- coding: utf-8 -*-
require 'test/unit'
require 'simplecov'
SimpleCov.start
require 'sixarm_ruby_pro_logger'

class ProLoggerTest < Test::Unit::TestCase

  def test_initialize
    x = ProLogger.new(
      :hostname => "my_hostname",
      :message_separator => "my_message_separator",
      :backtrace_separator => "my_backtrace_separator",
      :line_separator => "my_line_separator",
      :timestamp_format => "my_timestamp_format"
    )
    assert_equal("my_hostname", x.hostname)
    assert_equal("my_timestamp_format", x.timestamp_format)
    assert_equal("my_message_separator", x.message_separator)
    assert_equal("my_backtrace_separator", x.backtrace_separator)
    assert_equal("my_line_separator", x.line_separator)
  end

  LOGGER = ProLogger.new

  def test_format_message
    severity = "info"
    timestamp = Time.now
    progname = "my_progname"
    msg = "my_msg"
    hostname = LOGGER.hostname
    s = LOGGER.format_message(severity, timestamp, progname, msg)
    assert(s=~/^\d\d\d\d-\d\d-\d\d \d\d:\d\d:\d\dZ localhost rails\[\d+\]: my_progname info my_msg\n$/, s)
  end

  def test_timestamp_string
   t=LOGGER.timestamp_string(Time.now)
   assert(t=~/^\d\d\d\d-\d\d-\d\d \d\d:\d\d:\d\dZ$/,t)
  end

  def test_exception_string
    e = RuntimeError.new("hello")
    e.set_backtrace(['abc:1','def:2','ghi:3'])
    sep = LOGGER.backtrace_separator
    assert_equal("RuntimeError hello: abc:1#{sep}def:2#{sep}ghi:3", LOGGER.exception_string(e))
  end

  def test_message_string_with_simple_string
    assert_equal("foo", LOGGER.message_string("foo"))
  end

  def test_message_string_with_leading_whitespace
    assert_equal("foo", LOGGER.message_string("   foo"))
  end

  def test_message_string_with_newlines
    sep = LOGGER.line_separator
    assert_equal("abc#{sep}def#{sep}ghi", LOGGER.message_string("abc\ndef\nghi"))
  end

  def test_message_string_with_array
    sep = LOGGER.message_separator
    assert_equal("abc#{sep}def#{sep}ghi", LOGGER.message_string(['abc','def','ghi']))
  end

  def test_message_string_with_inspect_on_a_number
    assert_equal("123", LOGGER.message_string(123))
  end

  def test_message_string_with_inspect_on_a_hash
    assert_equal("{:a=>:b}", LOGGER.message_string({:a => :b}))
  end

end
