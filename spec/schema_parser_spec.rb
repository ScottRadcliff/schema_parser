require_relative '../schema_parser'
require_relative 'spec_helper'

describe "SchemaParser" do
  it "parses a model" do
    expect(SchemaParser::Parser.find_models(schema_with_1_model)).to eql(["posts"])
  end

  it "parses 2 models" do
    expect(SchemaParser::Parser.find_models(schema_with_2_models)).to eql(["posts", "users"])
  end

  it "parses an attribute for a model" do
    expect(SchemaParser::Parser.find_attributes(schema_with_2_models, "users")).to eql(["email", "salt", "created_at", "updated_at"])
  end

  it "parses 2 attributes for a model" do
    expect(SchemaParser::Parser.find_attributes(schema_with_2_attributes, "posts")).to eql(["salt", "email"]) 
  end

  it "ignores password attribute" do
    expect(SchemaParser::Parser.find_attributes(schema_with_2_models, "users")).to eql(["email", "created_at", "updated_at"])
  end
end


