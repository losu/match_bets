class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :get_groupset_list
    def get_groupset_list
        @groupsets = Groupset.where(user_id: current_user.id)
        @Users2 = User.all
    end


  #=================DODANIE POLA DO REJESTRACJI DEVISE=============================
  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  protected

  def configure_devise_permitted_parameters
    registration_params = [:nickname, :email, :password, :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end
  #==================================================================================


    def after_sign_in_path_for(resource)
      @user = current_user
      if @user.admin?
        request.env['omniauth.origin'] || stored_location_for(resource) || matches_path
      else
        request.env['omniauth.origin'] || stored_location_for(resource) || new_match_path
      end
    end
end
