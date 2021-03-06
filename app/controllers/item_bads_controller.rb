class ItemBadsController < ApplicationController
  def create
    if @item_good = ItemGood.find_by(user_id: current_user.id, item_id: params[:item_id])
      @item_good.destroy
    end
    @item_bad = current_user.item_bads.create(item_id: params[:item_id])
    redirect_back(fallback_location: item_path(@item_bad.item))
  end

  def destroy
    @item_bad = ItemBad.find_by(item_id: params[:item_id], user_id: current_user.id)
    @item_bad.destroy
    redirect_back(fallback_location: item_path(@item_bad.item))
  end
end
