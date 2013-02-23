# -*- encoding : utf-8 -*-
class CreateQuestoes < ActiveRecord::Migration
  def self.up
    create_table :questoes do |t|
      t.text :descricao
      t.references :grupo_de_questoes

      t.timestamps
    end
  end

  def self.down
    drop_table :questoes
  end
end
