class SkillsController < ApplicationController
  def index
    @skills = Skill.all
  end

  def show
    @skill = Skill.find_by(id: params[:id])
  end

  private

  def skill_params
    params.require(:skill).permit(:name)
  end
end
