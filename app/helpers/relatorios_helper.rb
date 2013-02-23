require RAILS_ROOT + '/lib/comandos_java'

module RelatoriosHelper

  def enviar_relatorio(parametros)
    config_db =  ActiveRecord::Base.connection.instance_variable_get('@config')
    default = {}.merge(config_db)

    parametros[:nome_arquivo] = gera_nome_relatorio(parametros[:nome_relatorio])
    nome = "#{RAILS_ROOT}/tmp/reports/#{parametros[:nome_arquivo]}.pdf"

    Dir.mkdir(DIR_TMP_REPORTS) rescue nil
    remove_arquivos_antigos

    Comandos::Java.executa_jasper(default.merge(parametros).delete_if {|key, value| value.blank? || value == "null"})

    send_file(nome, :filename => "#{parametros[:nome_relatorio]}.pdf", :type => 'application/pdf', :disposition => 'inline')
  end

  def enviar_relatorio_xls(nome_relatorio, dados)
    nome_arquivo = gera_nome_relatorio(nome_relatorio)
    nome = "#{RAILS_ROOT}/tmp/reports/#{nome_arquivo}.xls"

    Dir.mkdir(DIR_TMP_REPORTS) rescue nil
    remove_arquivos_antigos

    exportacao = ExportacaoXls.new(dados)
    exportacao.to_xls(nome)

    send_file(nome, :filename => "#{nome_relatorio}.xls", :type => 'application/xls', :disposition => 'inline')
  end

  private

  def gera_nome_relatorio(nome_relatorio)
    time = Time.now
    data_hora = "#{string_hoje}#{time.hour.to_s.rjust(2,"0")}#{time.min.to_s.rjust(2,"0")}#{time.sec.to_s.rjust(2,"0")}"

    "#{data_hora}_#{nome_relatorio}"
  end

  def remove_arquivos_antigos
    Dir.foreach(DIR_TMP_REPORTS) do |file|
      File.delete("#{DIR_TMP_REPORTS}/#{file}") if file.match(/\.pdf$/) && file[0..7] != string_hoje
      File.delete("#{DIR_TMP_REPORTS}/#{file}") if file.match(/\.xls$/) && file[0..7] != string_hoje
    end
  end

  def string_hoje
    time  = Time.now
    "#{time.year}#{time.month.to_s.rjust(2,"0")}#{time.day.to_s.rjust(2,"0")}"
  end

end
