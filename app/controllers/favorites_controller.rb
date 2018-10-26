class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(word_id: params[:word_id])
      redirect_to controller: 'users', action: 'favorites', id:current_user.id , notice: "#{favorite.word.user.name}さんの投稿をお気に入り登録しました"

  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
      redirect_to controller: 'users', action: 'favorites', id:current_user.id , notice: "#{favorite.word.user.name}さんの投稿のお気に入り解除しました"
  end
end
