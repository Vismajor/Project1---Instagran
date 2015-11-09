class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params) do |post|
      post.user = current_user
    end
    if @post.save
      redirect_to root_path
    else
      redirect_to root_path, notice: @post.errors.full_messages.first
    end
  end

  def update
    respond_to do |format|
      if @post.update
      end
  end


    private
      def set_post
        @post = Post.find(params[:id])
      end

      def post_params
        params.require(:post).permit(:attachment, :content, :user_id)
      end
  end
end