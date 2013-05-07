class Syndic::CallsController < Syndic::BaseController

  before_filter :load_townhouse
  before_filter :load_breadcrumb

  # GET /syndic/townhouse/:townhouse_id/calls
  # GET /syndic/townhouse/:townhouse_id/calls.json
  def index
    @calls = Call.joins(:tenement => :townhouse).where(townhouses: {id: @townhouse.id})

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @calls }
    end
  end

  # GET /syndic/townhouse/:townhouse_id/calls/1
  # GET /syndic/townhouse/:townhouse_id/calls/1.json
  def show
    @call = Call.joins(:tenement => :townhouse).where(townhouses: {id: @townhouse.id}).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @call }
    end
  end

  # GET /syndic/townhouse/:townhouse_id/calls/1/accept
  def accept
    @call = Call.joins(:tenement => :townhouse).where(townhouses: {id: @townhouse.id}).find(params[:id])
    @call.accept!
    redirect_to syndic_townhouse_call_path(@townhouse, @call), notice: 'Call sucessifuly accepted!'
  end

  # GET /syndic/townhouse/:townhouse_id/calls/1/accept
  def reject
    @call = Call.joins(:tenement => :townhouse).where(townhouses: {id: @townhouse.id}).find(params[:id])
    @call.reject!
    redirect_to syndic_townhouse_call_path(@townhouse, @call), notice: 'Call sucessifuly rejected!'
  end

  private
  def load_townhouse
    @townhouse = current_user.townhouses.find(params[:townhouse_id])
  end
  def load_breadcrumb
    add_breadcrumb :townhouses, :syndic_townhouses_path
    add_breadcrumb @townhouse.name, syndic_townhouse_path(params[:townhouse_id])
    add_breadcrumb :calls, :syndic_townhouse_calls_path
  end
end
