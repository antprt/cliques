class FileHandlerOutput
  OUTPUT_ROUTE = '../out/out.txt'

  def initialize
    if File.exists?(OUTPUT_ROUTE)
      File.delete(OUTPUT_ROUTE)
      Dir.delete('../out')
    end
    Dir.mkdir('../out') unless Dir.exists?('../out')
    File.write(OUTPUT_ROUTE, '') unless File.exists?(OUTPUT_ROUTE)
  end

  def write_file(users_cliques)
    begin
      f = File.open(OUTPUT_ROUTE, 'w')
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