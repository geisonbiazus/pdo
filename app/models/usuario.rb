class Usuario < ActiveRecord::Base
  validates_presence_of :usuario, :senha
  validates_uniqueness_of :usuario
  validates_confirmation_of :senha

  def to_label
    usuario
  end

  def self.logar(usuario, senha)
    Usuario.find_by_usuario_and_senha(usuario, senha)
  end
end
