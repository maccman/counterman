Gem::Specification.new do |s|
  s.name              = "counterman"
  s.version           = "0.0.3"
  s.summary           = "Counter Analytics"
  s.description       = "Fast and furious tracking system using Redis hash operations"
  s.authors           = ["maccman"]
  s.licenses          = ["MIT"]
  s.email             = ["info@eribium.org"]
  s.homepage          = "http://github.com/maccman/counterman"
  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files test`.split("\n")

  s.add_dependency("redis", "~> 3.0.3")

  s.add_development_dependency("minitest",        "~> 4.3.0")
  s.add_development_dependency("minitest-given",  "~> 3.0.0")
  s.add_development_dependency("redis-namespace", "~> 1.2.1")
end
