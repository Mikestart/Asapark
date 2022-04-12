class SpotsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @spots = Spot.all

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @spots.geocoded.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        info_window: render_to_string(partial: "info_window", locals: { spot: spot }),
        image_url: helpers.asset_url("icon_map.svg")
      }
    end
  end


  def show
    @spot = Spot.find(params[:id])

    @spot_map = Spot.where(id: params[:id])
    @marker = @spot_map.geocoded.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        info_window: render_to_string(partial: "info_window", locals: { spot: spot }),
        image_url: helpers.asset_url("icon_map.svg")
      }
    end
    @spot_map.each do |spot|
      @url2 = "http://maps.google.com/?cbll=#{spot.latitude},#{spot.longitude}&cbp=12,20.09,,0,5&layer=c"
    end
    @spot_map.each do |spot|
      @url = "https://www.google.com/maps/dir/le+wagon+nice/#{spot.latitude}+#{spot.longitude}"
    end
  end

  def matches

    @spots = Spot.near(params[:search][:address], 0.2)

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @spots.geocoded.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        info_window: render_to_string(partial: "info_window", locals: { spot: spot }),
        image_url: helpers.asset_url("icon_map.svg")
      }
    end
  end
end
