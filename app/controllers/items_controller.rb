class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end
end

private

def items_params
  params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
