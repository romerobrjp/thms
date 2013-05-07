class Syndic::BulletinsController < Syndic::BaseController

  before_filter :load_townhouse
  before_filter :load_breadcrumb
  # GET /syndic/townhouse/:townhouse_id/bulletins
  # GET /syndic/townhouse/:townhouse_id/bulletins.json
  def index
    @bulletins = @townhouse.bulletins

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bulletins }
    end
  end

  # GET /syndic/townhouse/:townhouse_id/bulletins/1
  # GET /syndic/townhouse/:townhouse_id/bulletins/1.json
  def show
    @bulletin = @townhouse.bulletins.find(params[:id])
    add_breadcrumb @bulletin.id, syndic_townhouse_bulletin_path(@townhouse, @bulletin)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bulletin }
    end
  end

  # GET /syndic/townhouse/:townhouse_id/bulletins/new
  # GET /syndic/townhouse/:townhouse_id/bulletins/new.json
  def new
    @bulletin = @townhouse.bulletins.new
    add_breadcrumb :new, new_syndic_townhouse_bulletin_path(@townhouse)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bulletin }
    end
  end

  # GET /syndic/townhouse/:townhouse_id/bulletins/1/edit
  def edit
    @bulletin = @townhouse.bulletins.find(params[:id])
    add_breadcrumb :edit, edit_syndic_townhouse_bulletin_path(@townhouse, @bulletin)
    unless @bulletin.draft?
      redirect_to syndic_townhouse_bulletin_path(@townhouse, @bulletin), flash: { error: 'Bulletin cannot be edited.' }
    end
  end

  # POST /syndic/townhouse/:townhouse_id/bulletins
  # POST /syndic/townhouse/:townhouse_id/bulletins.json
  def create
    @bulletin = @townhouse.bulletins.new(params[:bulletin])
    @bulletin.syndic = current_user

    respond_to do |format|
      if @bulletin.save
        format.html { redirect_to syndic_townhouse_bulletin_path(@townhouse, @bulletin), notice: 'Bulletin was successfully created.' }
        format.json { render json: @bulletin, status: :created, location: @bulletin }
      else
        format.html { render action: "new" }
        format.json { render json: @bulletin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /syndic/townhouse/:townhouse_id/bulletins/1
  # PUT /syndic/townhouse/:townhouse_id/bulletins/1.json
  def update
    @bulletin = @townhouse.bulletins.find(params[:id])
    @bulletin.syndic = current_user

    unless @bulletin.draft?
      redirect_to syndic_townhouse_bulletin_path(@townhouse, @bulletin), flash: { error: 'Bulletin cannot be edited.' }
      return
    end
    
    respond_to do |format|
      if @bulletin.update_attributes(params[:bulletin])
        format.html { redirect_to syndic_townhouse_bulletin_path(@townhouse, @bulletin), notice: 'Bulletin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bulletin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /syndic/townhouse/:townhouse_id/bulletins/1
  # DELETE /syndic/townhouse/:townhouse_id/bulletins/1.json
  def destroy
    @bulletin = @townhouse.bulletins.find(params[:id])

    unless @bulletin.draft?
      redirect_to syndic_townhouse_bulletin_path(@townhouse, @bulletin), flash: { error: 'Bulletin cannot be deleted.' }
      return
    end

    @bulletin.destroy

    respond_to do |format|
      format.html { redirect_to syndic_townhouse_bulletins_path(@townhouse) }
      format.json { head :no_content }
    end
  end

  # POST /syndic/townhouse/:townhouse_id/bulletins/1/publish
  def publish
    @bulletin = @townhouse.bulletins.find(params[:id])
    @bulletin.publish!(current_user)
    redirect_to syndic_townhouse_bulletin_path(@townhouse, @bulletin), notice: 'Bulletin was successfully published.'
  end

  private
  def load_townhouse
    @townhouse = current_user.townhouses.find(params[:townhouse_id])
  end
  def load_breadcrumb
    add_breadcrumb :townhouses, :syndic_townhouses_path
    add_breadcrumb @townhouse.name, syndic_townhouse_path(params[:townhouse_id])
    add_breadcrumb :bulletins, :syndic_townhouse_bulletins_path
  end
end
