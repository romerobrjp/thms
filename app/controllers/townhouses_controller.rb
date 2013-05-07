class TownhousesController < ApplicationController
  # GET /townhouses
  # GET /townhouses.json
  def index
    @townhouses = Townhouse.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @townhouses }
    end
  end

  # GET /townhouses/1
  # GET /townhouses/1.json
  def show
    @townhouse = Townhouse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @townhouse }
    end
  end

  # GET /townhouses/new
  # GET /townhouses/new.json
  def new
    @townhouse = Townhouse.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @townhouse }
    end
  end

  # GET /townhouses/1/edit
  def edit
    @townhouse = Townhouse.find(params[:id])
  end

  # POST /townhouses
  # POST /townhouses.json
  def create
    @townhouse = Townhouse.new(params[:townhouse])

    respond_to do |format|
      if @townhouse.save
        format.html { redirect_to @townhouse, notice: 'Townhouse was successfully created.' }
        format.json { render json: @townhouse, status: :created, location: @townhouse }
      else
        format.html { render action: "new" }
        format.json { render json: @townhouse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /townhouses/1
  # PUT /townhouses/1.json
  def update
    @townhouse = Townhouse.find(params[:id])

    respond_to do |format|
      if @townhouse.update_attributes(params[:townhouse])
        format.html { redirect_to @townhouse, notice: 'Townhouse was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @townhouse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /townhouses/1
  # DELETE /townhouses/1.json
  def destroy
    @townhouse = Townhouse.find(params[:id])
    @townhouse.destroy

    respond_to do |format|
      format.html { redirect_to townhouses_url }
      format.json { head :no_content }
    end
  end
end
