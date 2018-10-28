class WordsController < ApplicationController
  before_action :set_word, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update,:destroy]

  def index
    @words = Word.all
    @search = Word.ransack(params[:q]) #追加
    @result = @search.result           #追加
  end

  def new
    if params[:back]
      @word = Word.new(word_params)
    else
      @word = Word.new
    end
  end

  def create
    @word = current_user.words.build(word_params)
    if @word.save
      redirect_to controller: 'users', action: 'show', id:current_user.id , notice:"投稿しました！"
    else
      render 'new'
    end
  end
  
  def show
    @word = Word.find_by(id: params[:id])
    @user = User.find_by(id: @word.user_id)
    @favorite = current_user.favorites.find_by(word_id: @word.id)
    @comment = Comment.new
    @comments = @word.comments
  end
  
  def edit
    
  end
  
  def update
    if @word.update(word_params)
      redirect_to controller: 'users', action: 'show', id:current_user.id ,notice: "編集しました！"
    else
      render 'edit'
    end
  end
  
  def destroy
    @word.destroy
    redirect_to controller: 'users', action: 'show', id:current_user.id ,notice:"削除しました！"
  end
  
  private
  
  def word_params
    params.require(:word).permit(:word, :user_id)
  end
  
  def set_word
    @word = Word.find(params[:id])
  end
  
  def correct_user
    word = Word.find(params[:id])
    if current_user.id != word.user.id
      redirect_to root_path
    end
  end
end
