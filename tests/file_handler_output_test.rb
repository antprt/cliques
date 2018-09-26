require_relative File.expand_path("../lib/file_handler_output.rb")
require_relative File.expand_path("../lib/user.rb")
require 'test/unit'

class FileHandlerOutputTest < Test::Unit::TestCase
  def test_file_initialize
    FileHandlerOutput.new
    assert_true File.exists?('./out/out.txt')
    delete_file_out
    delete_dir_out
  end

  def test_write_file_fails
    file_handler_output = FileHandlerOutput.new
    delete_file_out
    delete_dir_out
    assert_raise RuntimeError do file_handler_output.write_file([1,2,3]) end
  end

  def test_write_file_success
    file_handler_output = FileHandlerOutput.new
    file_handler_output.write_file([[User.new("antonio"), User.new("sergio")], [User.new("rubén")]])
    content = ""
      File.open('./out/out.txt', 'r') do |file|
        while line = file.gets
          content += line
        end
      end
    assert_equal "antonio sergio \nrubén \n", content
  end

  private
  def delete_dir_out
    Dir.delete('out') if Dir.exists?('out')
  end

  def delete_file_out
    File.delete('./out/out.txt') if File.exists?('./out/out.txt')
  end
end