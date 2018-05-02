# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :set_greeting, only: [:new]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super #Jala todas las clases de devise
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
    # super
    new_params = params.require(:user).permit(:email, :phone, :show_phone, :show_email, :bio, :current_password, :password, :password_confirmation)
    change_password = true
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
      new_params = params.require(:user).permit(:email, :phone, :show_phone, :show_email, :bio)
      change_password = false
    end

    @user = User.find(current_user.id)
    is_valid = false

    if change_password
      is_valid = @user.update_with_password(new_params)
    else
      is_valid = @user.update_without_password(new_params)
    end

    if is_valid
      # set_flash_message :notice, :updated
      # sign_in @user, :bypass => true
      # redirect_to after_update_path_for(@user)
      redirect_to root_path, notice: 'Tu cuenta se ha actualizado'
    else
      render "edit"
    end
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :phone]) #Permite los campos name y phone
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:email, :phone, :show_phone, :show_email, :bio])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
  #   super(resource)
    edit_user_registration_path(resource)
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
