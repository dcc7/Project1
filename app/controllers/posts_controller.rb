class PostsController < ApplicationController

  before_action :authenticate_account!, except: [ :index, :show ]
  before_action :set_post, only: [:show]
  before_action :auth_subscriber, only: [:new]

  def edit
    @post = Post.find params[:id]
    @community = Community.find params[:community_id]
  end

  def update
    post = Post.find params[:id]
    post.update post_values
    redirect_to community_post_path(post.id)
  end

  def destroy
    post = Post.find params[:id]
    post.destroy
    redirect_to public_index_path
  end


  def index
    @communities = Post.all
    @posts = Post.search(params[:search])
  end

  def show
    @post = Post.find params[:id]
    # @commented = Comment.find params[:id]
    @comment = Comment.new
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
    @posts = Post.includes(:comments).find params[:id]
  end

  def post_values
    params.require(:post).permit(:title, :body)
  end

  def auth_subscriber
    unless Subscription.where(community_id: params[:community_id], account_id: current_account.id).any?
      redirect_to root_path, flash: { danger: "You are not permitted to view this page."}
    end
  end

end
