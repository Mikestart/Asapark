class LikesController < ApplicationController

  def create
    new_like = Like.new(like_params)
    new_like.user_id = curent_user
     if new_like.save!
      redirect_to spot_path(new_like.spot_id)
  end

  def destroy
    @like = curent_user.find(params[:id])
    spot = @like.spot
    @like.destroy
  end

  def update
    favorite = Like.where(spot: spot.find(params[:spot]), user: curent_user)
    if favorite == []
      #create the favorite
      Like.create(spot: Spot.find(params[:spot]), user: curent_user)
      @favorite_exists = true
    else
      #delete the favorite
      favorite.destroy_all
      @favorite_exists = false
  end
  # respond_to do |format|
  #   format.html {}
  #   format.js {}
  # end

  private

  def like_params
    params.require(:like).permit(:spot_id)
  end
end
