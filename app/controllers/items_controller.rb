class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end


  private

  def item_params
    params.require(:item).permit(:product_name, :category_id, :state_id, :shipping_fee_id, :region_id, :num_id, :image, :price,
                                 :explanation).merge(user_id: current_user.id)
  end
end
