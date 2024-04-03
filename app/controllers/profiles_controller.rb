class ProfilesController < ApplicationController
  before_action :require_user
  before_action :authenticate_user_from_session

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path, notice:"Your profile info updated successfully."
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.require(:user).permit( 
        :email, 
        :username, 
        :fullname
      )
    end

end
