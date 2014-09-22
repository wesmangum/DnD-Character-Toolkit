class CharactersController < ApplicationController
  def approve
    @character = Character.find_by id: params[:character_id]
    if @character.update_attributes(finalized?: true)
      redirect_to user_path(@character.user)
    else
      flash.notice = "Your Character could not be confirmed."
      redirect_to character_confirm_path(@character)
    end
  end

  def confirm
    @character = Character.find_by id: params[:character_id]
    @skills = Skill.all
  end

  def new
    @character = current_user.characters.create!
    redirect_to character_races_path(@character)
  end
end
