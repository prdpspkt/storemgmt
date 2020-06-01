class NotificationsController < ApplicationController
  before_action :set_notification, only: [ :destroy]
  :authenticate_user!

  # GET /notifications
  # GET /notifications.json
  def index
    @notifications = Notification.all
  end

  

  # GET /notifications/new
  def new
    users = User.where.not(is_admin: true)
    @notification = Notification.new
    @users = {"सबैलाई" => 0}
    users.each do |user|
      @users["#{user.office.office} #{user.office.address}"] = user.id
    end

  end


  # POST /notifications
  # POST /notifications.json
  def create
    @notification = Notification.new(notification_params)

    respond_to do |format|
      if @notification.save
        format.html { redirect_to notifications_path, notice: 'Notification was successfully created.' }
        format.json { render :show, status: :created, location: @notification }
      else
        format.html { render :new }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end


  

  # DELETE /notifications/1
  # DELETE /notifications/1.json
  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to notifications_url, notice: 'Notification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def notification_params
      params.require(:notification).permit(:text, :created_for, :end_date, :expired)
    end
end
