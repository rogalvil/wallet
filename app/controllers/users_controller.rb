class UsersController < ApplicationController
  before_action :validate_email_update, only: :update

  def create
    user = User.new(user_params)
    if user.save
      render json: { status: 'Registro correcto' }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end  

  def signin
    user = User.find_by(email: params[:email].to_s.downcase)
    if user && user.authenticate(params[:password])
      
      auth_token = Auth.encode({user_id: user.id})
      render json: { auth_token: auth_token }, status: :ok
      
    else
      render json: { error: 'Usuario o contraseña invalidos' }, status: :unauthorized
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name)
    end

   
end