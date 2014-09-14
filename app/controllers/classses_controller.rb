class ClasssesController < ApplicationController
  def index
    @character = Character.find_by id: params[:character_id]
    @classes = Classs.all
    return @classes, @character
  end

  # def create
  #   @character = Character.find_by id: params[:character_id]
  #   @race = Race.find_by params[:character][:race_id]
  #   @character.race = @race
  #   if @character.save!
  #     binding.pry
  #     flash.notice = "Your Character's race was saved!"
  #     redirect_to character_classes_path(@character), method: 'post'
  #   else
  #     flash.notice = "Your Character could not be saved."
  #     render character_races_path(@character)
  #   end
  # end

end
