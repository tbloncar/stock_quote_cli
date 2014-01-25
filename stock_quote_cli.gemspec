# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "stock_quote_cli"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Travis Loncar"]
  s.date = "2014-01-25"
  s.description = "A Ruby gem that provides a command-line interface for fetching stock information."
  s.email = "loncar.travis@gmail.com"
  s.executables = ["stock"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    ".rspec",
    ".travis.yml",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "bin/stock",
    "lib/stock_quote_cli.rb",
    "lib/stock_quote_cli/cli.rb",
    "lib/stock_quote_cli/history.rb",
    "lib/stock_quote_cli/quote.rb",
    "spec/spec_helper.rb",
    "spec/stock_quote_cli_spec.rb",
    "stock_quote_cli.gemspec"
  ]
  s.homepage = "http://github.com/tbloncar/stock_quote_cli"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.6"
  s.summary = "A Ruby gem that provides a command-line interface for fetching stock information."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<thor>, [">= 0"])
      s.add_runtime_dependency(%q<stock_quote>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_development_dependency(%q<shoulda-matchers>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.7"])
      s.add_runtime_dependency(%q<thor>, ["~> 0.18.1"])
      s.add_runtime_dependency(%q<stock_quote>, ["~> 1.1.0"])
    else
      s.add_dependency(%q<thor>, [">= 0"])
      s.add_dependency(%q<stock_quote>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_dependency(%q<shoulda-matchers>, [">= 0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.7"])
      s.add_dependency(%q<thor>, ["~> 0.18.1"])
      s.add_dependency(%q<stock_quote>, ["~> 1.1.0"])
    end
  else
    s.add_dependency(%q<thor>, [">= 0"])
    s.add_dependency(%q<stock_quote>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.8.0"])
    s.add_dependency(%q<shoulda-matchers>, [">= 0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.7"])
    s.add_dependency(%q<thor>, ["~> 0.18.1"])
    s.add_dependency(%q<stock_quote>, ["~> 1.1.0"])
  end
end

