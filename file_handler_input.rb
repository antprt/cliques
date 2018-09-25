class FileHandlerInput
  INPUT_ROUTE = './in/in.txt'

  def initialize
    unless File.exist?(INPUT_ROUTE)
      raise "No existe el fichero esperado en la carpeta de entrada"
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
      raise "Se produjo un error mientras se intentaba leer el fichero"
    end
  end
end