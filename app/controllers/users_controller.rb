class UsersController < ApplicationController
  # skip_after_action :verify_authorized

  def show
    @user = User.find(params[:id])
    @bookings = Booking.where(user_id: @user.id).order(starts_at: :desc)
    @studios = Studio.where(user_id: @user.id)
    @already_booked = @user.bookings.all
    @message = Message.new
    # @user.bookings.all.each do |booked|
    #   @already_booked << booked
    # end
    @owner_bookings = []
    Booking.all.each do |booking|
      @owner_bookings << booking if booking.room.studio.user == current_user
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update!(user_params)
      redirect_to user_path(@user)
    else
      raise
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :photo)
  end
end
