require_relative File.expand_path("../lib/file_handler_input.rb")
require 'test/unit'

class FileHandlerInputTest < Test::Unit::TestCase
  def test_file_not_exists
    assert_raise RuntimeError do FileHandlerInput.new end
  end

  def test_read_file_fails
    assert_raise RuntimeError do FileHandlerInput.new end
  end

  def test_read_file_success_when_has_content
    create_dir_in
    create_file_in_with_content
    content = FileHandlerInput.new.read_file
    assert_equal "this is a test", content
    delete_file_in
    delete_dir_in
  end

  def test_read_file_success_when_is_empty
    create_dir_in
    create_file_in_without_content
    content = FileHandlerInput.new.read_file
    assert_equal "", content
    delete_file_in
    delete_dir_in
  end

  private
  def create_dir_in
    Dir.mkdir('in') unless Dir.exist?('in')
  end

  def create_file_in_with_content
    unless File.exists?("in.txt")
      File.write('./in/in.txt', 'this is a test')
    end
  end

  def create_file_in_without_content
    unless File.exists?("in.txt")
      File.write('./in/in.txt', '')
    end
  end

  def delete_dir_in
    Dir.delete('in')
  end

  def delete_file_in
    File.delete('./in/in.txt')
  end
end