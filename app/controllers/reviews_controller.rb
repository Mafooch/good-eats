class ReviewsController < ApplicationController
  def new
    @restaurant = find_restaurant
    @review = Review.new
    @ratings = [1, 2, 3, 4, 5]
  end

  def create
    @restaurant = find_restaurant
    @review = @restaurant.reviews.new(review_params)

    if @review.save
      flash[:notice] = "Review has been submitted!"
      redirect_to '/'
    else
      flash[:notice] = @review.errors.full_messages.join(" ")
      render :new
    end
  end

  def find_restaurant
    Restaurant.find(params[:restaurant_id])
  end

  protected
  def review_params
    params.require(:review).permit(:body, :rating)
  end

end
