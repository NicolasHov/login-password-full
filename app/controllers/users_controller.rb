class UsersController < ApplicationController
  
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.create(user_params)
  	if @user.save
  		redirect_to user_path(@user)
  	else
  		render 'new'
  	end
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update
  	redirect_to users_path
  end

  def destroy
  	@user = User.find(params[:id])
    @user.destroy
    redirect_to users_path 
  end

private

	def user_params
		params.permit(:name, :email, :password, :password_confirmation)
	end

end

