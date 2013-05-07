class Tenant::TenementsController < Tenant::BaseController
  add_breadcrumb :tenements, :tenant_tenements_path
  # GET /tenant/tenements
  # GET /tenant/tenements.json
  def index
    @tenements = current_user.tenements

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tenements }
    end
  end

  # GET /tenant/tenements/1
  # GET /tenant/tenements/1.json
  def show
    @tenement = current_user.tenements.find(params[:id])

    add_breadcrumb @tenement.location, tenant_tenement_path(@tenement)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tenement }
    end
  end
end
