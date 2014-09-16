class SkillsController < ApplicationController
  def index
    @character = Character.find_by id: params[:character_id]
    @modifiers = @character.modifiers
  end
end