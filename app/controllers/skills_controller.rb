class SkillsController < ApplicationController
  before_action :set_skill, only: [:show, :update, :destroy]

  # GET /skills
  def index
    @skills = Skill.all

    render jsonapi: @skills
  end

  # GET /skills/1
  def show
    render jsonapi: @skill
  end

  # POST /skills
  def create
    @skill = Skill.new(skill_params)

    if @skill.save
      render jsonapi: @skill, status: :created, location: @skill
    else
      render jsonapi: @skill.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /skills/1
  def update
    if @skill.update(skill_params)
      render jsonapi: @skill
    else
      render jsonapi: @skill.errors, status: :unprocessable_entity
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
      ActiveModelSerializers::Deserialization.jsonapi_parse!(params, only: [:name, :level])
    end
end
