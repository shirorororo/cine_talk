class WatchListsController < ApplicationController
  before_action :set_watch_list, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update,:destroy]


  def new
    if params[:back]
      @watch_list = WatchList.new(watch_list_params)
    else
      @watch_list = WatchList.new
    end
  end

  def create
    @watch_list = WatchList.new(watch_list_params)
    @watch_list.user_id = current_user.id
    if @watch_list.save
      redirect_to controller: 'users', action: 'watchlists', id:current_user.id , notice:"投稿しました！"
    else
      render 'new'
    end
  end
  
  
  def edit
  end
  
  def update
    if @watch_list.update(watch_list_params)
      redirect_to controller: 'users', action: 'watchlists', id:current_user.id , notice:"編集しました！"
    else
      render 'edit'
    end
  end
  
  def destroy
    @watch_list.destroy
    redirect_to controller: 'users', action: 'watchlists', id:current_user.id , notice:"削除しました！"
  end
  
  private
  
  def watch_list_params
    params.require(:watch_list).permit(:watch_list, :user_id)
  end
  
  def set_watch_list
    @watch_list = WatchList.find(params[:id])
  end
  
  def correct_user
    watch_list = WatchList.find(params[:id])
    if current_user.id != watch_list.user.id
      redirect_to root_path
    end
  end
end

