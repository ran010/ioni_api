class ProfilesController < ApplicationController
  def edit
  end
  def update_profile
    @user= User.find(params[:id])
    if @user.update(update_profile_params)
    render json: {
      message: "Profile update successfully",
      isSuccess: true
    }
    else
    render json: {
      message: "Profile update unsuccessfully",
      isSuccess: false
    }
    end
  end

  private
  def update_profile_params
    params.permit(:semester,:address)
  end
end
