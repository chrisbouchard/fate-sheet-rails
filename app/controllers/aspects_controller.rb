class AspectsController < ApplicationController
  before_action :set_aspect, only: [:show, :update, :destroy]

  # GET /aspects
  def index
    @aspects = Aspect.all

    # TODO: Filter include for security?
    render jsonapi: @aspects, include: params[:include]
  end

  # GET /aspects/1
  def show
    # TODO: Filter include for security?
    render jsonapi: @aspect, include: params[:include]
  end

  # POST /aspects
  def create
    @aspect = Aspect.new(aspect_params)

    if @aspect.save
      render jsonapi: @aspect, status: :created, location: @aspect
    else
      # Based on https://github.com/rails-api/active_model_serializers/blob/v0.10.6/docs/jsonapi/errors.md
      render jsonapi: @aspect, status: :unprocessable_entity,
        serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # PATCH/PUT /aspects/1
  def update
    if @aspect.update(aspect_params)
      render jsonapi: @aspect
    else
      # Based on https://github.com/rails-api/active_model_serializers/blob/v0.10.6/docs/jsonapi/errors.md
      render jsonapi: @aspect, status: :unprocessable_entity,
        serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # DELETE /aspects/1
  def destroy
    @aspect.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aspect
      @aspect = Aspect.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def aspect_params
      # Based on https://github.com/rails-api/active_model_serializers/issues/1858
      # and https://github.com/rails-api/active_model_serializers/blob/v0.10.6/docs/general/deserialization.md
      ActiveModelSerializers::Deserialization.jsonapi_parse!(params, only: [:name, :label])
    end
end
