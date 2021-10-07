class ItemGoodsController < ApplicationController
  def create
    @item_good = current_user.item_goods.create(item_id: params[:itam_id])
    redirect_back(fallback_location: item_path(@item_good.item))
  end

  def destroy
    @item_good = ItemGood.find_by(item_id: params[:item_id], user_id: current_user.id)
    @item_good.destroy
    redirect_back(fallback_location: item_path(@item_good.item))
  end
end
