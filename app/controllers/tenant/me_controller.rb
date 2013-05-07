class Tenant::MeController < Tenant::BaseController
  add_breadcrumb :me, :tenant_me_path
  # GET /tenant/me
  def show
    @user = current_user

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /tenant/me/edit
  def edit
    add_breadcrumb :edit_me, :tenant_edit_me_path
    @user = current_user
  end

  # PUT /tenant/me
  def update
    @user = Tenant.find(current_user.id)

    # required for settings form to submit when password is left blank
    if params[:tenant][:password].blank?
      params[:tenant].delete("password")
      params[:tenant].delete("password_confirmation")
    end

    respond_to do |format|
      if @user.update_attributes(params[:tenant])
        sign_in @user, :bypass => true
        format.html { redirect_to tenant_me_path, notice: 'User was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end
end
