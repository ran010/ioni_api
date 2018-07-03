class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :update, :destroy]

  # GET /notifications
  # GET /notifications.json
  def index
    @notifications = Notification.order("created_at DESC")
    paginate json: Notification.order("created_at DESC"), per_page: 20
#     render json:@notifications, status: :ok
  end

  # GET /notifications/1
  # GET /notifications/1.json
  def show
    render json:@notification, status: :ok
  end

  # POST /notifications
  # POST /notifications.json
  def create
    @user = User.find(params[:id])
    if  @user.isAdmin == true
      @notification = Notification.new(notification_params)

      if @notification.save
        render json:@notification, status: :ok
      else
        render json: @notification.errors, status: :unprocessable_entity
      end
    else
      render json:{
        message: "Unauthorize to post"
      }
    end
  end

  # PATCH/PUT /notifications/1
  # PATCH/PUT /notifications/1.json
  def update
    @user = User.find(params[:admin_id])
    if @user.isAdmin == true && @notification.update(notification_params)
      render json:@notification, status: :ok
    else
      render json: @notification.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notifications/1
  # DELETE /notifications/1.json
  # def destroy
  #   @notification.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_params
      params.permit(:title, :description)
    end
end
