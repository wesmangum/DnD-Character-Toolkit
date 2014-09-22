class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :fetch_character
  before_filter :check_for_user
  skip_before_filter :check_for_user, if: :devise_controller?
  before_filter :finalized

  attr_accessor :character

  def check_for_user
    unless current_user
      flash.notice = "You must be Logged in to perform that action."
      redirect_to root_path
    end
  end

  def fetch_character
    @character = Character.find_by id: params[:character_id]
  end

  def finalized
    if @character
      if @character.finalized?
        flash.notice = "Sorry, that character has been finalized. Finalized characters cannot be edited."
        redirect_to user_path(current_user)
      end
    end
  end
end
