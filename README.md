# SixArm.com » Ruby » <br> ProLogger custom logger with better information

* Docs: <http://sixarm.com/sixarm_ruby_pro_logger/doc>
* Repo: <http://github.com/sixarm/sixarm_ruby_pro_logger>
* Email: Joel Parker Henderson, <joel@sixarm.com>


## Introduction

ProLogger is a custom logger for Rails that prints these:

* Timestamp in UTC
* Hostname
* Process Id
* Severity: Rails defines these as debug, info, warn, error, and fatal.
* Message: a string, exception, array, or any object that has a .inspect method)

For docs go to <http://sixarm.com/sixarm_ruby_pro_logger/doc>

Want to help? We're happy to get pull requests.


## Quickstart

Install:

    gem install sixarm_ruby_pro_logger

Bundler:

    gem "sixarm_ruby_pro_logger", "=1.0.0"

Require:

    require "sixarm_ruby_pro_logger"


## Examples

Create:

    @logger = ProLogger.new(:hostname => 'www', :timestamp_format => "%Y-%m-%d %H:%M:%SZ")

Usage:

    @logger.info("Hello")
    => "2011-12-31 12:59:59Z www rails[123] Hello"


## Options

Intialization options:

* hostname: the first piece of our server's hostname, e.g. "www"; default is "localhost"
* timestamp_format: how to print the time; default is standard "%Y-%m-%d %H:%M:%SZ"
* message_separator: print this between message items; default is " ### "
* backtrace_separator: print this between exception backtrace items; default is " | "
* line_separator: change any message newlines to this; default is " /// "

Example:

    @logger = ProLogger.new(
      :hostname => 'www', 
      :timestamp_format => "%Y-%m-%d %H:%M:%SZ"
    )

The message can be:

* a string: print the string, with leading whitespace stripped, and newlines replaced by line_separator.
* an exception: print the class, message, and backtrace items separated by backtrace_separator.
* an array of messages: print the items in the array, separated by message_separator.
* any object: first convert it to a string using object.inspect, then print it as a string as above.

Thanks to topfunky for the open source custom logger at:
https://github.com/topfunky/hodel_3000_compliant_logger/



