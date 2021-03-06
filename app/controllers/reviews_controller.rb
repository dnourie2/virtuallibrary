class ReviewsController < ApplicationController
	before_action :set_book

	def index
	@reviews = @book.reviews
	end

	def new
  @review = @book.reviews.new
	end

	def create
  @review = @book.reviews.new(review_params.merge(user_id: current_user.id))
  @review.user = current_user
  if @review.save
    redirect_to book_reviews_path(@book), 
      notice: "Thanks for your review!"
  else
    render :new
  end
end
  def destroy
  @review = @book.reviews.find(params[:id])
  @review.destroy
  redirect_to book_reviews_path(@book), notice: "Review successfully deleted!"
  end

private

	def review_params
	  params.require(:review).permit(:comment, :current_user)
	end
	
	def set_book
  @book = Book.find(params[:book_id])
	end

end
