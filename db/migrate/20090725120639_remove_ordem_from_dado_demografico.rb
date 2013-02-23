class RemoveOrdemFromDadoDemografico < ActiveRecord::Migration
  def self.up
    remove_column :dados_demograficos, :ordem
  end

  def self.down
    add_column :dados_demograficos, :ordem, :integer
  end
end
