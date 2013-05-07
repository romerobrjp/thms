class Syndic::MeController < Syndic::BaseController
  add_breadcrumb :me, :syndic_me_path
  # GET /syndic/me
  def show
    @user = current_user

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /syndic/me/edit
  def edit
    add_breadcrumb :edit_me, :syndic_edit_me_path
    @user = current_user
  end

  # PUT /syndic/me
  def update
    @user = Syndic.find(current_user.id)

    # required for settings form to submit when password is left blank
    if params[:syndic][:password].blank?
      params[:syndic].delete("password")
      params[:syndic].delete("password_confirmation")
    end

    respond_to do |format|
      if @user.update_attributes(params[:syndic])
        sign_in @user, :bypass => true
        format.html { redirect_to syndic_me_path, notice: 'User was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end
end
