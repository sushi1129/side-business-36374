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

  def destroy
    @item = Item.find(params[:item_id])
    @item_comment = ItemComment.find(params[:id])
    @item_comment.destroy
    redirect_to item_path(@item_comment.item)
  end

  private

  def item_comment_params
    params.require(:item_comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
