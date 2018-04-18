class SessionsController < ApplicationController
  before_action :block_access, except: [:destroy]

  def create  
    @user = User.find_by(login: params[:session][:login].downcase)
    if @user && @user.authenticate(params[:session][:password])
      sign_in(@user)
      @condominio = Condominio.all[0]
      set_current_condominio(@condominio)
      #redirect_to @user
      redirect_to @condominio
    else
      render 'new'
    end
  end
  
  def destroy
    sign_out
    redirect_to root_url
  end
end
