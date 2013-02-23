# -*- encoding : utf-8 -*-
class CreateUsuarios < ActiveRecord::Migration
  def self.up
    create_table :usuarios do |t|
      t.string :usuario
      t.string :senha
      
      t.timestamps
    end

    Usuario.create(:usuario => "admin", :senha => "admin")
  end

  def self.down
    drop_table :usuarios
  end
end
