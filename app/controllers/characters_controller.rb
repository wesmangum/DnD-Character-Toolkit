class CharactersController < ApplicationController
  def new
    @character = current_user.characters.create!
    redirect_to character_races_path(@character)
  end
end
