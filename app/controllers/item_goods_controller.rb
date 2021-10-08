class ItemGoodsController < ApplicationController
  def create
    if @item_bad = ItemBad.find_by(user_id: current_user.id, item_id: params[:item_id])
      @item_bad.destroy
    end
    @item_good = current_user.item_goods.create(item_id: params[:item_id])
    redirect_back(fallback_location: item_path(@item_good.item))
  end

  def destroy
    @item_good = ItemGood.find_by(item_id: params[:item_id], user_id: current_user.id)
    @item_good.destroy
    redirect_back(fallback_location: item_path(@item_good.item))
  end
end
