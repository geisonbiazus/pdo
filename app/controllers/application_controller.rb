# -*- encoding : utf-8 -*-
# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  #  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  ActiveScaffold.set_defaults do |config|
    config.dhtml_history = false
    config.ignore_columns.add [:created_at, :updated_at, :lock_version]
    config.list.per_page = 20    
  end

  before_filter :verifica_usuario_logado

  def verifica_usuario_logado
    if session[:usuario].blank? && !%w(login questionarios).include?(params[:controller])
      redirect_to :controller => 'login'
    end
  end

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
