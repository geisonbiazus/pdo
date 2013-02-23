# -*- encoding : utf-8 -*-
class RemoveOrdemFromQuestao < ActiveRecord::Migration
  def self.up
    remove_column :questoes, :ordem
  end

  def self.down
    add_column :questoes, :ordem, :integer
  end
end
