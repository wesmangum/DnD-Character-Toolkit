class UsersController < ApplicationController
  skip_before_filter :fetch_character
  skip_before_filter :check_for_user
  skip_before_filter :finalized

  def show
    @user = User.find_by id: params[:id]
    unless current_user == @user
      flash.notice = "You are not authorized to visit this page."
      redirect_to root_path
    end
  end
end