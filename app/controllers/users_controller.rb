class UsersController < ApplicationController


 def edit
   @user = User.find(parmas[:id])
 end

 def update_password
   @user= User.find(params[:id])
   if @user&.valid_password?(params[:current_password])

     @user.update(:password => params[:password])
     render json: {
       message: "Password update successfully",
       isSuccess: true
     }
     else
     render json: {
       message: "Password update unsuccessfully",
       isSuccess: false
     }
     end
    end
end
