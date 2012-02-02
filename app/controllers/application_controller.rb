class ApplicationController < ActionController::Base
  protect_from_forgery  
  helper_method :current_human, :require_human, :logout_human
  
  private

  def current_human_session
    HumanSession.find
  end

  def current_human
    current_human_session && current_human_session.record
  end

  def require_human
    unless current_human
      redirect_to "/login"
    end
  end

  def logout_human
    current_human_session.destroy if current_human_session
  end
  
  def login_human(login, password, remember)
    unless current_human
      session = HumanSession.new(:login => login, :password => password, :remember_me => remember)
      session.save
    end
  end

end
