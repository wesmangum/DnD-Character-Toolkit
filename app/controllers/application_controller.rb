class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :fetch_character
  skip_before_filter :fetch_character, except: [:devise_controller?, :contacts_controller?, :home_controller?]
  before_filter :check_for_user
  skip_before_filter :check_for_user, except: [:devise_controller?, :contacts_controller?, :home_controller?]
  before_filter :finalized
  skip_before_filter :finalized, except: [:devise_controller?, :contacts_controller?, :home_controller?]

  attr_accessor :character

  def check_for_user
    unless current_user
      flash.notice = "You must be Logged in to perform that action."
      redirect_to root_path
    end
  end

  def fetch_character
    if params[:character_id]
      @character = Character.find_by id: params[:character_id]
    else
      @character = Character.find_by id: params[:id]
    end
    unless current_user == @character.user
      flash.notice = "You are not authorized to visit this page."
      redirect_to root_path
    end
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
