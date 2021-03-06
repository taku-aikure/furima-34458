class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new()
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  
  def item_params
    params.permit(:name, :description, :category_id, :status_id, :cost_id, :area_id, :days_id, :price ).merge(user_id: current_user.id)
  end

end
