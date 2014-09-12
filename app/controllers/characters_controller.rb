class CharactersController < ApplicationController
  def new
    @character = Character.new()
    @character.save
    @character
  end
end
