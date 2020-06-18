class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]

  def show
    @articles = Article.where(:user_id => @user.id).paginate(page: params[:page], per_page: 3)
  end

  def destroy
    @user = User.find(user_params[:id])
    @user.destroy
    flash[:danger] = "User and all articles created by the user have been deleted."
    redirect_to users_path
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 3)
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to the Alpha Blog #{@user.username}. You have successfully signed up."
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your account was updated successfully"
      redirect_to @user
    else
      render 'edit'
    end

  end

  private

  def user_params
    params.require(:user).permit(:username,:email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if helpers.current_user != @user && !helpers.current_user.admin?
      flash[:danger] = "You can only edit your own profile"
      redirect_to root_path
    end
  end

  def require_admin
    if helpers.logged_in? && !helpers.current_user.admin?
      flash[:danger] = "You must be an admin to perform that action"
      redirect_to root_path
    end
  end
end