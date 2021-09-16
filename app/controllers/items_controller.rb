class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.order("created_at DESC")
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:item_name, :maker, :image, :plice, :bought_store, :item_info).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
