class ReviewsController < ApplicationController
  before_action :set_review, only: %i(show edit update destroy)
  before_action :authenticate_user!, only: %i(new confirm edit update destroy)
  before_action :correct_user, only: %i(edit update destroy)

  def index
    @reviews = Review.all
  end

  def new
    if params[:back]
      @review = Review.new(review_params)
    else
      @review = Review.new
    end
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to controller: 'users', action: 'reviewindex', id:current_user.id , notice:"投稿しました！"
    else
      render 'new'
    end
  end
  
  
  def confirm
    @review = current_user.reviews.build(review_params)
    render :new if @review.invalid?
  end
  
  def show
    @review = Review.find_by(id: params[:id])
    @user = User.find_by(id: @review.user_id)
  end
  
  def edit
    
  end
  
  def update
    if @review.update(review_params)
      redirect_to controller: 'users', action: 'reviewindex', id:current_user.id , notice:"編集しました！"
    else
      render 'edit'
    end
  end
  
  def destroy
    @review.destroy
    redirect_to controller: 'users', action: 'reviewindex', id:current_user.id , notice:"削除しました！"
  end
  
  private
  
  def review_params
    params.require(:review).permit %i(title review user_id review_image review_image_cache)
  end
  
  def set_review
    @review = Review.find(params[:id])
  end
  
  def correct_user
     review = Review.find(params[:id])
     if current_user.id != review.user.id
       redirect_to root_path
     end
  end
end
