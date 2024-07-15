class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user.present? && user.password_digest == params[:password]
      session[:user_id] = user.id
      user.update(device_type: detect_device_type(request.user_agent)) unless user.device_type 
      flash[:notice] = "Logged in successfully."
      redirect_to user
    else
      flash.now[:alert] = "Invalid email or password."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been logged out."
    redirect_to root_path
  end

  private

  def detect_device_type(user_agent)
    user_agent = user_agent.to_s.downcase
    if user_agent.match?(/android/)
      'Mobile (Android)'
    elsif user_agent.match?(/iphone|ipad/)
      'Mobile (iOS)'
    elsif user_agent.match?(/windows phone/)
      'Mobile (Windows Phone)'
    elsif user_agent.match?(/tablet|ipad/)
      'Tablet'
    elsif user_agent.match?(/macintosh|mac os x/)
      'Laptop (Mac)'
    elsif user_agent.match?(/windows/)
      'Laptop (Windows)'
    elsif user_agent.match?(/linux/)
      'Laptop (Linux)'
    else
      'Other'
    end
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
