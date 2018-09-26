require_relative File.expand_path("../lib/text_handler.rb")
require 'test/unit'

class TextHandlerTest < Test::Unit::TestCase

  def test_initialize
    assert_equal "2", TextHandler.new(2).text
  end

  def test_parse_to_array_unique_malformed
    assert_raise RuntimeError do TextHandler.new('').parse_to_array_unique end    
  end

  def test_parse_to_array_unique_success
    assert_equal ["this", "is", "a", "test"], TextHandler.new("this is a test").parse_to_array_unique
  end
end