class AddOrdemToDadoDemografico < ActiveRecord::Migration
  def self.up
    add_column :dados_demograficos, :ordem, :integer
  end

  def self.down
    remove_column :dados_demograficos, :ordem
  end
end
