class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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
  end

  def edit
    if @item.user_id != current_user.id || @item.order!=nil
      redirect_to root_path
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if user_signed_in? && @item.user == current_user
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :category_id, :state_id, :shipping_fee_id, :region_id, :num_id, :image, :price,
                                 :explanation).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

