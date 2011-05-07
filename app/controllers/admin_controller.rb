class AdminController < ApplicationController
  before_filter :admin_required
  add_crumb("Admin")
  def index
    @items = Item.all
  end
  
  def makevisible
    @item = Item.find(params[:id])
    @item.visible = true
    @item.save!
    redirect_to admin_path
  end
  
  def unvisible
    @item = Item.find(params[:id])
    @item.visible = false
    @item.save!
    redirect_to admin_path
  end

end
