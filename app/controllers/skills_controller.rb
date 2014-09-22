class SkillsController < ApplicationController
  def index
    @skills = Skill.all
  end

  def create
    @character.skills = skill_params
    if @character.save_skill_points(skill_params)
      flash.notice = "Your Character's skills were saved!"
      redirect_to character_description_index_path(@character)
    else
      flash.alert = @character.errors[:base]
      redirect_to character_skills_path(@character)
    end
  end

  private
  def skill_params
    params.require(:character).permit(:climb, :concentration, :heal, :intimidate, :move_silently, :spellcraft)
  end
end