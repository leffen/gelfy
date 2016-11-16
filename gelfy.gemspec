Gem::Specification.new do |s|
  s.name = "gelfy"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Alexey Palazhchenko", "Lennart Koopmann", "Zac Sprackett", "leffen"]
  s.date = "2016-11-15"
  s.description = "Library to send GELF messages to a que for pickup of Graylog or similar"
  s.email = "leffen@gmail.com"
  s.extra_rdoc_files = [
    "CHANGELOG",
    "LICENSE",
    "README.md"
  ]
  s.files = [
    "CHANGELOG",
    "CONTRIBUTING.md",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE",
    "README.md",
    "Rakefile",
    "VERSION",
    "gelfy.gemspec",
    "lib/gelfy.rb",
    "lib/gelfy/logger.rb",
    "lib/gelfy/notifier.rb",
    "lib/gelfy/severity.rb"
  ]
  s.homepage = "http://github.com/leffen/gelfy"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5.1"
  s.summary = "Library to send GELF messages to a que to be consumed by Graylog"

  s.add_runtime_dependency(%q<json>, [">= 0"])
  s.add_runtime_dependency(%q<redis>, [">= 0"])
  s.add_runtime_dependency(%q<bunny>, [">= 0"])
  s.add_runtime_dependency(%q<oj>, [">= 0"])
end

