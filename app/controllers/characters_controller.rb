class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :update, :destroy]

  # GET /characters
  def index
    @characters = Character.all

    # TODO: Filter include for security?
    render jsonapi: @characters, include: params[:include]
  end

  # GET /characters/1
  def show
    # TODO: Filter include for security?
    render jsonapi: @character, include: params[:include]
  end

  # POST /characters
  def create
    @character = Character.new(character_params)

    if @character.save
      render jsonapi: @character, status: :created, location: @character
    else
      # Based on https://github.com/rails-api/active_model_serializers/blob/v0.10.6/docs/jsonapi/errors.md
      render jsonapi: @character, status: :unprocessable_entity,
        serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # PATCH/PUT /characters/1
  def update
    if @character.update(character_params)
      render jsonapi: @character
    else
      # Based on https://github.com/rails-api/active_model_serializers/blob/v0.10.6/docs/jsonapi/errors.md
      render jsonapi: @character, status: :unprocessable_entity,
        serializer: ActiveModel::Serializer::ErrorSerializer
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
      # Based on https://github.com/rails-api/active_model_serializers/issues/1858
      # and https://github.com/rails-api/active_model_serializers/blob/v0.10.6/docs/general/deserialization.md
      ActiveModelSerializers::Deserialization.jsonapi_parse!(params, only: [:name, :fate_points, :refresh])
    end
end
