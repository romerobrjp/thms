class Syndic::HomeController < Syndic::BaseController
  add_breadcrumb :index, :root_path
  def index
    redirect_to syndic_townhouses_path
  end
end
