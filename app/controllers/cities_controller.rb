class CitiesController < ApplicationController

  # GET /cities.json
  def index
    if params[:state_id].present?
      @cities = City.where(state_id: params[:state_id])
    else
      @cities = City.all
    end
    respond_to do |format|
      format.json { render json: @cities }
    end
  end

  # GET /cities/1.json
  def show
    @city = City.find(params[:id])
    respond_to do |format|
      format.json { render json: @city }
    end
  end
end
