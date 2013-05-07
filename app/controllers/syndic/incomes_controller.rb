class Syndic::IncomesController < Syndic::BaseController

  before_filter :load_townhouse
  before_filter :load_breadcrumb

  # GET /syndic/townhouse/:townhouse_id/incomes
  # GET /syndic/townhouse/:townhouse_id/incomes.json
  def index
    @incomes = @townhouse.incomes

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @incomes }
    end
  end

  # GET /syndic/townhouse/:townhouse_id/incomes/1
  # GET /syndic/townhouse/:townhouse_id/incomes/1.json
  def show
    @income = @townhouse.incomes.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @income }
    end
  end

  # GET /syndic/townhouse/:townhouse_id/incomes/new
  # GET /syndic/townhouse/:townhouse_id/incomes/new.json
  def new
    @income = @townhouse.incomes.new
    @income_types = IncomeType.where(townhouse_id: @townhouse.id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @income }
    end
  end

  # GET /syndic/townhouse/:townhouse_id/incomes/1/edit
  def edit
    @income = @townhouse.incomes.find(params[:id])
    @income_types = IncomeType.where(townhouse_id: @townhouse.id)
  end

  # POST /syndic/townhouse/:townhouse_id/incomes
  # POST /syndic/townhouse/:townhouse_id/incomes.json
  def create
    @income = @townhouse.incomes.new(params[:income])

    respond_to do |format|
      if @income.save
        format.html { redirect_to syndic_townhouse_income_path(@townhouse, @income), notice: 'Expense was successfully created.' }
        format.json { render json: @income, status: :created, location: @income }
      else
        format.html { render action: "new" }
        format.json { render json: @income.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /syndic/townhouse/:townhouse_id/incomes/1
  # PUT /syndic/townhouse/:townhouse_id/incomes/1.json
  def update
    @income = @townhouse.incomes.find(params[:id])

    respond_to do |format|
      if @income.update_attributes(params[:income])
        format.html { redirect_to syndic_townhouse_income_path(@townhouse, @income), notice: 'Income was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @income.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /syndic/townhouse/:townhouse_id/incomes/1
  # DELETE /syndic/townhouse/:townhouse_id/incomes/1.json
  def destroy
    @income = @townhouse.incomes.find(params[:id])
    @income.destroy

    respond_to do |format|
      format.html { redirect_to syndic_townhouse_incomes_path(@townhouse) }
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
    add_breadcrumb :incomes, :syndic_townhouse_incomes_path
  end
end
