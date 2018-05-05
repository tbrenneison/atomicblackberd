class WelcomeController < ApplicationController
  def index
        @newposts = Post.order(id: :desc).limit(5)
  end
  
  
end
