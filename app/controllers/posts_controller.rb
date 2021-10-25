class PostsController < ApplicationController

  before_action :authenticate_account!, except: [ :index, :show ]
  before_action :set_post, only: [:show]

  def index
    @communities = Post.all
  end

  def show
    @post = Post.find params[:id]
  end

  def create
    @posts = Post.new post_values
    @posts.account_id = current_account.id
    @posts.community_id = params[:community_id]

    if @posts.save
      redirect_to community_path(@posts.community.id)
    else
      @community = Community.find params[:community_id]
      render :new
    end
  end

  def new
    @post = Post.new
    @community = Community.find params[:community_id]
  end

  private

  def set_post
    @posts = Post.find params[:id]
  end

  def post_values
    params.require(:post).permit(:title, :body)
  end

end
