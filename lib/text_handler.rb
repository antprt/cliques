class TextHandler
  attr_accessor :text

  def initialize(text)
    @text = text.to_s
  end

  def parse_to_array_unique
    pattern = Regexp.new("[\w\W\s]+").freeze
    if pattern.match(@text)
      names_array = @text.split(" ")
      return names_array.uniq
    else
      raise "The input does not match words separated by spaces"
    end
  end
end