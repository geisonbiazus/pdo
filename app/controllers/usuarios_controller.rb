# -*- encoding : utf-8 -*-
class UsuariosController < ApplicationController
  active_scaffold do |config|
    config.columns = [:usuario, :senha, :senha_confirmation]
    config.list.columns.exclude :senha, :senha_confirmation
    config.show.columns.exclude :senha, :senha_confirmation

    config.columns[:senha].form_ui = :password
    config.columns[:senha_confirmation].form_ui = :password
    config.columns[:senha_confirmation].label = "Confirmação"

    config.actions.exclude :update
  end
  
end
