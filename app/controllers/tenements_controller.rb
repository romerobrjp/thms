class TenementsController < ApplicationController
  # GET /tenements
  # GET /tenements.json
  def index
    @tenements = Tenement.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tenements }
    end
  end

  # GET /tenements/1
  # GET /tenements/1.json
  def show
    @tenement = Tenement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tenement }
    end
  end

  # GET /tenements/new
  # GET /tenements/new.json
  def new
    @tenement = Tenement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tenement }
    end
  end

  # GET /tenements/1/edit
  def edit
    @tenement = Tenement.find(params[:id])
  end

  # POST /tenements
  # POST /tenements.json
  def create
    @tenement = Tenement.new(params[:tenement])

    respond_to do |format|
      if @tenement.save
        format.html { redirect_to @tenement, notice: 'Tenement was successfully created.' }
        format.json { render json: @tenement, status: :created, location: @tenement }
      else
        format.html { render action: "new" }
        format.json { render json: @tenement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tenements/1
  # PUT /tenements/1.json
  def update
    @tenement = Tenement.find(params[:id])

    respond_to do |format|
      if @tenement.update_attributes(params[:tenement])
        format.html { redirect_to @tenement, notice: 'Tenement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tenement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tenements/1
  # DELETE /tenements/1.json
  def destroy
    @tenement = Tenement.find(params[:id])
    @tenement.destroy

    respond_to do |format|
      format.html { redirect_to tenements_url }
      format.json { head :no_content }
    end
  end
end
