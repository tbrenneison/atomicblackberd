class WelcomeController < ApplicationController
  def index
        @newposts = Post.order(id: :desc).limit(5)
        @newlistings = Listing.order(id: :desc).limit(3)
  end
  
  def logmein
    render 'logmein'
  end
  
  def about
    render 'about'
  end 
  
  def contact
    render 'contact'
  end
  
end
