class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in @user
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      redirect_to user_path(@user)
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to user_path(@user)
    end
  end

  def twitter
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in @user
      set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
      redirect_to user_path(@user)
    else
      session["devise.twitter_data"] = request.env["omniauth.auth"]
      redirect_to user_path(@user)
    end
  end
end