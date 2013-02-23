# -*- encoding : utf-8 -*-
class CreateGruposDeQuestoes < ActiveRecord::Migration
  def self.up
    create_table :grupos_de_questoes do |t|
      t.string :descricao
      t.string :tipo

      t.timestamps
    end
  end

  def self.down
    drop_table :grupos_de_questoes
  end
end
