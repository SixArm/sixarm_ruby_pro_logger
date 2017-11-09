# SixArm.com → Ruby → <br> ProLogger custom logger with better information

<!--header-open-->

[![Gem Version](https://badge.fury.io/rb/sixarm_ruby_pro_logger.svg)](http://badge.fury.io/rb/sixarm_ruby_pro_logger)
[![Build Status](https://travis-ci.org/SixArm/sixarm_ruby_pro_logger.png)](https://travis-ci.org/SixArm/sixarm_ruby_pro_logger)
[![Code Climate](https://codeclimate.com/github/SixArm/sixarm_ruby_pro_logger.png)](https://codeclimate.com/github/SixArm/sixarm_ruby_pro_logger)
[![Coverage Status](https://coveralls.io/repos/SixArm/sixarm_ruby_pro_logger/badge.svg?branch=master&service=github)](https://coveralls.io/github/SixArm/sixarm_ruby_pro_logger?branch=master)

* Git: <https://github.com/sixarm/sixarm_ruby_pro_logger>
* Doc: <http://sixarm.com/sixarm_ruby_pro_logger/doc>
* Gem: <https://rubygems.org/gems/sixarm_ruby_pro_logger>
* Contact: Joel Parker Henderson, <joel@sixarm.com>
* Project: [Changes](CHANGES.md), [License](LICENSE.md), [Contributing](CONTRIBUTING.md).

<!--header-shut-->


## Introduction

ProLogger is a custom logger formatter for that prints these fields:

  * Time stamp: such as ISO 8601 format using YYYY-MM-DD and HH:MM:SS.
  * Program name: such as `$PROGRAM_NAME`
  * Hostname: such as `Socket.gethostname`.
  * Process Id: such as `Process.pid`.
  * Severity: such as debug, info, warn, error, and fatal.
  * Message: a string, exception, array, or any object that has a `inspect` method


<!--install-opent-->

## Install

### Gem

Run this command in your shell or terminal:

    gem install sixarm_ruby_pro_logger

Or add this to your Gemfile:

    gem 'sixarm_ruby_pro_logger'

### Require

To require the gem in your code:

    require 'sixarm_ruby_pro_logger'

<!--install-shut-->


## Setup

Example setup:

    Rails.logger.formatter = ProLogger.new

Example use:

    logger.info("Hello")
    => "2011-12-31T12:59:59Z my_program my.example.com 1000 Hello"


## Options

Intialize options:

  * time_format: A format string for the `time.strftime` method.
      Defaults to `"%Y-%m-%dT%H:%M:%SZ"` which is ISO 8601 format.
 
  * progname: The running program name.
      Default is `$PROGRAM_NAME`.
  
  * hostname: The server host name.
      Default is `Socket.gethostname`.
  
  * pid: The process id number.
      Default is `Process.pid`.
  
  * message_separator: Text to use to join mutiple messages.
      Default is " ... ".
  
  * backtrace_separator: Print this between exception backtrace lines.
      Default is " ... ".
  
  * line_separator: Change any message newlines to this text.
      Default is " ... ".    

Example:

    Rails.logger.formatter = ProLogger.new(
      strftime: "%Y-%m-%dT%H:%M:%SZ", 
      progname: "my_program"
      hostname: "my.example.com", 
      pid: 1000,
      line_separator: " / "
      backtrace_separator " \"
      message_separator: " | " 
    )

The message can be:

  * a string: print the string, with leading whitespace stripped, and newlines replaced by line_separator.

  * an exception: print the class, message, and backtrace items separated by backtrace_separator.

  * an array of messages: print the items in the array, separated by message_separator.
 
  * any object: first convert it to a string using object.inspect, then print it as a string as above.
 

## Thanks

Thanks to topfunky for the open source custom logger at:
https://github.com/topfunky/hodel_3000_compliant_logger/
