class Admin::UsersController < AdminController
  

  def update
    @user = User.find(params[:id])

    password_confirmation_error = 0
    #prevents role changing
    params[:user].delete("role_id")
    
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
      params[:user].delete("current_password")
    elsif !@user.valid_password?(params[:current_password])
      password_confirmation_error = 1
      @user.errors.add("Old Password", "is incorrect")
    end

    if password_confirmation_error == 0 && @user.update_attributes(params[:user])
      redirect_to "/admin/profile", :notice=>"Update successful"
    elsif password_confirmation_error == 1
      redirect_to "/admin/profile", :flash => { :error => "Incorrect Old Password" }
    else
      redirect_to "/admin/profile", :flash => { :error => "Email already exists" }
    end
  end

end