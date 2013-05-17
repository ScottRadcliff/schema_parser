
  def schema_with_1_model
    schema = <<-eos
      ActiveRecord::Schema.define(:version => 20120820230716) do

        create_table "posts", :force => true do |t|
        end
      end
      eos
      schema
  end

  def schema_with_2_models
    schema = <<-eos
    ActiveRecord::Schema.define(:version => 20120820230716) do

      create_table "posts", :force => true do |t|
      end

      create_table "users", :force => true do |t|
        t.string   "email"
        t.string   "salt",               :limit => 128
        t.datetime "created_at"
        t.datetime "updated_at"
      end
    end
    eos
  schema
  end


  def schema_with_2_attributes
    schema = <<-eos
    ActiveRecord::Schema.define(:version => 20120820230716) do

      create_table "posts", :force => true do |t|
        t.string   "salt",               :limit => 128
        t.string   "email",               :limit => 128
      end
    eos
    schema
  end







