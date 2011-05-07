class ItemsController < ApplicationController
  before_filter :login_required, :except => [:show, :index, :pay]
  
  add_crumb("Items", '/items')
  def index
      @items = Item.search(params[:search]).paginate :page => params[:page]
  end
  
  def new
    add_crumb("Add New", '/items/new')
  	@item = Item.new
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
    @item = Item.find(params[:id])
    add_crumb "Edit " + @item.title, request.fullpath
  end

  def show
    @item = Item.find(params[:id])
    add_crumb @item.title, request.fullpath
    if @item.license && @item.price
      @item.price = @item.price.to_s
    end
    up = 0
    down = 0
    @item.votes.each do |v|
      if v.vote
        up += 1
      else
        down += 1
      end
    end
    @up = up
    @down = down
    @messages = @item.messages
    @message = Message.new()
    if @item.visible == false && current_user
      unless @item.user_id == current_user.id || current_user.is_admin
        redirect_to root_url, :notice => "Unfortunately you can't access this page since you're not signed in."
      end
    end
  end
  
  def destroy
    i = Item.find(params[:id])
    i.destroy
    redirect_to items_path
 end
  
  def update
     @item = Item.find(params[:id])
     if ! current_user.is_admin
       params[:item][:price] = @item.price
      end
     if @item.update_attributes(params[:item])
        redirect_to :action => 'show', :id => @item
     else
        render :action => 'edit'
     end
  end
    
   def message_create
    @user = User.find(current_user.id)
    @item = Item.find(params[:message][:item_id])
    @message = Message.new(params[:message])
    @message.user_id = @user.id
    @message.item_id = @item.id
    if @message.save
      redirect_to "/items/#{@item.id}"
     else
      render :new
    end
  end
  

  
  def my_items
    
  end
  
  def vote_up
    @user = current_user
    @item = Item.find(params[:id])
    if @user.vote_exclusively_for(@item)
      redirect_to @item
    end
  end
  def vote_down
    @user = current_user
    @item = Item.find(params[:id])
    if @user.vote_exclusively_against(@item)
      redirect_to @item
    end
  end
  
  def download
    @item = Item.find(params[:id])
    send_file "#{RAILS_ROOT}/public" + @item.download.to_s, :type=>"application/zip" 
  end

end