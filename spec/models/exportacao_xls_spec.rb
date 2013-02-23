# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ExportacaoXls do
  
  it "deveria gerar um arquivo xls passando um OrderedHash" do
    h = ActiveSupport::OrderedHash.new
    h["Item 1"] = ["Valor 1", "Valor 2", "Valor 3"]
    h["Item 2"] = ["Valor 1", "Valor 2", "Valor 3"]
    h["Item 3"] = ["Valor 1", "Valor 2", "Valor 3"]
    h["Item 4"] = ["Valor 1", "Valor 2", "Valor 3"]
    h["Item 5"] = ["Valor 1", "Valor 2", "Valor 3"]

    file_name = "#{RAILS_ROOT}/teste.xls"

    File.delete(file_name) rescue nil

    exportacao = ExportacaoXls.new(h)
    exportacao.to_xls(file_name)

    File.exist?(file_name).should be_true
  end
end

