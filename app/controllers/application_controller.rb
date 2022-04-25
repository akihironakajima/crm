class ApplicationController < ActionController::Base

  include SessionsHelper
  include Pagy::Backend
  
  private

  def require_partner_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def require_admin_logged_in
    unless current_partner.admin?
      redirect_to current_partner
    end
  end

end
