# -*- encoding : utf-8 -*-
module MigrationHelper
  
  def foreign_key(from_table, to_table)
    from_column = "#{to_table}_id"
    to_table = to_table.to_s.pluralize
    constraint_name = "fk_#{from_table}_#{from_column}"
    execute %{alter table #{from_table} add constraint #{constraint_name} foreign key (#{from_column}) references #{to_table}(id)}
  end
  
  def add_foreign_key(*options)
    configuracao = {:from_table => nil, :to_table => nil, :from_column => nil, :on_delete => "restrict", :on_update => "restrict"}
    configuracao.update(options.extract_options!)
    configuracao[:from_column] = "#{configuracao[:to_table].to_s.singularize}_id" if configuracao[:from_column].blank?
    constraint_name = "fk_#{configuracao[:from_table]}_#{configuracao[:from_column]}"
    execute %{alter table #{configuracao[:from_table]} add constraint #{constraint_name} foreign key (#{configuracao[:from_column]}) references #{configuracao[:to_table]}(id)
      on delete #{configuracao[:on_delete].to_s.humanize.downcase} on update #{configuracao[:on_update].to_s.humanize.downcase}}
  end

  def remove_foreign_key(*options)
    configuracao = {:from_table => nil, :to_table => nil, :from_column => nil}
    configuracao.update(options.extract_options!)
    configuracao[:from_column] = "#{configuracao[:to_table].to_s.singularize}_id" if configuracao[:from_column].blank?
    constraint_name = "fk_#{configuracao[:from_table]}_#{configuracao[:from_column]}"
    execute %{alter table #{configuracao[:from_table]} drop constraint #{constraint_name}}
  end
  
  def adicionar_usuarios_nas_tabelas(*args)
    tabelas = args.flatten
    tabelas.each do |tabela_string|
      tabela = tabela_string.to_sym
      add_column tabela, :usuario_criacao_id, :integer
      add_column tabela, :usuario_alteracao_id, :integer
      add_foreign_key :from_table => tabela, :to_table => :usuarios, :from_column => :usuario_criacao_id
      add_foreign_key :from_table => tabela, :to_table => :usuarios, :from_column => :usuario_alteracao_id
    end
  end
  
  def remover_usuarios_das_tabelas(*args)
    tabelas = args.flatten
    tabelas.each do |t|
      tabela = t.to_sym
      remove_foreign_key :from_table => tabela, :to_table => :usuarios, :from_column => :usuario_criacao_id
      remove_foreign_key :from_table => tabela, :to_table => :usuarios, :from_column => :usuario_alteracao_id
      remove_column tabela, :usuario_criacao_id
      remove_column tabela, :usuario_alteracao_id
    end         
  end
  
  def parent(metodo)
    @metodo = metodo
    def na_tabela(tabela)
      eval("#{@metodo}_foreign_key :from_table => :#{tabela},
        :to_table => :#{tabela}, :from_column => :parent_id")
    end
    self
  end
  
end
