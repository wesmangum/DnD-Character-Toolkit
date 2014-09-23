class CharactersController < ApplicationController
  skip_before_filter :fetch_character, only: [:new]
  skip_before_filter :finalized, only: [:show]

  def approve
    if @character.update_attributes(finalized?: true)
      redirect_to user_path(@character.user)
    else
      flash.notice = "Your Character could not be confirmed."
      redirect_to character_confirm_path(@character)
    end
  end

  def confirm
    @skills = Skill.all
  end

  def new
    @character = current_user.characters.create!
    redirect_to character_races_path(@character)
  end

  def show
    @skills = Skill.all
    return @skills, @character
  end
end
