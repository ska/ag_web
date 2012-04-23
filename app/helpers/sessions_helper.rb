module SessionsHelper
  
  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    self.current_user = user
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    @current_user ||= user_from_remember_token
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def sign_out
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  def current_user?(user)
    user == current_user
  end
  
  def authenticate
    deny_access unless signed_in?
  end
  
  def deny_access
    store_location
    redirect_to admin_signin_path, :notice => "Perfavore effettua il login per visualizzare la pagina"
  end

  def authenticate_admin
    deny_access_noadmin unless current_user.admin?        
  end
 
  def deny_access_noadmin    
    redirect_to current_user, :notice => "Non sei autorizzato a visitare questa area."
  end
  
  def enabled_user
    authenticate
    deny_access_noenabled unless current_user.enabled?
  end
 
  def deny_access_noenabled    
    redirect_to current_user, :notice => "Utente non abilitato. Attendi l'abilitazione da parte di un amministratore."
  end
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end
  
  private

    def user_from_remember_token
      User.authenticate_with_salt(*remember_token)
    end
    
    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end

    def store_location
      session[:return_to] = request.fullpath
    end

    def clear_return_to
      session[:return_to] = nil
    end
end