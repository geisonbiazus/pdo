# -*- encoding : utf-8 -*-
class CreateAlternativas < ActiveRecord::Migration
  def self.up
    create_table :alternativas do |t|
      t.references :grupo_de_questoes
      t.string :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :alternativas
  end
end
