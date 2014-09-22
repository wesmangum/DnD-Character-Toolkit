class RacesController < ApplicationController
  def index
    @races = Race.all
    return @races, @character
  end

  def create
    @race = Race.find_by id: params[:character][:race]
    @character.race = @race
    if @character.save!
      flash.notice = "Your Character's race was saved!"
      redirect_to character_classes_path(@character)
    else
      flash.notice = "Your Character could not be saved."
      render character_races_path(@character)
    end
  end

end
