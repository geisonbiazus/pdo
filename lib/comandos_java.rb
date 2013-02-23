# -*- encoding : utf-8 -*-

module Comandos
  module Java
    def self.executa_jasper(opcoes)
      cmd = "java -cp \"#{classpath_jasper}\" JasperReports "
      opcoes[:SUBREPORT_DIR] = Rails.root + '/app/reports/'
      cmd << converte_parametros(opcoes)

      system(cmd)
    end

    def self.classpath_jasper
      dir_jasper = Dir.getwd + "/app/jasper"
      path = dir_jasper +  "/bin"

      Dir.foreach(dir_jasper+"/lib") do |file|
        path << (":#{dir_jasper}/lib/"+file) if file =~ /\.jar$/
      end

      path
    end

    def self.converte_parametros(params)
      params.collect { |chave, valor| "-p#{chave}=\"#{valor.to_s.gsub(/"/,'').gsub(/'/,'\'')}\"" if not valor.nil? }.join(" ")
    end
  end
end
