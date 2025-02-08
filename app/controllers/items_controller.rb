class ItemsController < ApplicationController

  def index
    @items = item.order("created_at DESC")
  end

  def new
    @item = item.new
  end

  def create
    @item = item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit()
  end

end

