class AddOrdemToAlternativaDadoDemografico < ActiveRecord::Migration
  def self.up
    add_column :alternativas_dados_demograficos, :ordem, :integer
  end

  def self.down
    remove_column :alternativas_dados_demograficos, :ordem
  end
end
