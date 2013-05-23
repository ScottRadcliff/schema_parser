module SchemaParser
  class Parser

    def initialize(file)
      text = file.read
      @data = []
      Parser.find_models(text).each do |model|
        model_attributes = Parser.find_attributes(text, model)
        @data << {:model => model, :attributes => model_attributes}
      end
    end

    def data
      @data
    end

    def self.find_models(string)
      models = []
      string.lines.each do |line|
        if line.include? "create_table"
          models << line.scan(/\w+/)[1]
        end
      end
      models
    end


    def self.find_attributes(source, model)
      @counter = 0
      @start, @stop = nil, nil
      source.lines.each do |line|
       set_start_and_stop_point(line, model)
      end
      perform_attribute_extraction(source.lines.slice!(@start..@stop))
    end

    private
    def self.perform_attribute_extraction(collection)
      attributes = []
      collection.slice!(1, collection.size - 1).each do |line|
        scanned_word = line.scan(/\w+/)[2]
        attributes << scanned_word unless scanned_word.nil?
      end
      attributes
    end

    def self.set_start_and_stop_point(line, model)
      if line.include? model
        @start = @counter
      elsif !@start.nil? && @stop.nil?
        if line.include? "end"
          @stop = @counter
        end
      end
       @counter = @counter + 1
    end
  end
end
