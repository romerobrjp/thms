class Syndic::IncomeTypesController < Syndic::BaseController
  
  before_filter :load_townhouse
  before_filter :load_breadcrumb
  
  # GET /syndic/townhouse/:townhouse_id/income_types
  # GET /syndic/townhouse/:townhouse_id/income_types.json
  def index
    @income_types = @townhouse.income_types.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @income_types }
    end
  end

  # GET /syndic/townhouse/:townhouse_id/income_types/1
  # GET /syndic/townhouse/:townhouse_id/income_types/1.json
  def show
    @income_type = @townhouse.income_types.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @income_type }
    end
  end

  # GET /syndic/townhouse/:townhouse_id/income_types/new
  # GET /syndic/townhouse/:townhouse_id/income_types/new.json
  def new
    @income_type = @townhouse.income_types.new
    @townhouses = current_user.townhouses

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @income_type }
    end
  end

  # GET /syndic/townhouse/:townhouse_id/income_types/1/edit
  def edit
    @income_type = @townhouse.income_types.find(params[:id])
    @townhouses = current_user.townhouses
  end

  # POST /syndic/townhouse/:townhouse_id/income_types
  # POST /syndic/townhouse/:townhouse_id/income_types.json
  def create
    @income_type = @townhouse.income_types.new(params[:income_type])

    respond_to do |format|
      if @income_type.save
        format.html { redirect_to syndic_townhouse_income_type_path(@townhouse, @income_type), notice: 'Income type was successfully created.' }
        format.json { render json: @income_type, status: :created, location: @income_type }
      else
        format.html { render action: "new" }
        format.json { render json: @income_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /syndic/townhouse/:townhouse_id/income_types/1
  # PUT /syndic/townhouse/:townhouse_id/income_types/1.json
  def update
    @income_type = @townhouse.income_types.find(params[:id])

    respond_to do |format|
      if @income_type.update_attributes(params[:income_type])
        format.html { redirect_to syndic_townhouse_income_type_path(@townhouse, @income_type), notice: 'Income type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @income_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /syndic/townhouse/:townhouse_id/income_types/1
  # DELETE /syndic/townhouse/:townhouse_id/income_types/1.json
  def destroy
    @income_type = @townhouse.income_types.find(params[:id])
    @income_type.destroy

    respond_to do |format|
      format.html { redirect_to syndic_townhouse_income_types_path(@townhouse) }
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
    add_breadcrumb :income_types, :syndic_townhouse_income_types_path
  end

end
