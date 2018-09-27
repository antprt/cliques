class FileHandlerInput
  INPUT_ROUTE = '../in/in.txt'

  def initialize
    unless File.exists?(INPUT_ROUTE)
      raise "The file expected not exists in the input folder"
    end
  end

  def read_file
    begin
      file_content = ""
      File.open(INPUT_ROUTE, 'r') do |file|
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