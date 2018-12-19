class ApplicationController < ActionController::Base

  include HTTParty

  base_uri 'https://swapi.co/api/films'

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def call_swapi(params)
    self.class.get(params)
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:username]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

end
