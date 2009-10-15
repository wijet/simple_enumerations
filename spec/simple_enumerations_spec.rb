require File.dirname(__FILE__) + '/spec_helper'
include Wijet::SimpleEnumerations::EnumerationString

describe Enumeration do
  before :all do
    @policies = %w(open closed secret)
    @colors = ['red', 'green', 'blue', 'yellow', 'light green']
  end
  
  describe "class methods" do
    it "should respond to :all and return all enumerations" do
      Enumeration.all.should == {'policy' => @policies, 'color' => @colors}
    end
  
    it "should respond to :[] and return requested enumeration" do
      Enumeration[:policy].should == @policies
      Enumeration['color'].should == @colors
    end
    
    it "should respond to :[] and raise ArgumentError when requested enumeration doesn't exist" do
      lambda {
        Enumeration[:fooooo]
      }.should raise_error(ArgumentError)
    end
    
    describe "generating instance methods" do
      it "should generate instance methods, named in format '#\{value\}?'" do
        (@policies + @colors).each do |value|
          Enumeration.new.should respond_to("#{value.gsub(/[^[:alnum:]]/, '_')}?")
        end
      end

      it "should replace non-alphanumeric characters with underscore" do
        Enumeration.new.should respond_to(:light_green?)
      end      
    end
  end
  
  describe "generated instance methods" do
    it "should return true if enumeration has particular value" do
      enum = Enumeration.new('red')

      enum.should be_red # calls enum.red?
      enum.should_not be_light_green
      enum.should_not be_open
    end
  end
end

describe Wijet::SimpleEnumerations::ClassMethods do
  describe "has_enumerated" do
    before do
      @group = Group.new(:policy => :open)
    end
    
    it "should generate reader methods which return Enumeration object" do
      @group.policy.should == 'open'
      @group.policy.should be_a(Enumeration)
    end
    
    it "should generate writer methods which assign enumeration value" do
      @group.policy = :open
      @group.policy.should == Enumeration.new('open')
    end
    
    it "should raise ArgumentError when assigning non-enumeration value" do
      lambda {
        @group.policy = :foooooo
      }.should raise_error(ArgumentError)
    end
  end
end
