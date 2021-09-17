class ItemCommentsController < ApplicationController
  def create
    @item_comment = ItemComment.new(item_comment_params)
    if @item_comment.save
      redirect_to item_path(@item_comment.item)
    else
      @item = @item_comment.item
      @item_comments = @item.item_comments
      render "item/show"
    end
  end

  private

  def item_comment_params
    params.require(:item_comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
