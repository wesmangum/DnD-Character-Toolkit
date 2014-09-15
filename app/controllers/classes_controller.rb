class ClassesController < ApplicationController
  def index
    @character = Character.find_by id: params[:character_id]
    @classes = DdClass.all
    return @classes, @character
  end

  def create
    @character = Character.find_by id: params[:character_id]
    @class = DdClass.find_by id: params[:character][:class]
    @character.dd_class = @class
    if @character.save!
      flash.notice = "Your Character's class was saved!"
      redirect_to character_abilities_path(@character), method: 'post'
    else
      flash.notice = "Your Character could not be saved."
      render character_classes_path(@character)
    end
  end

end
