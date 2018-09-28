require_relative File.expand_path("../lib/file_handler_input.rb",File.dirname(__FILE__))
require 'test/unit'

class FileHandlerInputTest < Test::Unit::TestCase
  FILE_DIR = File.expand_path('../in/', File.dirname(__FILE__))
  FILE_NAME = File.expand_path(FILE_DIR + "/in.txt", File.dirname(__FILE__))

  def test_file_not_exists
    delete_file_in
    delete_dir_in
    assert_raise RuntimeError do FileHandlerInput.new end
  end

  def test_read_file_fails
    delete_file_in
    delete_dir_in
    assert_raise RuntimeError do FileHandlerInput.new end
  end

  def test_read_file_success_when_has_content
    delete_file_in
    delete_dir_in
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
    Dir.mkdir(FILE_DIR) unless Dir.exist?(FILE_DIR)
  end

  def create_file_in_with_content
    unless File.exists?(FILE_NAME)
      File.write(FILE_NAME, 'this is a test')
    end
  end

  def create_file_in_without_content
    unless File.exists?(FILE_NAME)
      File.write(FILE_NAME, '')
    end
  end

  def delete_dir_in
    Dir.delete(FILE_DIR) if Dir.exists?(FILE_DIR)
  end

  def delete_file_in
    File.delete(FILE_NAME) if File.exists?(FILE_NAME)
  end
end