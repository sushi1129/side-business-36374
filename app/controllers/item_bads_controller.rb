class ItemBadsController < ApplicationController
  def create
    @item_bad = current_user.item_bads.create(item_id: params[:item_id])
    redirect_back(fallback_location: item_path(@item_bad.item))
  end

  def destroy
    @item_bad = ItemBad.find_by(item_id: params[:item_id], user_id: current_user.id)
    @item_bad.destroy
    redirect_back(fallback_location: item_path(@item_bad.item))
  end
end
