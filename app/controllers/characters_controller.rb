class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :update, :destroy]

  # GET /characters
  def index
    @characters = Character.all

    render jsonapi: @characters
  end

  # GET /characters/1
  def show
    render jsonapi: @character
  end

  # POST /characters
  def create
    logger.info "request: #{params.inspect}"
    @character = Character.new(character_params)

    if @character.save
      render jsonapi: @character, status: :created, location: @character
    else
      render jsonapi: @character.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /characters/1
  def update
    if @character.update(character_params)
      render jsonapi: @character
    else
      render jsonapi: @character.errors, status: :unprocessable_entity
    end
  end

  # DELETE /characters/1
  def destroy
    @character.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def character_params
      ActiveModelSerializers::Deserialization.jsonapi_parse!(params, only: [:name, :fate_points, :refresh])
    end
end
