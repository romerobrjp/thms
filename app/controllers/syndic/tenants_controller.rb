class Syndic::TenantsController < Syndic::BaseController
  # GET /syndic/tenants/new
  # GET /syndic/tenants/new.json
  def new
    @tenant = Tenant.new
    @tenant.address = Address.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tenant }
    end
  end

  # POST /syndic/tenants
  # POST /syndic/tenants.json
  def create
    @tenant = Tenant.new(params[:tenant])
    @tenant.password = Devise.friendly_token.first(6)

    respond_to do |format|
      if @tenant.save
        format.html { redirect_to params[:redirect_url], notice: 'Tenant was successfully created.' }
        format.json { render json: @tenant, status: :created, location: @tenant }
      else
        format.html { render action: "new" }
        format.json { render json: @tenant.errors, status: :unprocessable_entity }
      end
    end
  end
end
