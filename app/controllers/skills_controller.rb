class SkillsController < ApplicationController
  before_action :set_skill, only: [:show, :update, :destroy]

  # GET /skills
  def index
    @skills = Skill.all

    # TODO: Filter include for security?
    render jsonapi: @skills, include: params[:include]
  end

  # GET /skills/1
  def show
    # TODO: Filter include for security?
    render jsonapi: @skill, include: params[:include]
  end

  # POST /skills
  def create
    @skill = Skill.new(skill_params)

    if @skill.save
      render jsonapi: @skill, status: :created, location: @skill
    else
      # Based on https://github.com/rails-api/active_model_serializers/blob/v0.10.6/docs/jsonapi/errors.md
      render jsonapi: @skill, status: :unprocessable_entity,
        serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # PATCH/PUT /skills/1
  def update
    if @skill.update(skill_params)
      render jsonapi: @skill
    else
      # Based on https://github.com/rails-api/active_model_serializers/blob/v0.10.6/docs/jsonapi/errors.md
      render jsonapi: @skill, status: :unprocessable_entity,
        serializer: ActiveModel::Serializer::ErrorSerializer
    end
  end

  # DELETE /skills/1
  def destroy
    @skill.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skill
      @skill = Skill.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def skill_params
      # Based on https://github.com/rails-api/active_model_serializers/issues/1858
      # and https://github.com/rails-api/active_model_serializers/blob/v0.10.6/docs/general/deserialization.md
      ActiveModelSerializers::Deserialization.jsonapi_parse!(params, only: [:name, :level])
    end
end
