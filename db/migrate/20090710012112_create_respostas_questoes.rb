class CreateRespostasQuestoes < ActiveRecord::Migration
  def self.up
    create_table :respostas_questoes do |t|
      t.references :questao
      t.references :alternativa
      t.references :respostas_pesquisa
      t.string :resposta

      t.timestamps
    end
  end

  def self.down
    drop_table :respostas_questoes
  end
end
