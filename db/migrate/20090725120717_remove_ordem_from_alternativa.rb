class RemoveOrdemFromAlternativa < ActiveRecord::Migration
  def self.up
    remove_column :alternativas, :ordem
  end

  def self.down
    add_column :alternativas, :ordem, :integer
  end
end
