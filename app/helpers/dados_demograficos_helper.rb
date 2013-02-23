# -*- encoding : utf-8 -*-
module DadosDemograficosHelper
  def tipo_form_column(record, input_name)
    campo = ""    
    campo += radio_button(:record, :tipo, "FECHADA",
      :id => "record_tipo_fechada_#{record.id}",
      :name => input_name,
      :checked => record.tipo.blank? || record.tipo == "FECHADA",
      :onclick => "this.up(2).next().show()")

    campo +=       label_tag("record_tipo_fechada_#{record.id}", 'Fechada')
      
    campo += radio_button(:record, :tipo, "ABERTA",
      :id => "record_tipo_aberta_#{record.id}",
      :name => input_name,
      :onclick => "this.up(2).next().hide()")

    campo += label_tag("record_tipo_aberta_#{record.id}", 'Aberta')
    campo += javascript_tag("$('record_tipo_fechada_#{record.id}').up(2).next().hide()") if record.tipo == "ABERTA"
    campo
  end

  def tipo_column(record)
    record.tipo.humanize
  end
end
