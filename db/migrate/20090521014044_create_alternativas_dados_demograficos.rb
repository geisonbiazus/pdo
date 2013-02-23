class CreateAlternativasDadosDemograficos < ActiveRecord::Migration
  def self.up
    create_table :alternativas_dados_demograficos do |t|
      t.references :dado_demografico
      t.string :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :alternativas_dados_demograficos
  end
end
