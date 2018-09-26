class FileHandlerOutput
  OUTPUT_ROUTE = '../out/out.txt'

  def initialize
    if File.exists?(OUTPUT_ROUTE)
      File.delete('./out/out.txt')
      Dir.delete('out')
    end
    Dir.mkdir('out') unless Dir.exists?('out')
    File.write('./out/out.txt', '') unless File.exists?('./out/out.txt')
  end

  def write_file(users_cliques)
    begin
      f = File.open('./out/out.txt', 'w')
      users_cliques.each do |array|
        array.each do |user|
          f.write("#{user.name} ")
        end
        f.write("\n")
      end
      f.close
      return true
    rescue
      raise "Se produjo un error mientras se intentaba escribir el fichero"
    end
  end

end