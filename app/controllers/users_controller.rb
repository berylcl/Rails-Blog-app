class UsersController < ApplicationController
  before_action :find_user, only: [:show]

  def index
    @users = User.all
  end

  def show
    @three_recent_posts = @user.recent_posts
  end

  def new; end

  def find_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'Users not found'
    redirect_to users_path
  end
end
