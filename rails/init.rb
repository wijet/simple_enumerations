if File.exists?(File.join(RAILS_ROOT, 'config', 'enumerations.yml'))
  require 'simple_enumerations/simple_enumerations'
  require 'simple_enumerations/symbol_extension'
  require 'simple_enumerations/form_helper'
  ActiveRecord::Base.send(:include, Wijet::SimpleEnumerations)
  ActionView::Helpers::FormBuilder.send(:include, Wijet::FormHelper)
end