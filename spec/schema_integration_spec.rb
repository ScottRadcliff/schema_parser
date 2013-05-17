require_relative '../lib/parser'
describe "Schema Integration" do
  it "return a model and it's attributes" do
    @file = File.new("spec/one_model_schema.rb")
    @parser =  SchemaParser::Parser.new(@file)
    expect(@parser.data).to eql([{:model => "users", :attributes => ["email", "name"]}])
  end

  it "returns 2 models and all of their attributes" do
    @file = File.new("spec/two_model_schema.rb")
    @parser =  SchemaParser::Parser.new(@file)
    expect(@parser.data).to eql([
                                {:model => "users", :attributes => ["email", "password"]},
                                {:model => "products", :attributes => ["name", "price"]}])
  end
end


