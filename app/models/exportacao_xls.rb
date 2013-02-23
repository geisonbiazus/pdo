class ExportacaoXls

  attr_accessor :dados

  def initialize(dados)
    self.dados = dados
  end

  def to_xls(path)
    workbook = Spreadsheet::Workbook.new
    sheet = workbook.create_worksheet

    dados.each_with_index do |dado, index|
      titulo, dados = dado
      sheet.column(index).width = 30
      sheet.row(0).push titulo
      dados.each_with_index do |dado, index|
        sheet.row(index + 1).push dado
      end
    end


    sheet.row(0).default_format = Spreadsheet::Format.new :weight => :bold
    workbook.write(path)
  end
end
