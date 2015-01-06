# SixArm.com » Ruby » <br> ProLogger custom logger with better information

* Doc: <http://sixarm.com/sixarm_ruby_pro_logger/doc>
* Gem: <http://rubygems.org/gems/sixarm_ruby_pro_logger>
* Repo: <http://github.com/sixarm/sixarm_ruby_pro_logger>
* Email: Joel Parker Henderson, <joel@sixarm.com>


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


## Install quickstart

Install:

    gem install sixarm_ruby_pro_logger

Bundler:

    gem "sixarm_ruby_pro_logger", "~>2.0.0"

Require:

    require "sixarm_ruby_pro_logger"


## Install with security (optional)

To enable high security for all our gems:

    wget http://sixarm.com/sixarm.pem
    gem cert --add sixarm.pem
    gem sources --add http://sixarm.com

To install with high security:

    gem install sixarm_ruby_pro_logger --trust-policy HighSecurity



## Thanks

Thanks to topfunky for the open source custom logger at:
https://github.com/topfunky/hodel_3000_compliant_logger/


## Changes

* 2014-03-15 2.0.0 Upgrades to be a formatter plus new options
* 2012-03-14 1.1.0 Update docs, tests
* 2011-11-27 1.0.0 Publish


## License

You may choose any of these open source licenses:

  * Apache License
  * BSD License
  * CreativeCommons License, Non-commercial Share Alike
  * GNU General Public License Version 2 (GPL 2)
  * GNU Lesser General Public License (LGPL)
  * MIT License
  * Perl Artistic License
  * Ruby License

The software is provided "as is", without warranty of any kind, 
express or implied, including but not limited to the warranties of 
merchantability, fitness for a particular purpose and noninfringement. 

In no event shall the authors or copyright holders be liable for any 
claim, damages or other liability, whether in an action of contract, 
tort or otherwise, arising from, out of or in connection with the 
software or the use or other dealings in the software.

This license is for the included software that is created by SixArm;
some of the included software may have its own licenses, copyrights, 
authors, etc. and these do take precedence over the SixArm license.

Copyright (c) 2005-2015 Joel Parker Henderson
