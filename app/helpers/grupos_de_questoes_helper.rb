# -*- encoding : utf-8 -*-
module GruposDeQuestoesHelper
  def tipo_form_column(record, input_name)
    campo = ""
    campo += radio_button(:record, :tipo, "FECHADAS",
      :id => "record_tipo_fechadas_#{record.id}",
      :name => input_name,
      :checked => record.tipo.blank? || record.tipo == "FECHADAS",
      :onclick => "this.up(2).next().show()")

    campo +=       label_tag("record_tipo_fechadas_#{record.id}", 'Fechadas')

    campo += radio_button(:record, :tipo, "ABERTAS",
      :id => "record_tipo_abertas_#{record.id}",
      :name => input_name,
      :onclick => "this.up(2).next().hide()")

    campo += label_tag("record_tipo_abertas_#{record.id}", 'Abertas')
    campo += javascript_tag("$('record_tipo_fechadas_#{record.id}').up(2).next().hide()") if record.tipo == "ABERTAS"
    campo
  end

  def tipo_column(record)
    record.tipo.humanize
  end

end
