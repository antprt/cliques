class FileHandlerInput
  INPUT_ROUTE = './in/in.txt'
  OUTPUT_ROUTE = './in/in.txt'

  def initialize
    unless File.exist?(INPUT_ROUTE)
      raise "No existe el fichero 'in.txt' en la carpeta 'in' que debe estar en el mismo directorio que el ejecutable '.rb'"
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
      raise "Se produjo un error mientras se intentaba leer el fichero 'in.txt'"
    end
  end
end