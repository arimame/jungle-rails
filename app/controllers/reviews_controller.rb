class ReviewsController < ApplicationController
before_action :check_user

  def create
    product = Product.find(params[:product_id])
    review = product.reviews.build(review_params)
    review.user = current_user

    if review.save
      redirect_to product
    else
     redirect_to product
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to product_path(params[:product_id])
  end


  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end

  def check_user
    if !current_user
      redirect_to "/"
    end
  end
end
