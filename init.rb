require 'simple_enumerations'
require 'symbol_extension'
require 'action_view/form_helper'
ActiveRecord::Base.send(:include, Wijet::SimpleEnumerations)
ActionView::Helpers::FormBuilder.send(:include, Wijet::FormHelper)
