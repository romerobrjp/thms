class Tenant::HomeController < Tenant::BaseController
  add_breadcrumb :index, :root_path
  def index
    redirect_to tenant_tenements_path
  end
end
