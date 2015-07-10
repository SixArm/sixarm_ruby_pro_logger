# Ruby » <br> ProLogger custom logger with better information

* Doc: <http://sixarm.com/sixarm_ruby_pro_logger/doc>
* Gem: <http://rubygems.org/gems/sixarm_ruby_pro_logger>
* Repo: <http://github.com/sixarm/sixarm_ruby_pro_logger>
<!--HEADER-SHUT-->


## Introduction

ProLogger is a custom logger formatter for Rails that prints these:

  * Time stamp: such as ISO 8601 format using YYYY-MM-DD and HH:MM:SS.
  * Program name: such as `$PROGRAM_NAME`
  * Hostname: such as `Socket.gethostname`.
  * Process Id: such as `Process.pid`.
  * Severity: such as debug, info, warn, error, and fatal.
  * Message: a string, exception, array, or any object that has a `inspect` method

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
 
For docs go to <http://sixarm.com/sixarm_ruby_pro_logger/doc>

Want to help? We're happy to get pull requests.


<!--INSTALL-OPEN-->

## Install

To install using a Gemfile, add this:

    gem "sixarm_ruby_pro_logger", ">= 2.0.1", "< 3"

To install using the command line, run this:

    gem install sixarm_ruby_pro_logger -v ">= 2.0.1, < 3"

To install using the command line with high security, run this:

    wget http://sixarm.com/sixarm.pem
    gem cert --add sixarm.pem && gem sources --add http://sixarm.com
    gem install sixarm_ruby_pro_logger -v ">= 2.0.1, < 3" --trust-policy HighSecurity

To require the gem in your code:

    require "sixarm_ruby_pro_logger"

<!--INSTALL-SHUT-->



## Thanks

Thanks to topfunky for the open source custom logger at:
https://github.com/topfunky/hodel_3000_compliant_logger/
