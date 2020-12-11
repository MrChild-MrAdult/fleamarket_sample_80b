class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_parents
  before_action :search
  
  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end

  def production?
    Rails.env.production?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_day, :user_img, :introduction])
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end
  
  def search
    @search = Product.ransack(params[:q]) 
    @search_products = @search.result(distinct: true)
  end

end

