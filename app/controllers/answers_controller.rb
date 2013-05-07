class AnswersController < ApplicationController
  
  before_filter :authenticate_user!

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new(params[:answer])
    @answer.user = current_user

    respond_to do |format|
      if @answer.save
        format.html { redirect_to params[:redirect_url], notice: 'Answer was successfully created.' }
        format.json { render json: @answer, status: :created, location: @answer }
      else
        format.html { redirect_to params[:redirect_url], flash: { error: 'Answer was not successfully created.' } }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to answers_url }
      format.json { head :no_content }
    end
  end
end
