# frozen_string_literal: true
class UsersController < ApplicationController
  def index
    @users = user.paginate(page: params[:page], per_page: 5)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page], per_page: 5)
  end

  def edit
    @user = User.find(params[:id])
  end

  def search
    @query = params[:query]
    @users = User.where('email LIKE ?', ["%#{@query}%"])
    @users = @users.order('users.created_at DESC')
  end

  def require_same_blogger
    if current_user != @user
      flash[:alert] = 'You can only edit your own account'
      redirect_to @user
    end
  end

end