class Syndic::TownhousesController < Syndic::BaseController
  add_breadcrumb :townhouses, :syndic_townhouses_path
  # GET /syndic/townhouses
  # GET /syndic/townhouses.json
  def index
    @townhouses = current_user.townhouses

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @townhouses }
    end
  end

  # GET /syndic/townhouses/1
  # GET /syndic/townhouses/1.json
  def show
    @townhouse = current_user.townhouses.find(params[:id])
    add_breadcrumb @townhouse.name, syndic_townhouse_path(@townhouse)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @townhouse }
    end
  end

  # GET /syndic/townhouses/1/edit
  def edit
    @townhouse = current_user.townhouses.find(params[:id])
    add_breadcrumb :edit, edit_syndic_townhouse_path(@townhouse)
  end

  # PUT /syndic/townhouses/1
  # PUT /syndic/townhouses/1.json
  def update
    @townhouse = current_user.townhouses.find(params[:id])

    respond_to do |format|
      if @townhouse.update_attributes(params[:townhouse])
        format.html { redirect_to syndic_townhouse_path(@townhouse), notice: 'Townhouse was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @townhouse.errors, status: :unprocessable_entity }
      end
    end
  end

end
