class FileHandlerOutput
  OUTPUT_FILE_NAME = 'out.txt'
  OUTPUT_DIR_ROUTE = '../out/'

  def initialize
    if File.exists?(File.expand_path(OUTPUT_DIR_ROUTE + OUTPUT_FILE_NAME,File.dirname(__FILE__)))
      File.delete(File.expand_path(OUTPUT_DIR_ROUTE + OUTPUT_FILE_NAME,File.dirname(__FILE__)))
      Dir.delete(File.expand_path(OUTPUT_DIR_ROUTE,File.dirname(__FILE__)))
    end
    Dir.mkdir(OUTPUT_DIR_ROUTE) unless Dir.exists?(OUTPUT_DIR_ROUTE)
    File.write(OUTPUT_DIR_ROUTE + OUTPUT_FILE_NAME, '') unless File.exists?(OUTPUT_DIR_ROUTE + OUTPUT_FILE_NAME)
  end

  def write_file(users_cliques)
    begin
      f = File.open(OUTPUT_DIR_ROUTE + OUTPUT_FILE_NAME, 'w')
      users_cliques.each do |array|
        array.each do |user|
          f.write("#{user.name} ")
        end
        f.write("\n")
      end
      f.close
      return true
    rescue
      raise "An error occurred while trying to write the file"
    end
  end

end