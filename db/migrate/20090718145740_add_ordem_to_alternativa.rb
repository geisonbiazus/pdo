# -*- encoding : utf-8 -*-
class AddOrdemToAlternativa < ActiveRecord::Migration
  def self.up
    add_column :alternativas, :ordem, :integer
  end

  def self.down
    remove_column :alternativas, :ordem
  end
end
