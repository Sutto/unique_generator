require 'rubygems'
require 'bundler'

Bundler.require :default, :development

Dir[Pathname(__FILE__).dirname.join("support", "**", "*.rb")].each { |f| require f }

UniqueGenerator.setup!

RSpec.configure do |config|
  config.mock_with :rr
end