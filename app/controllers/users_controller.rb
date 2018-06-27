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

    def confirm_email
        user = User.find_by_confirm_token(params[:id])
        if user
          user.email_activate
          flash[:success] = "Welcome to the Sample App! Your email has been confirmed.
          Please sign in to continue."
          redirect_to signin_url
        else
          flash[:error] = "Sorry. User does not exist"
          redirect_to root_url
        end
    end
end
