class UsersController < ApplicationController
  skip_before_filter :fetch_character
  skip_before_filter :finalized

  def show
    @user = User.find_by id: params[:id]
  end
end