# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  respond_to :json

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # def create
  #   user = User.find_by(email: params[:email].downcase)
  #   if user && warden.authenticate!(:scope => :user)
  #     render_resource(resource)
  #   else
  #     validation_error(resource)
  #   end
  # end

  def create
    @user =  User.find_for_authentication(email:login_params.required(:email))
     if @user.present? && @user.valid_password?(login_params.require(:password))
       respond_to json: :show, status: :created
     else
       render json: {
         message: "Login unsuccessfully",
         status: "Unauthorized",
         isSucess: false
       }
     end
  end

  # def create
  #   resource = warden.authenticate!(:scope => resource_name, :recall => :failure)
  #   return sign_in_and_redirect(resource_name, resource)
  # end
  #
  # def sign_in_and_redirect(resource_or_scope, resource=nil)
  #   scope = Devise::Mapping.find_scope!(resource_or_scope)
  #   resource ||= resource_or_scope
  #   sign_in(scope, resource) unless warden.user(scope) == resource
  #   return render :json => {:success => true ,:email=> resource.email ,:jwt=>resource.jti}
  # end
  #
  # def failure
  #   return render:json => {:success => false, :errors => ["Login failed."]}
  # end
  private

    def login_params
      params.permit(:email, :password)
    end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
