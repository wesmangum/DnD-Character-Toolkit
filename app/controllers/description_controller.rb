class DescriptionController < ApplicationController
  def index
    @character = Character.find_by id: params[:character_id]
  end
end