# -*- encoding : utf-8 -*-
class AdicionaChavesEstrangeirasNasTabelas < ActiveRecord::Migration
  extend MigrationHelper

  def self.up
    add_foreign_key :from_table => :dados_demograficos, :to_table => :pesquisas
    add_foreign_key :from_table => :alternativas_dados_demograficos, :to_table => :dados_demograficos
    add_foreign_key :from_table => :alternativas, :to_table => :grupos_de_questoes
    add_foreign_key :from_table => :grupos_de_questoes, :to_table => :pesquisas
    add_foreign_key :from_table => :questoes, :to_table => :grupos_de_questoes
    add_foreign_key :from_table => :respostas_dados_demograficos, :to_table => :dados_demograficos
    add_foreign_key :from_table => :respostas_dados_demograficos, :to_table => :alternativas_dados_demograficos
    add_foreign_key :from_table => :respostas_dados_demograficos, :to_table => :respostas_pesquisas
    add_foreign_key :from_table => :respostas_pesquisas, :to_table => :pesquisas
    add_foreign_key :from_table => :respostas_questoes, :to_table => :questoes
    add_foreign_key :from_table => :respostas_questoes, :to_table => :alternativas
    add_foreign_key :from_table => :respostas_questoes, :to_table => :respostas_pesquisas
  end

  def self.down
    remove_foreign_key :from_table => :dados_demograficos, :to_table => :pesquisas
    remove_foreign_key :from_table => :alternativas_dados_demograficos, :to_table => :dados_demograficos
    remove_foreign_key :from_table => :alternativas, :to_table => :grupos_de_questoes
    remove_foreign_key :from_table => :grupos_de_questoes, :to_table => :pesquisas
    remove_foreign_key :from_table => :questoes, :to_table => :grupos_de_questoes
    remove_foreign_key :from_table => :respostas_dados_demograficos, :to_table => :dados_demograficos
    remove_foreign_key :from_table => :respostas_dados_demograficos, :to_table => :alternativas_dados_demograficos
    remove_foreign_key :from_table => :respostas_dados_demograficos, :to_table => :respostas_pesquisas
    remove_foreign_key :from_table => :respostas_pesquisas, :to_table => :pesquisas
    remove_foreign_key :from_table => :respostas_questoes, :to_table => :questoes
    remove_foreign_key :from_table => :respostas_questoes, :to_table => :alternativas
    remove_foreign_key :from_table => :respostas_questoes, :to_table => :respostas_pesquisas
  end
end
