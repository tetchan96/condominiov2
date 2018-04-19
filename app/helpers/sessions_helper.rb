module SessionsHelper
  def sign_in user
    session[:user_id] = user.id
  end
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  def block_access
    if current_user.present?
      redirect_to current_condominio
    end
  end
  
  def logged_in?
    !current_user.nil?
  end
  
  def sign_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  def set_current_condominio condominio
    if condominio?
      redirect_to new_condominio_path
    else
      session[:condominio_id] = condominio.id
    end
  end
  def current_condominio
    @current_condominio ||= Condominio.find_by(id: session[:condominio_id])
  end
  def destroy_current_condominio
    destroy_current_apartamento
    session.delete(:condominio_id)
    @current_condominio = nil
  end
  def set_current_apartamento apartamento
    session[:apartamento_id] = apartamento.id
  end
  def current_apartamento
    @current_apartamento ||= Apartamento.find_by(id: session[:apartamento_id])
  end
  def destroy_current_apartamento
    session.delete(:apartamentoo_id)
    @current_condominio = nil
  end
  
end
