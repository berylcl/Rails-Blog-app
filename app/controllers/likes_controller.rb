class LikesController < ApplicationController
  before_action :find_user_and_post

  def index
    @posts = @user.posts
  end

  def show; end

  def new
    @user = current_user
    @like = @post.likes.new
  end

  def like
    @like = @post.likes.new
    @like.author = current_user
    @like.save
    redirect_to user_post_path(@user, @post)
  end

  def unlike
    @like = @post.likes.find_by(post: @post)
    @like&.destroy
    redirect_to user_post_path(@user, @post)
  end

  private

  def find_user_and_post
    @user = User.find(params[:user_id])
    @post = @user.posts.find_by(id: params[:post_id])
  end
end
