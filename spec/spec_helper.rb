begin
  require File.dirname(__FILE__) + '/../../../../spec/spec_helper'

rescue LoadError
  puts "You need to install rspec in your base app"
  exit
end

Spec::Runner.configure do |config|
  config.before(:all) do
    path = [File.dirname(__FILE__), 'app_root', 'config', 'enumerations.yml'] * '/'
    File.stub!(:join).and_return(path)
    load File.dirname(__FILE__) + '/../lib/simple_enumerations/simple_enumerations.rb'
    Rails.cache.delete('_simple_enumerations_')
  end
end

require File.dirname(__FILE__) + '/app_root/app/models/group.rb'
require File.dirname(__FILE__) + '/app_root/db/schema.rb'

plugin_spec_dir = File.dirname(__FILE__)

