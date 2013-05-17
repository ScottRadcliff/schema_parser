module ActiveRecord
  class Schema
    def self.define(something)
    end
  end
end

ActiveRecord::Schema.define(:version => 20120820230716) do

  create_table "users", :force => true do |t|
    t.string "email"
    t.string "password"
  end

  create_table "products", :force => true do |t|
    t.string "name"
    t.string "price", :limit => 128
  end

end
