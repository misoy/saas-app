class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_tenant, :private_tenant?

  def current_tenant
    Apartment::Tenant.current
  end

  def private_tenant?
    !(current_tenant == 'development' || current_tenant == 'production')
  end

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:subdomain, :email, :password])
  end
end
