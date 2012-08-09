source "http://rubygems.org"

# Specify your gem's dependencies in unique_generator.gemspec
gemspec

# Allow testing multiple versions with Travis.
rails_version = ENV['RAILS_VERSION']
if rails_version && rails_version.length > 0
  puts "Testing Rails Version = #{rails_version}"
  gem 'activerecord', rails_version
end

gem "sqlite3"
gem "bson_ext"
gem "rake"