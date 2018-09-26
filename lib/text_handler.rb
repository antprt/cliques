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
      raise "La cadena no coincide con palabras separadas por espacios"
    end
  end
end