class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :fetch_character
  before_filter :finalized

  attr_accessor :character

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
