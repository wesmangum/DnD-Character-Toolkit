class SkillsController < ApplicationController
  def index
    @character = Character.find_by id: params[:character_id]
    @skills = Skill.all
  end
end