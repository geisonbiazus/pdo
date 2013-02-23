# -*- encoding : utf-8 -*-
class RemoveOrdemFromAlternativaDadoDemografico < ActiveRecord::Migration
  def self.up
    remove_column :alternativas_dados_demograficos, :ordem
  end

  def self.down
    add_column :alternativas_dados_demograficos, :ordem, :integer
  end
end
