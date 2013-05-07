class Syndic::ExpenseTypesController < Syndic::BaseController
  
  before_filter :load_townhouse
  before_filter :load_breadcrumb

  # GET /syndic/townhouse/:townhouse_id/expense_types
  # GET /syndic/townhouse/:townhouse_id/expense_types.json
  def index
    @expense_types = @townhouse.expense_types.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @expense_types }
    end
  end

  # GET /syndic/townhouse/:townhouse_id/expense_types/1
  # GET /syndic/townhouse/:townhouse_id/expense_types/1.json
  def show
    @expense_type = @townhouse.expense_types.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @expense_type }
    end
  end

  # GET /syndic/townhouse/:townhouse_id/expense_types/new
  # GET /syndic/townhouse/:townhouse_id/expense_types/new.json
  def new
    @expense_type = @townhouse.expense_types.new
    @townhouses = current_user.townhouses

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @expense_type }
    end
  end

  # GET /syndic/townhouse/:townhouse_id/expense_types/1/edit
  def edit
    @expense_type = @townhouse.expense_types.find(params[:id])
    @townhouses = current_user.townhouses
  end

  # POST /syndic/townhouse/:townhouse_id/expense_types
  # POST /syndic/townhouse/:townhouse_id/expense_types.json
  def create
    @expense_type = @townhouse.expense_types.new(params[:expense_type])

    respond_to do |format|
      if @expense_type.save
        format.html { redirect_to syndic_townhouse_expense_type_path(@townhouse, @expense_type), notice: 'Expense type was successfully created.' }
        format.json { render json: @expense_type, status: :created, location: @expense_type }
      else
        format.html { render action: "new" }
        format.json { render json: @expense_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /syndic/townhouse/:townhouse_id/expense_types/1
  # PUT /syndic/townhouse/:townhouse_id/expense_types/1.json
  def update
    @expense_type = @townhouse.expense_types.find(params[:id])

    respond_to do |format|
      if @expense_type.update_attributes(params[:expense_type])
        format.html { redirect_to syndic_townhouse_expense_type_path(@townhouse, @expense_type), notice: 'Expense type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @expense_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /syndic/townhouse/:townhouse_id/expense_types/1
  # DELETE /syndic/townhouse/:townhouse_id/expense_types/1.json
  def destroy
    @expense_type = @townhouse.expense_types.find(params[:id])
    @expense_type.destroy

    respond_to do |format|
      format.html { redirect_to syndic_townhouse_expense_types_path(@townhouse) }
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
    add_breadcrumb :expense_types, :syndic_townhouse_expense_types_path
  end
end
