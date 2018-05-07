class WelcomeController < ApplicationController
  def index
        @newposts = Post.order(id: :desc).limit(5)
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
