class CommentsController < ApplicationController
  def create
    @word = Word.find(params[:word_id])
    @comment = @word.comments.build(comment_params)
    @comment.user_id = current_user.id
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to word_path(@word), notice: '投稿できませんでした...' }
      end
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      render :index
    end
  end


  private
  # ストロングパラメーター
  def comment_params
    params.require(:comment).permit %i(word_id user_id content)
  end
end
