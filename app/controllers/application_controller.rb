class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :store_user_location!, if: :storable_location?

  def default_url_options
    { locale: I18n.locale }
  end

  def after_sign_in_path_for(resource)
    sign_in_url = new_user_session_url
      if request.referer == sign_in_url
        super
      else
        stored_location_for(resource) || request.referer || root_url
      end
  end

  def after_sign_out_path_for(resource)
    stored_location_for(resource) || super
  end

  protected :after_sign_in_path_for

  private

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
  end

  def store_user_location!
    store_location_for(:user, request.fullpath)
  end
end
