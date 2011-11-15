# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "unique_generator/version"

Gem::Specification.new do |s|
  s.name        = "unique_generator"
  s.version     = UniqueGenerator::VERSION
  s.authors     = ["Darcy Laycock"]
  s.email       = ["darcy@filtersquad.com"]
  s.homepage    = "http://github.com/filtersquad/unique_generator"
  s.summary     = %q{Makes generating unique fields in MongoMapper and ActiveRecord easy.}
  s.description = %q{ActiveRecord, MongoMapper and general tools for generating unique values e.g. api keys and tokens.}

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
