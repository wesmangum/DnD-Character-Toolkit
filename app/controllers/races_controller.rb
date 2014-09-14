class RacesController < ApplicationController
  def index
    @character = Character.find_by id: params[:character_id]
    @races = Race.all
    return @races, @character
  end

  def create
    @character = Character.find_by id: params[:character_id]
    @race = Race.find_by params[:character][:race_id]
    @character.race = @race
    if @character.save!
      flash.notice = "Your Character's race was saved!"
      redirect_to character_classses_path(@character)
    else
      flash.notice = "Your Character could not be saved."
      render character_races_path(@character)
    end
  end

end
