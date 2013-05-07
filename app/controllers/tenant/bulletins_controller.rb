class Tenant::BulletinsController < Tenant::BaseController

  before_filter :load_tenement
  before_filter :load_breadcrumb

  # GET /tenant/tenement/:tenement_id/bulletins
  # GET /tenant/tenement/:tenement_id/bulletins.json
  def index
    @bulletins = @tenement.townhouse.bulletins.where(workflow_state: 'published')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bulletins }
    end
  end

  # GET /tenant/tenement/:tenement_id/bulletins/1
  # GET /tenant/tenement/:tenement_id/bulletins/1.json
  def show
    @bulletin = @tenement.townhouse.bulletins.find_by_id_and_workflow_state(params[:id], 'published')
    
    add_breadcrumb @bulletin.subject, tenant_tenement_bulletin_path(@bulletin)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bulletin }
    end
  end

  def load_tenement
    @tenement = current_user.tenements.find(params[:tenement_id])
  end

  def load_breadcrumb
    add_breadcrumb :tenements, :tenant_tenements_path
    add_breadcrumb @tenement.location, tenant_tenement_path(params[:tenement_id])
    add_breadcrumb :bulletins, :tenant_tenement_bulletins_path
  end
end
