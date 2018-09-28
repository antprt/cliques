class FileHandlerInput
  INPUT_FILE_NAME = 'in.txt'
  INPUT_FILE_DIR = '../in/'

  def initialize
    unless File.exists?(File.expand_path(INPUT_FILE_DIR + INPUT_FILE_NAME,File.dirname(__FILE__)))
      raise "The file expected not exists in the input folder"
    end
  end

  def read_file
    begin
      file_content = ""
      File.open(File.expand_path(INPUT_FILE_DIR + INPUT_FILE_NAME,File.dirname(__FILE__)), 'r') do |file|
        while line = file.gets
          file_content += line
        end
      end
      return file_content
    rescue
      raise "An error occurred while trying to read the file"
    end
  end
end