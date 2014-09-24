class RacesController < ApplicationController
  def index
    @races = Race.all
    return @races, @character
  end

  def create
    @race = Race.find_by id: params[:character][:race]
    @character.race = @race
    unless @race == nil
      if @character.save!
        flash.notice = "Your Character's race was saved!"
        redirect_to character_classes_path(@character)
      else
        flash.alert = "Your Character could not be saved."
        redirect_to character_races_path(@character)
      end
    else
      flash.alert = "Your Character could not be saved."
      redirect_to character_races_path(@character)
    end
  end

end
