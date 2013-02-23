# -*- encoding : utf-8 -*-
class CreateRespostasDadosDemograficos < ActiveRecord::Migration
  def self.up
    create_table :respostas_dados_demograficos do |t|
      t.references :dado_demografico
      t.references :alternativa_dado_demografico
      t.references :respostas_pesquisa
      t.string :resposta

      t.timestamps
    end
  end

  def self.down
    drop_table :respostas_dados_demograficos
  end
end
