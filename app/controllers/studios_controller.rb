class StudiosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @studios =
      if params[:location]
        Studio.near([params[:location][:latitude], params[:location][:longitude]], params[:location][:radius])
      else
        Studio.all
      end

    @current_position =
      if params[:location]
        @latitude = params[:location][:latitude]
        @longitude = params[:location][:longitude]
        @radius = params[:location][:radius] || 5
        {
          lng: @longitude,
          lat: @latitude,
          current_position: true
        }
      end

      @markers = @studios.geocoded.map do |studio|
        {
          lat: studio.latitude,
          lng: studio.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { studio: studio }),
        }
      end

    @markers << @current_position if @current_position
    # binding.pry
  end

  def show
    @studio = Studio.find(params[:id])
    @reviews = Review.all
  end

  def new
    @studio = Studio.new
    authorize @studio
  end

  def create
    @studio = Studio.new(studio_params)
    authorize @studio
    @studio.user = current_user
    if @studio.save
      redirect_to studio_path(@studio)
    else
      render :new
    end
  end

  def edit
    @studio = Studio.find(params[:id])
    authorize @studio
  end

  def update
    @studio = Studio.find(params[:id])
    authorize @studio
    @studio.update(studio_params)
    redirect_to studio_path(@studio)
  end

  def destroy
    @studio = Studio.find(params[:id])
    authorize @studio
    @studio.destroy
    redirect_to studios_path
  end

  private

  def studio_params
    params.require(:studio).permit(:name, :address, :description)
  end
end
