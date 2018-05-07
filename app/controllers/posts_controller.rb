class PostsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index, :show]
  
  def new
    @post = Post.new
  end
  
  def index
      if params[:search]
        @posts = Post.search(params[:search]).paginate(:page => params[:page]).order("created_at DESC")
      elsif params[:tag]
          @posts = Post.tagged_with(params[:tag]).paginate(:page => params[:page]).order("created_at DESC")
      else
        @posts = Post.paginate(:page => params[:page]).order("created_at DESC")
      end

  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
 
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def create
    @post = Post.new(post_params)  
    #acts_as_taggable_on workaround  
    @post.tag_list.add(params["post"]["tag_list"], parse: true)
    
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    
    redirect_to posts_path
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :text)
  end
  
end
