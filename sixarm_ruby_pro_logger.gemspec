# -*- coding: utf-8 -*-

Gem::Specification.new do |s|

  s.name           = "sixarm_ruby_pro_logger"
  s.summary        = "SixArm.com » Ruby » ProLogger custom logger for Rails"
  s.description    = "Logs more information than the typical Ruby logger."
  s.version        = "2.0.0"
  s.author         = "SixArm"
  s.email          = "sixarm@sixarm.com"
  s.homepage       = "http://sixarm.com/"
  s.licenses       = ["BSD", "GPL", "MIT", "PAL", "Various"]

  s.signing_key    = "/home/sixarm/keys/certs/sixarm-rsa-4096-x509-20145314-private.pem"
  s.cert_chain     = ["/home/sixarm/keys/certs/sixarm-rsa-4096-x509-20150314-public.pem"]

  s.platform       = Gem::Platform::RUBY
  s.require_path   = "lib"
  s.has_rdoc       = true

  top_files        = [".gemtest", "CONTRIBUTING.md", "Rakefile", "README.md", "VERSION"]
  lib_files        = ["lib/#{s.name}.rb"]
  test_files       = ["test/#{s.name}_test.rb"]

  s.files          = top_files + lib_files + test_files
  s.test_files     = test_files

end
