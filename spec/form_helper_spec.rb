require File.dirname(__FILE__) + '/spec_helper'
require File.dirname(__FILE__) + '/app_root/app/models/group.rb'

describe Wijet::FormHelper do
  include Wijet::FormHelper
  include ActionView::Helpers
  
  before do
    stub!(:protect_against_forgery?).and_return(false)
    stub!(:output_buffer).and_return('')
    @group = mock_model(Group, :policy => nil)
  end
  
  it "should generate selectbox for enumeration" do
    render_select.should == '<select id="group_policy" name="group[policy]"><option value="open">open</option>
<option value="close">close</option>
<option value="secret">secret</option></select>'
  end
  
  it "should generate selectbox for enumeration with selected value" do
    @group = mock_model(Group, :policy => :open)
    render_select.should == '<select id="group_policy" name="group[policy]"><option value="open" selected="selected">open</option>
<option value="close">close</option>
<option value="secret">secret</option></select>'
  end
end

def render_select  
  returning "" do |select|
    form_for @group, :url => "/groups" do |f| 
      select << f.select_enumeration(:policy)
    end
  end
end