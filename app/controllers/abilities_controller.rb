class AbilitiesController < ApplicationController
  respond_to :html, :js

  def index
    @character = Character.find_by id: params[:character_id]
  end

  def generate
    @character = Character.find_by id: params[:character_id]
    @abilities = []
    6.times do
      scores = [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]
      score = scores.sample
      @abilities << score
    end
    session[:abilities] = @abilities
    @abilities
  end

  def create
    @character = Character.find_by id: params[:character_id]
    @abilities = session[:abilities]

    if @character.abilities_match?(ability_params, @abilities)
      if @character.update_attributes(ability_params)
        flash.notice = "Your Character's abilities were saved!"
        redirect_to character_abilities_path(@character)
      else
        flash.notice = "Your Character could not be saved."
        redirect_to character_abilities_path(@character)
      end
    else
      flash.notice = "You may only assign each value once!"
      redirect_to character_abilities_path(@character)
    end
  end

  private

  def ability_params
    params.require(:character).permit(:str, :dex, :const, :wis, :int, :cha)
  end
end