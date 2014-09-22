class HomeController < ApplicationController
  skip_before_filter :check_for_user
  skip_before_filter :fetch_character
  skip_before_filter :finalized

  def index
  end
end
