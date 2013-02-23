class CreateDadosDemograficos < ActiveRecord::Migration

  def self.up
    create_table :dados_demograficos do |t|
      t.references :pesquisa
      t.string :questao
      t.string :tipo
      t.timestamps
    end

    
  end

  def self.down
    drop_table :dados_demograficos
  end
end
