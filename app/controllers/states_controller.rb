class StatesController < ApplicationController

  # GET /states.json
  def index
    @states = State.all

    respond_to do |format|
      format.json { render json: @states }
    end
  end

  # GET /states/1.json
  def show
    @state = State.find(params[:id])

    respond_to do |format|
      format.json { render json: @state }
    end
  end
end
