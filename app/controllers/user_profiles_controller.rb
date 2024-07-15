class UserProfilesController < ApplicationController
	def index
		@user_profiles = UserProfile.all
	end

	def new 
		@user_profile = UserProfile.new
	end

	def create
		@user_profile = UserProfile.new(user_profile)
		if @user_profile.save
			redirect_to @user_profile
		else
			render :new, status: :unprocessable_entity
		end
	end

	def show
		@user_profile = UserProfile.find(params[:id])
	end

	def edit
		@user_profile = UserProfile.find(params[:id])
	end

	def update
		@user_profile = UserProfile.find(params[:id])
		if @user_profile.update(user_profile)
			redirect_to user_profile_path
		else
			render :edit , status: :unprocessable_entity
		end
	end

	def destroy
		@user_profile = UserProfile.find(params[:id])
		@user_profile.destroy
		redirect_to user_profiles_path, status: :see_other
	end

	private 
	
	def user_profile
		params.require(:user_profile).permit(:first_name, :last_name, :phone_number, :address)
	end
end
