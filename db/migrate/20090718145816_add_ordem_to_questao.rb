# -*- encoding : utf-8 -*-
class AddOrdemToQuestao < ActiveRecord::Migration
  def self.up
    add_column :questoes, :ordem, :integer
  end

  def self.down
    remove_column :questoes, :ordem
  end
end
