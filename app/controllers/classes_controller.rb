class ClassesController < ApplicationController
  def index
    @classes = DdClass.all
    return @classes, @character
  end

  def create
    @class = DdClass.find_by id: params[:character][:class]
    @character.dd_class = @class
    unless @class == nil
      if @character.save!
        flash.notice = "Your Character's class was saved!"
        redirect_to character_abilities_path(@character), method: 'post'
      else
        flash.notice = "Your Character could not be saved."
        redirect_to character_classes_path(@character)
      end
    else
      flash.notice = "Your Character could not be saved."
      redirect_to character_classes_path(@character)
    end
  end

  def show
    @class = DdClass.find_by id: params[:id]
    render partial: "show"
  end

end
