# SixArm.com » Ruby » <br> ProLogger custom logger with better information

* Doc: <http://sixarm.com/sixarm_ruby_pro_logger/doc>
* Gem: <http://rubygems.org/gems/sixarm_ruby_pro_logger>
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


## Install quickstart

Install:

    gem install sixarm_ruby_pro_logger

Bundler:

    gem "sixarm_ruby_pro_logger", "~>1.0.0"

Require:

    require "sixarm_ruby_pro_logger"


## Install with security (optional)

To enable high security for all our gems:

    wget http://sixarm.com/sixarm.pem
    gem cert --add sixarm.pem
    gem sources --add http://sixarm.com

To install with high security:

    gem install sixarm_ruby_pro_logger --test --trust-policy HighSecurity


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



## Changes

* 2012-03-14 1.0.0 Update docs, tests
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

Copyright (c) 2005-2013 Joel Parker Henderson
