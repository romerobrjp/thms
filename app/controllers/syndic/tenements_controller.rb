class Syndic::TenementsController < Syndic::BaseController

  before_filter :load_townhouse
  before_filter :load_breadcrumb

  # GET /syndic/townhouse/:townhouse_id/tenements
  # GET /syndic/townhouse/:townhouse_id/tenements.json
  def index
    @tenements = @townhouse.tenements

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tenements }
    end
  end

  # GET /syndic/townhouse/:townhouse_id/tenements/1
  # GET /syndic/townhouse/:townhouse_id/tenements/1.json
  def show
    @tenement = @townhouse.tenements.find(params[:id])
    add_breadcrumb @tenement.location, syndic_townhouse_tenement_path(@townhouse, @tenement)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tenement }
    end
  end

  # GET /syndic/townhouse/:townhouse_id/tenements/new
  # GET /syndic/townhouse/:townhouse_id/tenements/new.json
  def new
    @tenement = @townhouse.tenements.new
    add_breadcrumb :new, new_syndic_townhouse_tenement_path(@townhouse)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tenement }
    end
  end

  # GET /syndic/townhouse/:townhouse_id/tenements/1/edit
  def edit
    @tenement = @townhouse.tenements.find(params[:id])
    add_breadcrumb :edit, edit_syndic_townhouse_tenement_path(@townhouse, @tenement)
  end

  # POST /syndic/townhouse/:townhouse_id/tenements
  # POST /syndic/townhouse/:townhouse_id/tenements.json
  def create
    @tenement = @townhouse.tenements.new(params[:tenement])

    respond_to do |format|
      if @tenement.save
        format.html { redirect_to syndic_townhouse_tenement_path(@townhouse, @tenement), notice: 'Tenement was successfully created.' }
        format.json { render json: @tenement, status: :created, location: @tenement }
      else
        format.html { render action: "new" }
        format.json { render json: @tenement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /syndic/townhouse/:townhouse_id/tenements/1
  # PUT /syndic/townhouse/:townhouse_id/tenements/1.json
  def update
    @tenement = @townhouse.tenements.find(params[:id])

    respond_to do |format|
      if @tenement.update_attributes(params[:tenement])
        format.html { redirect_to syndic_townhouse_tenement_path(@townhouse, @tenement), notice: 'Tenement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tenement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /syndic/townhouse/:townhouse_id/tenements/1
  # DELETE /syndic/townhouse/:townhouse_id/tenements/1.json
  def destroy
    @tenement = @townhouse.tenements.find(params[:id])
    @tenement.destroy

    respond_to do |format|
      format.html { redirect_to syndic_townhouse_tenements_path(@townhouse) }
      format.json { head :no_content }
    end
  end


  private
  def load_townhouse
    @townhouse = current_user.townhouses.find(params[:townhouse_id])
  end
  def load_breadcrumb
    add_breadcrumb :townhouses, :syndic_townhouses_path
    add_breadcrumb @townhouse.name, syndic_townhouse_path(params[:townhouse_id])
    add_breadcrumb :tenements, :syndic_townhouse_tenements_path
  end

end
