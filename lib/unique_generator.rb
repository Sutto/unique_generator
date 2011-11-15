require "unique_generator/version"
require "active_support/concern"

module UniqueGenerator
  extend ActiveSupport::Concern

  def self.setup!
    ActiveRecord::Base.send(:include, self) if defined?(ActiveRecord::Base)
    MongoMapper::Document.plugin(self)      if defined?(MongoMapper::Document)
  end
  setup!

  if defined?(Rails::Railtie)
    class Railtie < Rails::Railtie
      initializer "unique_generator.initialize" do
        UniqueGenerator.setup!
      end
    end
  end

  CHOICES = (Array('A'..'Z') + Array('a'..'z') + Array('0'..'9'))

  included do
    if defined?(ActiveRecord::Base) && self <= ActiveRecord::Base
      include UniqueChecks::AR
    elsif defined?(MongoMapper::Document) && self <= MongoMapper::Plugins::Document
      include UniqueChecks::MM
    end
  end

  module UniqueChecks

    module MM
      # Returns whether or not the given field is unique to every item.
      def unique_field?(field_name)
        scope = self.class.where(field_name => send(field_name))
        scope = scope.where(:_id.ne => id) if id.present?
        scope.empty?
      end
    end

    module AR
      # Returns whether or not the given field is unique to every item.
      def unique_field?(field_name)
        scope = self.class.where(field_name => send(field_name))
        # When we have an id, check for those with a different id.
        if id.present?
          conditions = self.class.scoped.table[:id].eq(id).not
          scope = scope.where(conditions)
        end
        scope.empty?
      end
    end

  end
  
  module ClassMethods

    # Generate a unique field
    def generate_unique(length = 32, &blk)
      unique = generate_random(length)
      unique = generate_random(length) until blk.call(unique)
      unique
    end

    # Generate a random string with the given number of characters.
    def generate_random(length = 32)
      (1..length).inject("") { |token, _| token << CHOICES.sample }
    end
    
  end
  
  module InstanceMethods
    
    # Generate unique field.
    def generate_unique_field!(name, size = 32)
      return if send(name).present?
      self.class.generate_unique(size) do |token|
        send "#{name}=", token
        unique_field? name
      end
    end
    
  end
  
end