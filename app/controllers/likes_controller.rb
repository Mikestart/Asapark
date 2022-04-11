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

  private

  def like_params
    params.require(:like).permit(:spot_id)
  end
end
