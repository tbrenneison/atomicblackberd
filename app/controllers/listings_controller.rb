class ListingsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index, :show]
  
  def new
    @listing = Listing.new
  end
  
  def index
    @listings = Listing.all
  end
  
  def edit
    @listing = Listing.find(params[:id])
  end
  
  def update
    @listing = Listing.find(params[:id])
 
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
