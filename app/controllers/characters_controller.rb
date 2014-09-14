class CharactersController < ApplicationController
  def new
    @character = current_user.characters.create!
    @character
  end
end
