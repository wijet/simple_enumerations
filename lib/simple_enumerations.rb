module Wijet
  module SimpleEnumerations
    VERSION = '0.1.0'
    
    def self.included(base)
      base.extend ClassMethods
    end
    
    module ClassMethods
      def has_enumerated(name)
        name = name.to_s
        
        define_method("#{name}=") do |value|
          value = value.to_s
          unless Enumeration[name].include?(value) or value.blank?
            raise ArgumentError, "'#{value}' is not a value of enumeration '#{name}'" 
          end
          write_attribute(name, value)
        end
        
        define_method(name) do
          EnumerationString::Enumeration.new(attributes[name])
        end
      end
    end
    
    module EnumerationString
      class Enumeration < String
        def initialize(value = "")
          super(value)
        end
        
        class << self
          def [](name)
            raise ArgumentError, "Enumeration '#{name}' doesn't exist" unless all.has_key?(name.to_s)
            all[name.to_s]
          end
      
          def all
            Rails.cache.fetch('_simple_enumerations_') do
              YAML::load(File.read(File.join(RAILS_ROOT, 'config', 'enumerations.yml')))
            end
          end
        end
      
        all.values.flatten.uniq.each do |value|
          define_method("#{value.gsub(/[^[:alnum:]]/, '_')}?") { self == value }
        end unless all.blank?

        def ===(object)
          self == object.to_s
        end
      end
    end
  end
end

include Wijet::SimpleEnumerations::EnumerationString
