# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "unique_generator/version"

Gem::Specification.new do |s|
  s.name        = "unique_generator"
  s.version     = UniqueGenerator::VERSION
  s.authors     = ["Darcy Laycock"]
  s.email       = ["sutto@sutto.net"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "unique_generator"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "activesupport"

  s.add_development_dependency "activerecord"
  s.add_development_dependency "mongo_mapper"
  s.add_development_dependency "reversible_data"
  s.add_development_dependency "rr"
  s.add_development_dependency "rspec"

end
