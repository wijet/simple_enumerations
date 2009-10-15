ActiveRecord::Schema.define(:version => 0) do
  create_table :groups, :force => true do |t|
    t.string :policy
  end

  create_table :cars, :force => true do |t|
    t.string :color
  end
  
  %w(open closed closed secret).each { |policy| Group.create(:policy => policy) }
  
  %w(red green).each { |color| execute("INSERT INTO cars(color) VALUES('#{color}')") }
end
