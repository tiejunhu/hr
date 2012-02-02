class HomeController < ApplicationController
  before_filter :require_human, :except => :login

  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  def logout
    logout_human
  end
  
  def login
    if params[:login]
      login_human(params[:login], params[:password], params[:remember])
      redirect_to :action => :index
    end
  end
end
