class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
 
  def home
  end

  def show
    @user = User.find(params[:id])
  end
  
  def reviewindex
    @user = User.find(params[:id])
  end
  
  def watchlists
    @user = User.find(params[:id])
  end
  
  def words
    @user = User.find(params[:id])
    @words = Word.where(:user_id, @user.id)
  end
  
  def profile
   @user = User.find(params[:id])
  end
  
  def favorites
    @user = User.find(params[:id])
    @favorites_words = @user.favorite_words
  end
  
  def following
      @user  = User.find(params[:id])
      @users = @user.following
      render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end
  
end
