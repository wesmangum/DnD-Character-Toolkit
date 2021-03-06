class DescriptionController < ApplicationController
  def index
    @skills = Skill.all
  end

  def create
    @character.description = description_params
    if @character.update_attributes(description_params)
      flash.notice = "Your Character's description was saved!"
      redirect_to character_confirm_path(@character)
    else
      flash.alert = @character.errors[:base][0]
      redirect_to character_description_index_path(@character)
    end
  end

  private

  def description_params
    params.require(:character).permit(:name, :sex, :alignment, :height, :weight, :background, :personality, :appearance)
  end
end