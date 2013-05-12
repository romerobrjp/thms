class HomeController < ApplicationController
  def index
    if user_signed_in?
      if current_user.type == Tenant.name
        redirect_to tenant_home_path
      elsif current_user.type == Syndic.name
        redirect_to syndic_home_path
      end
    else
      redirect_to new_user_session_path
    end
  end

  def about
  end
end
