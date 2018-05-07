class ListingsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index, :show]
  
  def new
    @listing = Listing.new
  end
  
  def index
    if params[:tag]
      @listings = Listing.tagged_with(params[:tag]).paginate(:page => params[:page]).order("created_at DESC")
    else
    @listings = Listing.paginate(:page => params[:page]).order("created_at DESC")
  end
  end
  
  def edit
    @listing = Listing.find(params[:id])
  end
  
  def update
    @listing = Listing.find(params[:id])
    @listing.tag_list.each do | tag | 
      @listing.tag_list.remove(tag)
    end
     @listing.tag_list.add(params["listing"]["tag_list"], parse: true)
 
    if @listing.update(listing_params) 
      redirect_to @listing
    else
      render 'edit'
    end
  end
  
  def show
    @listing = Listing.find(params[:id])
  end
  
  def create
    @listing = Listing.new(listing_params) 
    #acts_as_taggable_on workaround  
    @listing.tag_list.add(params["listing"]["tag_list"], parse: true) 
  
    if @listing.save
      redirect_to @listing
    else
      render 'new'
    end
  end
  
  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    
    redirect_to listings_path
  end
  
  private
  def listing_params
    params.require(:listing).permit(:title, :description, :price)
  end
  
end
