class AspectsController < ApplicationController
  before_action :set_aspect, only: [:show, :update, :destroy]

  # GET /aspects
  def index
    @aspects = Aspect.all

    render jsonapi: @aspects
  end

  # GET /aspects/1
  def show
    render jsonapi: @aspect
  end

  # POST /aspects
  def create
    @aspect = Aspect.new(aspect_params)

    if @aspect.save
      render jsonapi: @aspect, status: :created, location: @aspect
    else
      render jsonapi: @aspect.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /aspects/1
  def update
    if @aspect.update(aspect_params)
      render jsonapi: @aspect
    else
      render jsonapi: @aspect.errors, status: :unprocessable_entity
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
      ActiveModelSerializers::Deserialization.jsonapi_parse!(params, only: [:name, :label])
    end
end
