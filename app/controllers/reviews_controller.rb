class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    # @review = Review.new
    @review = @restaurant.reviews.new(review_params)

    if @review.save
      flash[:notice] = "Review has been submitted!"
      redirect_to '/'
    else
      flash[:notice] = @review.errors.full_messages.join(" ")
      render :new
    end
  end

  protected
  def review_params
    params.require(:review).permit(:body, :rating)
  end

end
