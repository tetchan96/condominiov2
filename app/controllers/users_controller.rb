class UsersController < ApplicationController
  include UsersHelper
  before_action :correct_user?, only: [:edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end
  def edit
    @user = User.find(params[:id]) 
  end
  
  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to @user, notice: "Usuário foi criado com sucesso!"
      else 
        render action: :new
      end
  end
  
  def update
    @user = User.find(params[:id]) 
    if @user.update_attributes(user_params)
      redirect_to users_path
    else
      render action: :edit
    end
  end
   
  def destroy
    @user = User.find(params[:id]) 
    @user.destroy
    sign_out
    redirect_to root_path
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :login, :password, :password_confirmation)
    end
    def set_user
      @user = User.find(params[:id])
    end
end
