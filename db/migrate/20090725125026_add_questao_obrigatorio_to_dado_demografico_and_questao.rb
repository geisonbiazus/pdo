class AddQuestaoObrigatorioToDadoDemograficoAndQuestao < ActiveRecord::Migration
  def self.up
    add_column :dados_demograficos, :questao_obrigatoria, :boolean
    add_column :questoes, :questao_obrigatoria, :boolean
  end

  def self.down
    remove_column :dados_demograficos, :questao_obrigatoria
    remove_column :questoes, :questao_obrigatoria
  end
end
