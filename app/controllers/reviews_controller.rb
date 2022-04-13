class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.save!
    redirect_to reviews_path
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy!

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to reviews_path
  end


  private

  def review_params
    params.require(:review).permit(:content)
  end
end
