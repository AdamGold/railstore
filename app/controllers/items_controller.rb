class ItemsController < ApplicationController
  def index
    
  end
  def new
    if current_user
    	@item = Item.new
    else
      redirect_to root_url
    end
  end
  
  def create
   @item = Item.new(params[:item])
   @item.user_id = current_user.id
   @item.tags.each do |tag|
     tag.item_id = @item.id
   end
      if @item.save
            redirect_to @item
      else
            render new_item_path
      end
  end


  def edit
  	if current_user 
      @item = Item.find(params[:id])
    else 
      redirect_to root_url
	end
  end

  def show
    @item = Item.find(params[:id])
  end
  
  def destroy
    i = Item.find(params[:id])
    i.destroy
    redirect_to items_path, :flash => { :success => "User destroyed." }
  end

end