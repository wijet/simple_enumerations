if File.exists?(File.join(RAILS_ROOT, 'config', 'enumerations.yml'))
  require 'simple_enumerations'
  require 'symbol_extension'
  require 'action_view/form_helper'
  ActiveRecord::Base.send(:include, Wijet::SimpleEnumerations)
  ActionView::Helpers::FormBuilder.send(:include, Wijet::FormHelper)
end