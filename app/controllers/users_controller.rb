# http://blog.remarkablelabs.com/2013/01/how-to-decrease-coupling-in-your-controllers-views-with-decent_exposure-for-better-maintainability
# http://railscasts.com/episodes/259-decent-exposure

class UsersController < ApplicationController
	
	# Typical old style controller methods
	
	# def new
	# 	@user = User.new
	# end

	# def index
	# 	@users = User.all
	# end

	# def create
	# 	@user = User.new(user_params)
	# 	if @user.save
	# 		redirect_to users_path
	# 	else
	# 		render 'new'
	# 	end
	# end

	# def edit
	# 	@user = User.find(params[:id])
	# end

	# def update
	# 	@user = User.find(params[:id])
	# 	if @user.update_attributes(user_params)
	# 		redirect_to users_path
	# 	else			
	# 		render 'edit'
	# 	end
	# end

	#
	# After introducing decent_exposure gem and its expose method
	#
	
	expose(:users)

	expose(:user, attributes: :user_params)
	# This simple declaration makes a few assumptions about your environment:
 	# 1. There is an object named User
 	# 2. User has a .find method that takes an id
 	# 3. There is a params method that returns a Hash-like structure which has either an id key or a user_id key.
	def create
    if user.save
      redirect_to users_path
    else
      render 'new'
    end
  end
  
  def update
    if user.save
      redirect_to users_path
    else
      render 'edit'
    end
  end

	private

	def user_params
		params.require(:user).permit!
	end
end

