class Syndic::ExpensesController < Syndic::BaseController

  before_filter :load_townhouse
  before_filter :load_breadcrumb

  # GET /syndic/townhouse/:townhouse_id/expenses
  # GET /syndic/townhouse/:townhouse_id/expenses.json
  def index
    @expenses = @townhouse.expenses

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @expenses }
    end
  end

  # GET /syndic/townhouse/:townhouse_id/expenses/1
  # GET /syndic/townhouse/:townhouse_id/expenses/1.json
  def show
    @expense = @townhouse.expenses.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @expense }
    end
  end

  # GET /syndic/townhouse/:townhouse_id/expenses/new
  # GET /syndic/townhouse/:townhouse_id/expenses/new.json
  def new
    @expense = @townhouse.expenses.new
    @expense_types = ExpenseType.where(townhouse_id: @townhouse.id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @expense }
    end
  end

  # GET /syndic/townhouse/:townhouse_id/expenses/1/edit
  def edit
    @expense = @townhouse.expenses.find(params[:id])
    @expense_types = ExpenseType.where(townhouse_id: @townhouse.id)
  end

  # POST /syndic/townhouse/:townhouse_id/expenses
  # POST /syndic/townhouse/:townhouse_id/expenses.json
  def create
    @expense = @townhouse.expenses.new(params[:expense])

    respond_to do |format|
      if @expense.save
        format.html { redirect_to syndic_townhouse_expense_path(@townhouse, @expense), notice: 'Expense was successfully created.' }
        format.json { render json: @expense, status: :created, location: @expense }
      else
        format.html { render action: "new" }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /syndic/townhouse/:townhouse_id/expenses/1
  # PUT /syndic/townhouse/:townhouse_id/expenses/1.json
  def update
    @expense = @townhouse.expenses.find(params[:id])

    respond_to do |format|
      if @expense.update_attributes(params[:expense])
        format.html { redirect_to syndic_townhouse_expense_path(@townhouse, @expense), notice: 'Expense was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /syndic/townhouse/:townhouse_id/expenses/1
  # DELETE /syndic/townhouse/:townhouse_id/expenses/1.json
  def destroy
    @expense = @townhouse.expenses.find(params[:id])
    @expense.destroy

    respond_to do |format|
      format.html { redirect_to syndic_townhouse_expenses_path(@townhouse) }
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
    add_breadcrumb :expenses, :syndic_townhouse_expenses_path
  end
end
