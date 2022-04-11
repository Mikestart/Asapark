class SpotsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @spots = Spot.all

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @spots.geocoded.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        info_window: render_to_string(partial: "info_window", locals: { spot: spot })
      }
    end
  end


  def show
    @spot = Spot.find(params[:id])
  end

  def matches
    @spots = Spot.near(params[:search][:address], 0.2)

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @spots.geocoded.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        info_window: render_to_string(partial: "info_window", locals: { spot: spot })
      }
    end
  end
end
