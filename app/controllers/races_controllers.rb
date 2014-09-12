class RacesController < ApplicationController
  def new
    @character = Character.where(id: params[:character_id])
  end

end
