class CreatePesquisas < ActiveRecord::Migration
  def self.up
    create_table :pesquisas do |t|
      t.string :titulo
      t.text :texto_introdutorio

      t.timestamps
    end
  end

  def self.down
    drop_table :pesquisas
  end
end
