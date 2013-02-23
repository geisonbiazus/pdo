# -*- encoding : utf-8 -*-
class CreateRespostasPesquisas < ActiveRecord::Migration
  def self.up
    create_table :respostas_pesquisas do |t|
      t.references :pesquisa

      t.timestamps
    end
  end

  def self.down
    drop_table :respostas_pesquisas
  end
end
