class Tenant::CallsController < Tenant::BaseController

  before_filter :load_tenement
  before_filter :load_breadcrumb

  # GET /tenant/tenement/:tenement_id/calls
  # GET /tenant/tenement/:tenement_id/calls.json
  def index
    @calls = Call.where("tenement_id = :t_id OR (public = :pub AND draft = :draft)", {t_id: @tenement.id, pub: true, draft: false})
  
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @calls }
    end
  end

  # GET /tenant/tenement/:tenement_id/calls/1
  # GET /tenant/tenement/:tenement_id/calls/1.json
  def show
    @call = Call.where("(tenement_id = :t_id) OR (public = :pub AND draft = :draft)", {t_id: @tenement.id, pub: true, draft: false}).find(params[:id])

    add_breadcrumb @call.id, tenant_tenement_call_path(@tenement, @call)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @call }
    end
  end

  # GET /tenant/tenement/:tenement_id/calls/new
  # GET /tenant/tenement/:tenement_id/calls/new.json
  def new
    @call = @tenement.calls.build

    add_breadcrumb :new, new_tenant_tenement_call_path(@tenement)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @call }
    end
  end

  # GET /tenant/tenement/:tenement_id/calls/1/edit
  def edit
    @call = @tenement.calls.find(params[:id])

    add_breadcrumb :edit, edit_tenant_tenement_call_path(@tenement)
    if !@call.draft
      redirect_to tenant_tenement_call_path(@tenement, @call), flash: { error: "You can't edit a published call..." }
    end
  end

  # POST /tenant/tenement/:tenement_id/calls
  # POST /tenant/tenement/:tenement_id/calls.json
  def create
    @call = @tenement.calls.build(params[:call])

    respond_to do |format|
      if @call.save
        format.html { redirect_to tenant_tenement_call_path(@tenement, @call), notice: 'Call was successfully created.' }
        format.json { render json: @call, status: :created, location: @call }
      else
        format.html { render action: "new" }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tenant/tenement/:tenement_id/calls/1
  # PUT /tenant/tenement/:tenement_id/calls/1.json
  def update
    @call = @tenement.calls.find(params[:id])
    if !@call.draft
      redirect_to tenant_tenement_call_path(@tenement, @call), flash: { error: "You can't edit a published call..." }
      return
    end

    respond_to do |format|
      if @call.update_attributes(params[:call])
        format.html { redirect_to tenant_tenement_call_path(@tenement, @call), notice: 'Call was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tenant/tenement/:tenement_id/calls/1
  # DELETE /tenant/tenement/:tenement_id/calls/1.json
  def destroy
    @call = @tenement.calls.find(params[:id])
    if !@call.draft
      redirect_to tenant_tenement_call_path(@tenement, @call), flash: { error: "You can't edit a published call..." }
      return
    end

    @call.destroy

    respond_to do |format|
      format.html { redirect_to tenant_tenement_calls_path(@tenement) }
      format.json { head :no_content }
    end
  end
  # POST /tenant/tenement/:tenement_id/calls/1/publish
  # POST /tenant/tenement/:tenement_id/calls/1/publish.json
  def publish
    @call = @tenement.calls.find(params[:id])
    unless @call.draft?
      redirect_to tenant_tenement_call_path(@tenement, @call), flash: { error: "You can't edit a published call..." }
      return
    end
    @call.publish!
    redirect_to tenant_tenement_call_path(@tenement, @call), notice: 'This call was published successfully!'
  end

  private 

  def load_tenement
    @tenement = current_user.tenements.find(params[:tenement_id])
  end

  def load_breadcrumb
    add_breadcrumb :tenements, :tenant_tenements_path
    add_breadcrumb @tenement.location, tenant_tenement_path(params[:tenement_id])
    add_breadcrumb :calls, :tenant_tenement_calls_path
  end


end
