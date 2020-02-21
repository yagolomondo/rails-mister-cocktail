class ReviewsController < ApplicationController
  def create
    @review = Review.new(params_reviews)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review.cocktail = @cocktail
    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def params_reviews
    params.require(:review).permit(:content, :rating)
  end
end
