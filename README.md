# Schema Parser

Tired of being hounded for yet another report? Yeah, me too. So I sought a solution, but I couldn't find much. I started to think of ways that I could allow a user of the software I work on to generate the report themselves. The simplest solution I could find was to parse the schema and build a form out of the models and attributes.

The SchemaParser library aims to solve the reporting in Rails problem. It parses a schema file and generates a collection of models and attributes for use in generating reports. 

## Example
```ruby
    # Assuming this is the schema.rb 
    ActiveRecord::Schema.define(:version => 20120820230716) do

      create_table "users", :force => true do |t|
        t.string "email"
        t.string "username"
      end

      create_table "products", :force => true do |t|
        t.string "name"
        t.string "price", :limit => 128
      end

    end

    SchemaParser::Parser.new(path_to_schema.rb)
      #=> [{:model => "users", :attributes => ["email", "username"]},
          {:model => "products", :attributes => ["name", "price"]}]
```

### TODOS
* Ignored attributes like password
* Set up associations so we can query with joins
* Config file so the library can be cofigured on a case be case basis 

