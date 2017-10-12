class ProfilesController < ApplicationController
  
  # When user makes GET to /users/user_idprofile/new
  def new
    # Render blank profile details form
    @profile = Profile.new
  end
  
  # Make POST request to /users/:user_id/profile
  def create
    # Ensure that we have the user that is filling out form
    @user = User.find( params[:user_id] )  
    # Create profile linked to this specific user
    @profile = @user.build_profile( profile_params )
    if @profile.save
      flash[:success] = "Profile updated"
      redirect_to root_path
    else
      render action: :new
    end
  end
  
  private
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
    end
  
end